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
    <title>Off-angle</title>
    <link rel="stylesheet" href="gamelikecss.css">
    <link rel="stylesheet" href="profilelist.css">
    <link rel="stylesheet" href="tips.css">
    <link rel="shortcut icon" href="radiant-rank.png">
    <script src="profilelist.js"></script>
    <style>
        .dashboardleftheaderdiv {
    display: flex;
    flex-direction: row;
    align-items: left; /* Wyrównanie w poziomie */
    justify-content: center; /* Wyrównanie w pionie */
    height: 100%; /* Upewnij się, że wysokość sekcji zajmuje całą dostępną przestrzeń */
    }
    .dashboardleftheaderdiv button {
        margin-left: 600px; /* Usuwa ewentualne marginesy */
    }
    .namediv {
    font-weight: bold;
    font-size: 140%;
}
    </style>
</head>
<body>
    <div class="dashboardheaderdiv">
        <div class="dashboardleftheaderdiv">
            <img src="radiant-rank.png" style="width: 75px;height: 75px;">
            <h5 class="glow2">SkillShot Academy</h5>
            <button onclick='window.location.href="techindex.php"'>Przejdź do indexu</button>
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
    <div class="dashboardmaindiv">
    <div class="floating-island" style="height: auto;>
        <div class="leftdiv">
            <div class="namediv">Off-angle - Jak zaskoczyć przeciwnika?</div>
            <div class="descdiv">
                <p style="float: right; margin: 20px; justify-content: center; align-items: center;"><strong>
                Off Angle</strong> 
                to technika polegająca na przyjęciu nienormalnej, niespodziewanej pozycji podczas ataku lub <br> 
                obrony, która daje graczowi przewagę w starciu z przeciwnikiem. Zamiast stać w typowym miejscu, <br>
                gracze używają mniej oczywistych kątów do obserwowania drogi przeciwnika lub kontrolowania <br> 
                przestrzeni. Offangle może być niezwykle skuteczna, ponieważ nie pozwala wrogowi na łatwe <br> 
                przewidywanie, gdzie gracz może się znajdować. Tego typu techniki zmuszają przeciwników do <br>
                bycia bardziej ostrożnymi i rozważnymi w swoich ruchach, a także utrudniają skuteczne "pre-fire" <br> 
                (strzelanie w miejsce, gdzie spodziewają się pojawienia się gracza). Kluczem do sukcesu tej <br> 
                strategii jest szybkie dostosowanie się do sytuacji i wykorzystanie elementów otoczenia do <br> 
                zaskoczenia przeciwnika w najdogodniejszym momencie.</p>
                <br>
                <video class="clip-preview" autoplay controls style="width: 800px;heigth: 500px; float: right;">
                    <source src="PREVIEW/offangle.mp4" type="video/mp4">
                </video>
            </div>
            
        </div>
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
            <a href="https://playvalorant.com/pl-pl/?utm_medium=card2%2Bwww.riotgames.com&utm_source=riotbar"><img alt="valorant-link" src="valorant-logo.png" style="width: 70px; height: 40px;"></a><br><br>
        </div>
        </div></div>
</body>
</html>
