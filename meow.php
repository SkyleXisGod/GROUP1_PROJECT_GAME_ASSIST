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
    <title>Ekko</title>
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
    .content-container {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    gap: 20px;
    height: 100%;
  }

  .text-section,
  .list-section,
  .video-section {
    width: 33%;
    box-sizing: border-box;
    padding: 10px;
    overflow-wrap: break-word; /* Dla długich wyrazów */
  }

  .video-section video {
    width: 100%;
    height: auto;
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
    <div class="floating-island" style="height: 700px; flex-direction: row;">
    <div class="content-container">
        <div class="text-section">
            <p><strong>Rodzaje peekowania:</strong> W Valorant istnieje kilka rodzajów „peekowania” — technik wychylania się, aby zdobyć informacje lub eliminować przeciwników. Poprawne stosowanie tych technik zwiększa skuteczność i przeżywalność.</p>
        </div>

        <div class="list-section">
            <ul>
            <li><strong>Jiggle Peek:</strong> Szybkie wychylenia na boki, aby sprawdzić pozycję przeciwników bez pełnego wystawiania się na ostrzał.</li>
            <li><strong>Wide Peek:</strong> Agresywne wychylenie na szeroki dystans, by zaskoczyć przeciwnika.</li>
            <li><strong>Shoulder Peek:</strong> Krótkie wychylenie, pokazując tylko ramię, by sprowokować strzał.</li>
            <li><strong>Crouch Peek:</strong> Wychylenie z równoczesnym kucnięciem, by zmienić wysokość celu.</li>
            <li><strong>Jump Peek:</strong> Wychylenie przez podskok, by zdobyć informacje bez dużego ryzyka trafienia.</li>
            <li><strong>Ferrari Peek:</strong> Błyskawiczne wychylenie w pełnym biegu, stosowane do szybkiej eliminacji przeciwnika.</li>
            </ul>
        </div>

        <div class="video-section">
            <video class="clip-preview" autoplay controls>
            <source src="PREVIEW/peek.mp4" type="video/mp4">
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
    </div>
</body>
</html>
