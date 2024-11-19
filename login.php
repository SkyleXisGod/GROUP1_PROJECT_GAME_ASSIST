<?php
session_start();
require_once 'config.php'; // Zakładając, że w config.php masz już ustawione połączenie z bazą danych
echo '<link rel="stylesheet" type="text/css" href="gamelikecss.css">';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Sprawdzenie, czy pola zostały wypełnione
    if (isset($_POST['username']) && isset($_POST['password'])) {
        // Pobranie danych z formularza
        $username = $_POST['username'];
        $password = $_POST['password'];

        // Sprawdzanie danych użytkownika
        $stmt = $pdo->prepare("SELECT * FROM users WHERE USERNAME = ?");
        $stmt->execute([$username]);
        $user = $stmt->fetch();

        if ($user && password_verify($password, $user['PASSWORD'])) {
            // Zapisujemy dane użytkownika w sesji
            $_SESSION['username'] = $user['USERNAME'];
            $userId = $user['ID']; // ID użytkownika

            // Zaktualizowanie tabeli 'visit_counts'
            // Najpierw sprawdzamy, czy użytkownik ma już wpis w tabeli 'visit_counts'
            $stmt = $pdo->prepare("SELECT * FROM visit_counts WHERE USERID = ?");
            $stmt->execute([$userId]);
            $visitRecord = $stmt->fetch();

            if ($visitRecord) {
                // Obliczanie różnicy czasu w godzinach między ostatnią wizytą a obecną
                $lastVisit = new DateTime($visitRecord['last_visit']);
                $now = new DateTime();
                $interval = $lastVisit->diff($now);
                $hoursDiff = $interval->h + ($interval->days * 24); // Całkowita liczba godzin

                // Jeśli minęło 12 godzin lub więcej od ostatniego logowania, aktualizujemy dane
                if ($hoursDiff >= 12) {
                    // Inkrementujemy licznik wizyt i aktualizujemy datę ostatniej wizyty
                    $stmt = $pdo->prepare("UPDATE visit_counts SET visit_count = visit_count + 1, last_visit = NOW() WHERE USERID = ?");
                    $stmt->execute([$userId]);
                }
            } else {
                // Jeśli rekord nie istnieje, dodajemy nowy wpis
                $stmt = $pdo->prepare("INSERT INTO visit_counts (USERID, last_visit, visit_count) VALUES (?, NOW(), 1)");
                $stmt->execute([$userId]);
            }

            // Zaktualizowanie tabeli 'global_visit_count'
            // Zwiększamy całkowity licznik wizyt
            $stmt = $pdo->prepare("UPDATE global_visit_count SET total_visits = total_visits + 1");
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