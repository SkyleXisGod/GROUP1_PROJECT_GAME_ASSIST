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



function getChampsWithDetails() {
    $conn = getDBConnection();
    $sql = "
        SELECT 
            c.ID AS champ_id, 
            c.NAME AS champ_name, 
            c.DESCRIPTION AS champ_description, 
            cr.ROLE_NAME AS champ_role
        FROM champs c
        LEFT JOIN champ_roles cr ON c.ROLE = cr.ID
    ";
    $result = $conn->query($sql);
    $champs = [];

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $champs[] = $row;
        }
    }
    $conn->close();
    return $champs;
}
// Funkcja pobierająca dane umiejętności (c, q, e, x)
function getAbilityDetails($champ_id, $ability_type) {
    $conn = getDBConnection();
    $table = "ability_" . $ability_type; // 'ability_c', 'ability_q', 'ability_e', 'ability_x'
    $sql = "SELECT NAME, DESCRIPTION, SHOWCASE FROM $table WHERE ID = ?";
    
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $champ_id);
    $stmt->execute();
    $result = $stmt->get_result();
    
    $ability = null;
    if ($result->num_rows > 0) {
        $ability = $result->fetch_assoc();
    }

    $conn->close();
    return $ability;
}

$champs = getChampsWithDetails();
$ability = getChampsWithDetails();
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
     .champ-card {
            background-color: #282828;
            border: 1px solid #58b8f1;
            border-radius: 10px;
            padding: 20px;
            margin: 10px;
            color: white;
            width: 600px;
            text-align: center;
            box-shadow: 0 0 10px #58b8f1;
        }
        .champ-card img {
            width: 100%;
            height: auto;
            border-radius: 10px;
            margin-bottom: 10px;
        }
        .champ-card h3 {
            margin-bottom: 10px;
            color: #58b8f1;
        }
        .champ-card .abilities {
            margin-top: 10px;
        }
        .champ-card .ability {
            margin-bottom: 5px;
        }   
    .submaindiv {
        background: transparent;
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
<div class="submaindiv">
    <?php foreach ($champs as $champ): ?>
        <div class="champ-card">
            <h2><?php echo htmlspecialchars($champ['champ_name']); ?></h2>
            <img src="agent_images/<?php echo $champ['champ_id']; ?>.png" style="width: 100px; heigth: 100px;" alt="Agent Image">
            <p><?php echo htmlspecialchars($champ['champ_description']); ?>
            <strong>Rola:</strong> <?php echo htmlspecialchars($champ['champ_role']); ?></p>

            <div class="ability-section">
                <h3>Umiejętności:</h3>
                
                <?php 
                    // Pobieranie danych dla każdej umiejętności (C, Q, E, X)
                    $ability_c = getAbilityDetails($champ['champ_id'], 'c');
                    $ability_q = getAbilityDetails($champ['champ_id'], 'q');
                    $ability_e = getAbilityDetails($champ['champ_id'], 'e');
                    $ability_x = getAbilityDetails($champ['champ_id'], 'x');
                ?>

                <div class="ability">
                    <?php if ($ability_c): ?>
                        <img class="ability-icon" src="ability_c/<?php echo $champ['champ_id']; ?>.png" style="width: 60px; heigth: 60px;" alt="C Ability">
                        <p><strong>C:</strong> <?php echo htmlspecialchars($ability_c['DESCRIPTION']); ?></p>
                    <?php endif; ?>
                </div>

                <div class="ability">
                    <?php if ($ability_q): ?>
                        <img class="ability-icon" src="ability_q/<?php echo $champ['champ_id']; ?>.png" style="width: 60px; heigth: 60px;" alt="Q Ability">
                        <p><strong>Q:</strong> <?php echo htmlspecialchars($ability_q['DESCRIPTION']); ?></p>
                    <?php endif; ?>
                </div>

                <div class="ability">
                    <?php if ($ability_e): ?>
                        <img class="ability-icon" src="ability_e/<?php echo $champ['champ_id']; ?>.png" style="width: 60px; heigth: 60px;" alt="E Ability">
                        <p><strong>E:</strong> <?php echo htmlspecialchars($ability_e['DESCRIPTION']); ?></p>
                    <?php endif; ?>
                </div>

                <div class="ability">
                    <?php if ($ability_x): ?>
                        <img class="ability-icon" src="ability_x/<?php echo $champ['champ_id']; ?>.png" style="width: 60px; heigth: 60px;" alt="X Ability">
                        <p><strong>X:</strong> <?php echo htmlspecialchars($ability_x['DESCRIPTION']); ?></p>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    <?php endforeach; ?>
</div>

    <!-- Stopka -->
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
