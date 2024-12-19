<?php
session_start();

// Połączenie z bazą danych
function getDBConnection() {
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "gameassistandb";
    
    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    return $conn;
}

// Pobranie losowej porady z bazy danych
function getRandomTip() {
    $conn = getDBConnection();
    $sql = "SELECT TIPID, DESCRIPTION FROM tips ORDER BY RAND() LIMIT 1";
    $result = $conn->query($sql);

    $tipDescription = "Brak porad w bazie danych.";
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $tipDescription = $row['DESCRIPTION'];
    }

    $conn->close();
    return $tipDescription;
}

// Pobranie danych użytkownika, w tym zdjęcia profilowego
function getUserProfileData($username) {
    $conn = getDBConnection();
    $sql = "SELECT u.ID, p.PROFILEPICFILE FROM users u LEFT JOIN profilepics p ON u.ID = p.USERID WHERE u.username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('s', $username);
    $stmt->execute();
    $result = $stmt->get_result();
    
    $profilePic = 'https://via.placeholder.com/50';
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $profilePic = $row['PROFILEPICFILE'] ? 'data:image/jpeg;base64,' . base64_encode($row['PROFILEPICFILE']) : $profilePic;
    }

    $conn->close();
    return $profilePic;
}

// Pobranie roli użytkownika
function getUserRole($username) {
    $conn = getDBConnection();
    $sql = "SELECT ROLEID FROM users WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('s', $username);
    $stmt->execute();
    $result = $stmt->get_result();
    
    $role_id = null;
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $role_id = $row['ROLEID'];
    }

    $conn->close();
    return $role_id;
}

// Jeżeli użytkownik nie jest zalogowany, przekierowanie
if (!isset($_SESSION['username'])) {
    header("Location: index.php");
    exit();
}

$username = $_SESSION['username'];
$profilePic = getUserProfileData($username);
$tipDescription = getRandomTip();
$role_id = getUserRole($username);

// Sprawdzanie dostępu do "Statystyki!"
$lockedIcon = '';
$linkHref = 'siteinformations.php';
$linkClass = '';

    // Jeśli użytkownik nie ma roli user+/admin (role_id == 2), blokujemy dostęp do statystyk
    if ($role_id == 2) {
    $lockedIcon = '<img src="lock-icon.png" alt="Locked" style="width: 16px; height: 16px; margin-left: 5px;">';
    $linkHref = '#';
    $linkClass = 'locked-link';
}
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Twoja Strona</title>
    <link rel="stylesheet" type="text/css" href="gamelikecss.css">
    <link rel="stylesheet" type="text/css" href="profilelist.css">
    <link rel="shortcut icon" href="radiant-rank.png">
    <script src="profilelist.js"></script>
    <style>
    .submaindiv {
        background: #1a1a1a;
        box-shadow: 0 0 5px #58b8f1, 0 0 10px #58b8f1, 0 0 15px #58b8f1;
        align-items: center;
        justify-content: center;
        width: 100%;
        height: 82%;
        display: flex;
        flex-direction: row;
        gap: 20px;  /* Dodajemy odstęp pomiędzy wyspami */
    }
    </style>
</head>
<body>
    <!-- Pasek z informacjami użytkownika -->
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
                    <!-- Wyświetlamy zdjęcie profilowe -->
                    <img src="<?php echo $profilePic; ?>" alt="Profil" class="profile-img">
                    <span class="username"><?php echo $username; ?></span>
                </div>
    
                <!-- Lista ustawień -->
                <div class="settings-list" id="settingsList">
                    <ul>
                        <li><a href="usersettings.php">Ustawienia konta</a></li>
                        <li><a href="change_password_form.php">Zmiana hasła</a></li>
                        <li><a href="<?php echo $linkHref; ?>" class="<?php echo $linkClass; ?>">Statystyki! <?php echo $lockedIcon; ?></a></li>
                        <li><a href="logout.php">Wyloguj się</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
<div class="dashboardmaindiv">
<div class="floating-island" style="flex-direction: row; width: auto;">
    <a href="offangle.php" class="btn">
        OFF-ANGLE <br>
        <img src="angle.jpg" alt="Off-Angle Image" class="btn-img" style="width: 300px;heigth: 300px;">
    </a>
    <a href="rush.php" class="btn">
        ZERG-RUSH <br>
        <img src="rush.jpg" alt="Zerg Rush Image" class="btn-img" style="width: 300px;heigth: 300px;">
    </a>
    <a href="crossfire.php" class="btn">
        CROSS-FIRE <br>
        <img src="pick.jpg" alt="Crossfire Image" class="btn-img" style="width: 300px;heigth: 300px;">
    </a>
    <a href="ekko.php" class="btn">
        EKKO <br>
        <img src="sky.png" alt="Ekko Image" class="btn-img" style="width: 300px;heigth: 300px;">
    </a>
    <a href="meow.php" class="btn">
        PEEK <br>
        <img src="MEOW.gif" alt="MEOW Image" class="btn-img" style="width: 300px;heigth: 300px;">
    </a>
    </div></div>

    <div class="dashboardfooterdiv">
        <div class="dashboardfooterdivleft">
            <h2> 
            <b><i> I N F O: </b></i><br>
            </h2>
        </div>
        <div class="dashboardfooterdivright">
            <a class="linkbut" href="faqindex.html"><img alt="faq-link" src="faq-logo.png" style="width: 60px; height: 50px;"></a><br><br>
            <a class="linkbut" href="https://discord.gg/JjmAzzcxsh"><img alt="discord-server-link" src="discord-logo.png" style="width: 50px; height: 30px;"></a><br><br>
            <a class="linkbut" href="https://www.riotgames.com/pl"><img alt="riot-games-link" src="riot-logo.png" style="width: 50px; height: 50px;"></a><br><br>
            <a class="linkbut" href="https://playvalorant.com/pl-pl/?utm_medium=card2%2Bwww.riotgames.com&utm_source=riotbar"><img alt="valorant-link" src="valorant-logo.png" style="width: 70px; height: 40px;"></a><br><br>
        </div>
    </div>

</body>

</html>