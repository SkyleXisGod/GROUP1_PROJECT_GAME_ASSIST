<?php
session_start();

// Połączenie z bazą danych
include "config.php";

$conn = getDBConnection();

// Sprawdzamy połączenie
if ($conn->connect_error) {
    die("Połączenie z bazą danych nieudane: " . $conn->connect_error);
}

// Pobieramy username z sesji
$username = isset($_SESSION['username']) ? $_SESSION['username'] : null;

$profilePic = 'https://via.placeholder.com/50';
$linkHref = 'siteinformations.php';
$linkClass = '';
$lockedIcon = '';

// Jeśli użytkownik jest zalogowany, pobieramy dane użytkownika i sprawdzamy jego rolę
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

        // Jeśli użytkownik nie ma roli user+ (role_id == 2), blokujemy dostęp do statystyk
        if ($role_id == 2) {
            $lockedIcon = '<img src="lock-icon.png" alt="Locked" style="width: 16px; height: 16px; margin-left: 5px;">';
            $linkHref = '#';  // Ustawiamy href na #, aby link nie działał
            $linkClass = 'locked-link';  // Możemy dodać klasę CSS, żeby wizualnie pokazać, że link jest zablokowany
        }
    }
}

// Zamykamy połączenie z bazą danych
$conn->close();
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> SkillShot Academy </title>
    <link rel="stylesheet" type="text/css" href="gamelikecss.css">
    <link rel="stylesheet" type="text/css" href="profilelist.css">
    <link rel="shortcut icon" href="radiant-rank.png">
    <script src="profilelist.js"></script>
    <script src="ranksystem.js"></script>
    <style>
        .floating-island {
    
    border-radius: 20px;
    box-shadow: 0 0 5px #58b8f1, 0 0 10px #58b8f1, 0 0 15px #58b8f1;
    background: #1a1a1a;
    align-items: center;
    justify-content: center;
    width: 60%;
    height: 90%;
    display: flex;
    flex-direction: column;
    gap: 20px;
    padding: 20px;
}
    </style>
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

<?php
    if (!isset($_SESSION['username'])) {
        header("Location: index.php");
        exit();
    }
?>

<div class="dashboardmaindiv">
    <div class="floating-island">
        <div class="link-grid">
            <a href="agentstip.php" class="link-box"><img src="ICONS\agents-icon.png" alt="agents-logo" width="230px" heigth="230px"></a><br><br><br><br>
            <a href="techtip.php" class="link-box"><img src="ICONS\valorant-tech.png" alt="valorant-tech" width="200px" heigth="200px"></a><br><br><br><br>
            <a href="guntip.php" class="link-box"><img src="ICONS\gun-icon.png" alt="gun-logo" width="350px" heigth="100px"></a><br><br><br><br>
        </div>
        <div class="link-grid">
            <a href="crosshairtip.php" class="link-box"><img src="ICONS\crosshair-icon.png" alt="crosshair-logo" width="250px" heigth="250px"></a><br><br><br><br>
            <a href="phrasebooktip.php" class="link-box"><img src="ICONS\phrase-book-icon.png" alt="phrase-book-logo"></a><br><br><br><br>
            <a href="questionmarktip.php" class="link-box"><img src="ICONS\clips-icon.png" width="230px" heigth="230px" alt="clips-logo"></a><br><br><br><br>
        </div>
    </div>
</div>

<div class="dashboardfooterdiv">
    <div class="dashboardfooterdivleft">
        <h2> 
        <b><i> I N F O: </b></i><br>
        </h2>
    </div>
    <div class="dashboardfooterdivright">
        <a class="linkbut" href="https://support-valorant.riotgames.com/hc/en-us/categories/360003432993-VALORANT-Basics-FAQs"><img alt="faq-link" src="faq-logo.png" style="width: 60px; height: 50px;"></a><br><br>
        <a class="linkbut" href="https://discord.gg/JjmAzzcxsh"><img alt="discord-server-link" src="discord-logo.png" style="width: 50px; height: 30px;"></a><br><br>
        <a class="linkbut" href="https://www.riotgames.com/pl"><img alt="riot-games-link" src="riot-logo.png" style="width: 50px; height: 50px;"></a><br><br>
        <a class="linkbut" href="https://playvalorant.com/pl-pl/?utm_medium=card2%2Bwww.riotgames.com&utm_source=riotbar"><img alt="valorant-link" src="valorant-logo.png" style="width: 70px; height: 40px;"></a><br><br>
    </div>
</div>

</body>
</html>
