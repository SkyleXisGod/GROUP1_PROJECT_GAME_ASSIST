<?php
session_start();

// Sprawdzamy, czy użytkownik jest zalogowany
if (isset($_SESSION['username'])) {
    // Połączenie z bazą danych (przykład z MySQLi)
    $mysqli = new mysqli("localhost", "root", "", "gameassistandb");

    if ($mysqli->connect_error) {
        die("Błąd połączenia z bazą danych: " . $mysqli->connect_error);
    }

    // Pobieramy nazwę użytkownika z sesji
    $username = $_SESSION['username'];

    // Przygotowujemy zapytanie SQL, aby sprawdzić rolę użytkownika
    $stmt = $mysqli->prepare("SELECT ROLEID FROM users WHERE username = ?");
    $stmt->bind_param("s", $username); // 's' oznacza typ zmiennej - string
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($role_id);

    // Jeśli użytkownik istnieje
    if ($stmt->num_rows > 0) {
        $stmt->fetch();

        // Sprawdzamy, czy użytkownik ma rolę 'user+' (role_id = 3)
        if ($role_id == 3 || $role_id == 1) {
            // Jeśli użytkownik ma odpowiednią rolę, strona jest odblokowana
            $lastVisit = "Brak danych";  // Domyślna wartość, jeśli użytkownik nie ma jeszcze rekordu w tabeli

            // Połączenie z bazą danych
            $host = 'localhost';
            $username = 'root';  // Zmień na swoją nazwę użytkownika MySQL
            $password = '';      // Zmień na swoje hasło MySQL
            $dbname = 'gameassistandb';
            $conn = new mysqli($host, $username, $password, $dbname);

            // Sprawdzamy połączenie
            if ($conn->connect_error) {
                die("Połączenie z bazą danych nieudane: " . $conn->connect_error);
            }

            // Sprawdzamy, czy użytkownik jest zalogowany
            if (!isset($_SESSION['username'])) {
                die("Musisz być zalogowany, aby wyświetlić tę stronę.");
            }

            // Pobieramy USER_ID na podstawie username z sesji
            $sqlGetUserId = "SELECT ID FROM users WHERE username = ?";
            $stmtGetUserId = $conn->prepare($sqlGetUserId);
            $stmtGetUserId->bind_param('s', $_SESSION['username']);
            $stmtGetUserId->execute();
            $result = $stmtGetUserId->get_result();

            // Sprawdzamy, czy znaleziono użytkownika
            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $userId = $row['ID'];  // Zapisz USER_ID
            } else {
                die("Użytkownik nie znaleziony w bazie danych.");
            }

            // Pobieramy e-mail z tabeli user_info na podstawie USER_ID
            $sqlGetUserEmail = "SELECT additional_info FROM user_info WHERE USER_ID = ?";
            $stmtGetUserEmail = $conn->prepare($sqlGetUserEmail);
            $stmtGetUserEmail->bind_param('i', $userId);
            $stmtGetUserEmail->execute();
            $emailResult = $stmtGetUserEmail->get_result();

            if ($emailResult->num_rows > 0) {
                $emailRow = $emailResult->fetch_assoc();
                $userEmail = $emailRow['additional_info']; // Zapisz e-mail użytkownika
            } else {
                $userEmail = "Brak e-maila"; // Jeśli e-mail nie istnieje
            }

            // Przed sprawdzeniem ostatniej wizyty użytkownika
            $currentDateTime = new DateTime(); // Tworzymy nowy obiekt DateTime

            // Sprawdzamy, kiedy użytkownik ostatni raz odwiedził stronę
            $sqlCheckVisit = "SELECT last_visit, visit_count FROM visit_counts WHERE USERID = ?";
            $stmtCheckVisit = $conn->prepare($sqlCheckVisit);
            $stmtCheckVisit->bind_param('i', $userId);
            $stmtCheckVisit->execute();
            $visitResult = $stmtCheckVisit->get_result();

            // Jeśli użytkownik nie ma jeszcze rekordu w tabeli visit_counts
            if ($visitResult->num_rows === 0) {
                $lastVisit = "Pierwsza wizyta";  // Wartość domyślna dla nowych użytkowników
                $visitCount = 1; // Liczba wizyt to 1
                // Dodajemy nowy rekord w tabeli
                $sqlInsertVisit = "INSERT INTO visit_counts (USERID, visit_count) VALUES (?, 1)";
                $conn->prepare($sqlInsertVisit)->execute();
            } else {
                // Jeśli użytkownik ma rekord w tabeli, sprawdzamy, kiedy była ostatnia wizyta
                $visitData = $visitResult->fetch_assoc();
                $lastVisit = $visitData['last_visit'];
                $visitCount = $visitData['visit_count'];
            }

            // Obliczamy poziom użytkownika (co 10 zalogowań poziom rośnie)
            $level = floor($visitCount / 10);  // Co 10 logowań poziom wzrasta
            $progress = ($visitCount % 10) * 10;  // Procentowy postęp paska (0-100%)

            // Wyświetlanie danych
            echo "<div class='settingsheaderdiv'>";
            echo '<link rel="stylesheet" type="text/css" href="gamelikecss.css">
            <link rel="stylesheet" type="text/css" href="profilelist.css">
            <style>
            .level-bar-container {
                width: 100%; background: #ddd; height: 20px; border-radius: 10px; overflow: hidden;
            }
            .level-bar {
                height: 100%; background: #4caf50; width: 50%; transition: width 0.5s ease;
            }
                </style>
            <div class="tipsmaindiv">
            ';
            echo "<h1>Witaj, " . $_SESSION['username'] . "!</h1>";
            echo "<p><h2>Aktualny e-mail: " . $userEmail . "</p>";
            echo "<p>Liczba Twoich wizyt: " . $visitCount . "</p>";
            echo "<p>Ostatnia wizyta: " . $lastVisit . "</p>";

            // Wyświetlamy level bar
            echo "<div class='level-bar-container'>";
            echo "<div class='level-bar' style='width: $progress%;'></div>";
            $image_level = min($level, 25);  // Poziom nie przekroczy 25
            echo "<img src='ranksystem/level$image_level.png' alt='level' width='50px' height='50px'>";
            echo "</div>";

            // Wyświetlamy globalny licznik odwiedzin
            $sqlGlobalVisitCount = "SELECT total_visits FROM global_visit_count LIMIT 1";
            $resultGlobal = $conn->query($sqlGlobalVisitCount);
            if ($resultGlobal->num_rows > 0) {
                $globalVisitData = $resultGlobal->fetch_assoc();
                $globalVisits = $globalVisitData['total_visits'];
            } else {
                // Jeśli brak rekordów w global_visit_count, tworzymy nowy rekord
                $sqlInsertGlobalVisit = "INSERT INTO global_visit_count (total_visits) VALUES (1)";
                $conn->query($sqlInsertGlobalVisit);
                $globalVisits = 1;
            }

            // Wyświetlamy dane
            echo "<p>Globalny licznik odwiedzin: " . $globalVisits . "</p>";

            // Wyświetlamy aktualną datę i godzinę
            echo "<p>Aktualna data: " . $currentDateTime->format('Y-m-d') . "</p>";
            echo "<p>Aktualny czas: <span id='current-time'>" . $currentDateTime->format('H:i:s') . "</span></p></h2></div><div style='padding-left: 50px;' class='settingstopheaderdiv'>
            <button onclick='window.location.href=";
            echo '"dashboard.php"';
            echo "'>Przejdź do Dashboard</button>
            </div></div>";

            $conn->close();

            echo "<script>
            // Funkcja do aktualizowania godziny co sekundę
            setInterval(function() {
                var now = new Date();
                var hours = now.getHours().toString().padStart(2, '0');
                var minutes = now.getMinutes().toString().padStart(2, '0');
                var seconds = now.getSeconds().toString().padStart(2, '0');
                document.getElementById('current-time').textContent = hours + ':' + minutes + ':' + seconds;
            }, 1000);
            </script>";
        } else {
            echo "Brak dostępu. Twoja rola nie pozwala na przeglądanie tej strony.";
        }
    }

    $stmt->close();
    $mysqli->close();
} else {
    echo "Musisz być zalogowany, aby zobaczyć tę stronę.";
}
?>
