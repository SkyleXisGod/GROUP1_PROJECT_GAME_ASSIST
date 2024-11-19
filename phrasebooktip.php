<?php
session_start();
// Połączenie z bazą danych
$servername = "localhost";  // Zmień, jeśli Twój serwer jest inny
$username = "root";         // Nazwa użytkownika bazy danych
$password = "";             // Hasło użytkownika bazy danych
$dbname = "gameassistandb";      // Nazwa bazy danych

// Połączenie z bazą danych
$conn = new mysqli($servername, $username, $password, $dbname);

// Sprawdzenie połączenia
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Zapytanie SQL do pobrania jednej losowej porady
$sql = "SELECT TIPID, DESCRIPTION FROM tips ORDER BY RAND() LIMIT 1";
$result = $conn->query($sql);

// Sprawdzenie, czy wynik istnieje
if ($result->num_rows > 0) {
    // Pobieranie jednej porady
    $row = $result->fetch_assoc();
    $tipDescription = $row['DESCRIPTION'];
} else {
    $tipDescription = "Brak porad w bazie danych.";
}

// Zamknięcie połączenia z bazą danych
$conn->close();
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Porada z Valorant</title>
    <link rel="stylesheet" type="text/css" href="tipsbox.css">
    <link rel="stylesheet" type="text/css" href="gamelikecss.css">
    <link rel="stylesheet" type="text/css" href="profilelist.css">
    <script src="profilelist.js"></script>
    <script>
        // Przekierowanie na index.php po 7 sekundach
        setTimeout(function() {
            window.location.href = 'booksindex.php'; // Zmień na swoją stronę docelową
        }, 7000); // 7000 ms = 7 sekund
    </script>
</head>
<body>

<div class="dashboardheaderdiv">
    <div class="dashboardleftheaderdiv">
        <img src="radiant-rank.png" style="width: 75px;height: 75px;"><br><br>
        <h5 class="glow2">SkillShot Academy</h5><br>
    </div>
    <div class="dashboardrightheaderdiv">
        <!-- Sekcja profilowa z rozwijalnym menu ustawień -->
        <div class="profile-container">
            <!-- Nagłówek profilu -->
            <div class="profile-header" onclick="toggleSettings()">
                <?php
                    // Sprawdzamy, czy użytkownik jest zalogowany
                    if (isset($_SESSION['username'])) {
                        // Łączenie z bazą danych
                        $host = 'localhost';
                        $dbusername = 'root';
                        $dbpassword = '';
                        $dbname = 'gameassistandb';
                        $conn = new mysqli($host, $dbusername, $dbpassword, $dbname);

                        // Sprawdzamy połączenie
                        if ($conn->connect_error) {
                            die("Połączenie z bazą danych nieudane: " . $conn->connect_error);
                        }

                        // Pobieramy username z sesji
                        $username = $_SESSION['username'];

                        // Pobieramy USERID na podstawie username
                        $sql = "SELECT u.ID, p.PROFILEPICFILE 
                                FROM users u
                                LEFT JOIN profilepics p ON u.ID = p.USERID
                                WHERE u.username = ?";
                        $stmt = $conn->prepare($sql);
                        $stmt->bind_param('s', $username);
                        $stmt->execute();
                        $result = $stmt->get_result();

                        // Jeśli użytkownik istnieje i ma zdjęcie profilowe
                        if ($result->num_rows > 0) {
                            $row = $result->fetch_assoc();
                            $profilePic = $row['PROFILEPICFILE'] ? 'data:image/jpeg;base64,' . base64_encode($row['PROFILEPICFILE']) : 'https://via.placeholder.com/50';
                        } else {
                            // Jeśli brak zdjęcia profilowego, ustawiamy placeholder
                            $profilePic = 'https://via.placeholder.com/50';
                        }

                        // Zamykamy połączenie z bazą danych
                        $conn->close();
                    } else {
                        // Jeśli brak sesji użytkownika, ustawiamy placeholder
                        $profilePic = 'https://via.placeholder.com/50';
                    }
                ?>
                <!-- Wyświetlamy zdjęcie profilowe -->
                <img src="<?php echo $profilePic; ?>" alt="Profil" class="profile-img">
                <span class="username"><?php echo $_SESSION['username']; ?></span>
            </div>

            <!-- Lista ustawień -->
            <div class="settings-list" id="settingsList">
                <ul>
                    <li><a href="usersettings.php">Ustawienia konta</a></li>
                    <li><a href="change_password_form.php">Zmiana hasła</a></li>
                    <li><a href="siteinformations.php">Statystyki!</a></li>
                    <li><a href="logout.php">Wyloguj się</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="tipsmaindiv">
<div class="tip-box">
    <h2>Porada na dzisiaj</h2>
    <p><?php echo $tipDescription; ?></p>

    <div id="tip">Pozostało 5 sekund...</div>

<script>
    let seconds = 5; // Startujemy od 5 sekund

    // Funkcja, która będzie odliczać i aktualizować tekst
    const countdown = setInterval(function() {
        // Zaktualizuj tekst w divie
        document.getElementById('tip').innerText = `Pozostało ${seconds} sekund...`;

        // Jeśli czas dobiegnie końca
        if (seconds === 0) {

            clearInterval(countdown); // Zatrzymaj odliczanie
        } else {
            // Zmniejsz czas o 1 sekundę
            seconds--;
        }
    }, 1000); // Odliczanie co 1 sekundę (1000 ms)

</script>
</div></div>

</body>
</html>