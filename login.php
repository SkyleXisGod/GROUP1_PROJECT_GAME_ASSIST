<?php
session_start();
require_once 'config.php'; // Zakładając, że w config.php masz już ustawione połączenie z bazą danych
echo '<link rel="stylesheet" type="text/css" href="gamelikecss.css">';

$conn = getDBConnection(); // Połączenie z bazą danych

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Sprawdzenie, czy pola zostały wypełnione
    if (isset($_POST['username']) && isset($_POST['password'])) {
        // Pobranie danych z formularza
        $username = $_POST['username'];
        $password = $_POST['password'];

        // Sprawdzanie danych użytkownika
        $stmt = $conn->prepare("SELECT * FROM users WHERE USERNAME = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();
        $user = $result->fetch_assoc();

        if ($user && password_verify($password, $user['PASSWORD'])) {
            // Zapisujemy dane użytkownika w sesji
            $_SESSION['username'] = $user['USERNAME'];
            $userId = $user['ID']; // ID użytkownika

            // Sprawdzamy, kiedy użytkownik ostatni raz odwiedził stronę
            $stmtCheckVisit = $conn->prepare("SELECT last_visit, visit_count FROM visit_counts WHERE USERID = ?");
            $stmtCheckVisit->bind_param("i", $userId);
            $stmtCheckVisit->execute();
            $visitResult = $stmtCheckVisit->get_result()->fetch_assoc();

            // Jeśli użytkownik nie ma jeszcze rekordu w tabeli visit_counts
            if (!$visitResult) {
                $lastVisit = "Pierwsza wizyta";  // Wartość domyślna dla nowych użytkowników
                $visitCount = 1; // Liczba wizyt to 1
                // Dodajemy nowy rekord w tabeli
                $sqlInsertVisit = "INSERT INTO visit_counts (USERID, visit_count, last_visit) VALUES (?, 1, NOW())";
                $stmtInsertVisit = $conn->prepare($sqlInsertVisit);
                $stmtInsertVisit->bind_param("i", $userId);
                $stmtInsertVisit->execute();
            } else {
                // Jeśli użytkownik ma rekord w tabeli, sprawdzamy, kiedy była ostatnia wizyta
                $lastVisit = $visitResult['last_visit'];
                $visitCount = $visitResult['visit_count'];
            }

            // Obliczanie rangi użytkownika na podstawie liczby wizyt
            $rank = floor($visitCount / 10);  // Co 10 wizyt, ranga rośnie

            // Sprawdzamy, czy użytkownik ma już przypisaną rangę w tabeli `user_ranks`
            $stmtCheckRank = $conn->prepare("SELECT rank FROM user_ranks WHERE user_id = ?");
            $stmtCheckRank->bind_param("i", $userId);
            $stmtCheckRank->execute();
            $rankResult = $stmtCheckRank->get_result()->fetch_assoc();

            if ($rankResult) {
                // Użytkownik ma już rangę, aktualizujemy ją
                $stmtUpdateRank = $conn->prepare("UPDATE user_ranks SET rank = ? WHERE user_id = ?");
                $stmtUpdateRank->bind_param("ii", $rank, $userId);
                $stmtUpdateRank->execute();
            } else {
                // Użytkownik nie ma jeszcze przypisanej rangi, dodajemy nowy rekord
                $stmtInsertRank = $conn->prepare("INSERT INTO user_ranks (user_id, rank) VALUES (?, ?)");
                $stmtInsertRank->bind_param("ii", $userId, $rank);
                $stmtInsertRank->execute();
            }
            
            // Sprawdzamy, czy użytkownik ma już wpis w tabeli 'visit_counts'
            $stmt = $conn->prepare("SELECT * FROM visit_counts WHERE USERID = ?");
            $stmt->bind_param("i", $userId);
            $stmt->execute();
            $visitRecord = $stmt->get_result()->fetch_assoc();

            if ($visitRecord) {
                // Obliczanie różnicy czasu w godzinach między ostatnią wizytą a obecną
                $lastVisit = new DateTime($visitRecord['last_visit']);
                $now = new DateTime();
                $interval = $lastVisit->diff($now);
                $hoursDiff = $interval->h + ($interval->days * 24); // Całkowita liczba godzin

                // Jeśli minęło 12 godzin lub więcej od ostatniego logowania, aktualizujemy dane
                if ($hoursDiff >= 12) {
                    // Inkrementujemy licznik wizyt i aktualizujemy datę ostatniej wizyty
                    $stmt = $conn->prepare("UPDATE visit_counts SET visit_count = visit_count + 1, last_visit = NOW() WHERE USERID = ?");
                    $stmt->bind_param("i", $userId);
                    $stmt->execute();
                }
            } else {
                // Jeśli rekord nie istnieje, dodajemy nowy wpis
                $stmt = $conn->prepare("INSERT INTO visit_counts (USERID, last_visit, visit_count) VALUES (?, NOW(), 1)");
                $stmt->bind_param("i", $userId);
                $stmt->execute();
            }

            // Zaktualizowanie tabeli 'global_visit_count'
            // Zwiększamy całkowity licznik wizyt
            $stmt = $conn->prepare("UPDATE global_visit_count SET total_visits = total_visits + 1");
            $stmt->execute();

            // Przekierowanie użytkownika do dashboard
            header("Location: dashboard.php");
            exit();
        } else {
            die('Błędna nazwa użytkownika lub hasło.');
        }
    } else {
        // Jeśli dane nie zostały wysłane lub są puste
        echo 'Proszę wypełnić wszystkie pola.';
    }
}
?>
