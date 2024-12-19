<?php
session_start();

// Połączenie z bazą danych
include "config.php";

$conn = getDBConnection();

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
    <title>Porada z Valorant</title>
    <link rel="stylesheet" type="text/css" href="tipsbox.css">
    <link rel="stylesheet" type="text/css" href="gamelikecss.css">
    <link rel="stylesheet" type="text/css" href="profilelist.css">
    <script src="profilelist.js"></script>
    <script>
        // Przekierowanie na index.php po 7 sekundach
        setTimeout(function() {
            window.location.href = 'crosshairindex.php';
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
        <div class="profile-container">
            <div class="profile-header" onclick="toggleSettings()">
                <img src="<?php echo $profilePic; ?>" alt="Profil" class="profile-img">
                <span class="username"><?php echo $username; ?></span>
            </div>

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

<div class="tipsmaindiv">
    <div class="tip-box">
        <h2>Porada na dzisiaj</h2>
        <p><?php echo $tipDescription; ?></p>

        <div id="tip">Pozostało 5 sekund...</div>

        <script>
            let seconds = 5;
            const countdown = setInterval(function() {
                document.getElementById('tip').innerText = `Pozostało ${seconds} sekund...`;
                if (seconds === 0) {
                    clearInterval(countdown);
                } else {
                    seconds--;
                }
            }, 1000);
        </script>
    </div>
</div>

</body>
</html>
