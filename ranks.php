<?php
session_start();

// Połączenie z bazą danych
include "config.php";

$conn = getDBConnection();

// Pobieramy username z sesji
$username = isset($_SESSION['username']) ? $_SESSION['username'] : null;

// Jeśli użytkownik jest zalogowany
if ($username) {
    // Pobieramy dane użytkownika
    $sql = "SELECT u.ID, p.PROFILEPICFILE, u.ROLEID 
            FROM users u
            LEFT JOIN profilepics p ON u.ID = p.USERID
            WHERE u.username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('s', $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $profilePic = $row['PROFILEPICFILE'] ? 'data:image/jpeg;base64,' . base64_encode($row['PROFILEPICFILE']) : 'https://via.placeholder.com/50';
        $role_id = $row['ROLEID'];

        // Jeśli użytkownik ma rolę 'user+' (role_id == 3), działamy dalej
        if ($role_id == 3 || $role_id == 1) {
            // Pobieramy ID użytkownika
            $userId = $row['ID'];

            // Przed sprawdzeniem wizyt, obliczamy aktualną datę i godzinę
            $currentDateTime = new DateTime();

            // Pobieramy dane o wizytach
            $sqlCheckVisit = "SELECT last_visit, visit_count FROM visit_counts WHERE USERID = ?";
            $stmtCheckVisit = $conn->prepare($sqlCheckVisit);
            $stmtCheckVisit->bind_param('i', $userId);
            $stmtCheckVisit->execute();
            $visitResult = $stmtCheckVisit->get_result();

            // Jeśli użytkownik nie ma rekordu, dodajemy nowy
            if ($visitResult->num_rows === 0) {
                $visitCount = 1;
                $lastVisit = "Pierwsza wizyta";
                // Dodajemy nowy rekord w tabeli
                $sqlInsertVisit = "INSERT INTO visit_counts (USERID, visit_count) VALUES (?, 1)";
                $conn->prepare($sqlInsertVisit)->execute();
            } else {
                // Jeśli użytkownik ma rekord, zaktualizuj liczbę wizyt
                $visitData = $visitResult->fetch_assoc();
                $lastVisit = $visitData['last_visit'];
                $visitCount = $visitData['visit_count'];
            }

            // Zwiększamy licznik wizyt
            $visitCount++;
            $sqlUpdateVisitCount = "UPDATE visit_counts SET visit_count = ? WHERE USERID = ?";
            $stmtUpdateVisitCount = $conn->prepare($sqlUpdateVisitCount);
            $stmtUpdateVisitCount->bind_param('ii', $visitCount, $userId);
            $stmtUpdateVisitCount->execute();

            // Obliczamy rangę na podstawie wizyt
            $rank = floor($visitCount / 10);  // Co 10 wizyt, ranga rośnie

            // Sprawdzamy, czy użytkownik ma już przypisaną rangę
            $stmtCheckRank = $conn->prepare("SELECT rank FROM user_ranks WHERE user_id = ?");
            $stmtCheckRank->bind_param('i', $userId);
            $stmtCheckRank->execute();
            $rankResult = $stmtCheckRank->get_result();

            if ($rankResult->num_rows > 0) {
                // Aktualizujemy rangę, jeśli już istnieje
                $stmtUpdateRank = $conn->prepare("UPDATE user_ranks SET rank = ? WHERE user_id = ?");
                $stmtUpdateRank->bind_param('ii', $rank, $userId);
                $stmtUpdateRank->execute();
            } else {
                // W przeciwnym razie, dodajemy nowy rekord z rangą
                $stmtInsertRank = $conn->prepare("INSERT INTO user_ranks (user_id, rank) VALUES (?, ?)");
                $stmtInsertRank->bind_param('ii', $userId, $rank);
                $stmtInsertRank->execute();
            }

            // Przechowywanie danych w sesji
            $_SESSION['profilePic'] = $profilePic;
            $_SESSION['visitCount'] = $visitCount;
            $_SESSION['rank'] = $rank;

            // Możemy przechować inne dane w sesji, jeśli są potrzebne, np. ostatnia wizyta
            $_SESSION['lastVisit'] = $lastVisit;

            // Zamykamy połączenie z bazą danych
            $conn->close();

            // Przekierowanie na stronę użytkownika (np. dashboard)
            header("Location: dashboard.php");
            exit();
        }
    }
}

// Jeśli użytkownik nie jest zalogowany, przekierowujemy na stronę logowania
header("Location: index.php");
exit();
?>
