<?php
session_start();

// Połączenie z bazą danych
include "config.php";

// Pobranie broni z bazy danych
function getWeapons() {
    $conn = getDBConnection();
    $sql = "SELECT NAME, TYPE, PRICE, ACC, DMG, PEN, ICON FROM bronie";
    $result = $conn->query($sql);

    $weapons = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $weapons[] = $row;
        }
    }

    $conn->close();
    return $weapons;
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

// Pobranie broni z bazy danych
$bronies = getWeapons();
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
    <script>

function searchGun() {
    const searchQuery = document.getElementById('gunSearch').value.toLowerCase().trim();
    const cards = document.querySelectorAll('.gun-card');
    
    let found = false;  // Flag to stop scrolling after finding a match
    cards.forEach(card => {
        const gunName = card.querySelector('h3').innerText.toLowerCase();  // Changed from <h2> to <h3>
        if (gunName.includes(searchQuery) && searchQuery !== "") {
            if (!found) {
                card.scrollIntoView({ behavior: 'smooth', block: 'center' });
                found = true;
            }
        }
    });

    if (!found && searchQuery !== "") {
        alert("Broń o takiej nazwie nie została znaleziona.");
    }
}



</script>
<style>
    body {
        overflow: hidden; /* Uniemożliwia przewijanie całej strony */
        margin: 0; /* Usuwa marginesy */
    }

    #cardContainer {
        display: flex;
        overflow-x: auto;  /* Umożliwia przewijanie w poziomie */
        width: 100%;
        padding: 20px 0; /* Dodatkowy margines wokół kontenera */
        scroll-behavior: smooth; /* Płynne przewijanie */
    }

    /* Stylizacja paska przewijania */
    #cardContainer::-webkit-scrollbar {
        width: 8px; /* Szerokość paska przewijania */
        height: 8px; /* Wysokość paska przewijania (jeśli również przewijasz w pionie) */
    }

    /* Tło paska przewijania */
    #cardContainer::-webkit-scrollbar-track {
        background: #282828;  /* Ciemne tło paska */
        border-radius: 10px; /* Zaokrąglone rogi paska */
    }

    /* Uchwyt paska przewijania */
    #cardContainer::-webkit-scrollbar-thumb {
        background: #58b8f1; /* Kolor uchwytu (np. niebieski, jak w Twoim stylu) */
        border-radius: 10px; /* Zaokrąglone rogi uchwytu */
    }

    /* Efekt na uchwycie paska przewijania podczas interakcji */
    #cardContainer::-webkit-scrollbar-thumb:hover {
        background: #3498db;  /* Zmiana koloru uchwytu na jaśniejszy po najechaniu */
    }

    /* Dodatkowa konfiguracja dla innych przeglądarek */
    #cardContainer {
        scrollbar-width: thin; /* Działa w Firefoxie */
        scrollbar-color: #58b8f1 #282828;  /* Kolor uchwytu i tła paska w Firefoxie */
    }

    .submaindiv {
        display: flex;
        flex-direction: row;
        gap: 20px;
        width: 100%;
        height: 90%;
        justify-content: flex-start;
        overflow: hidden; /* Zapewnia, że zawartość nie wychodzi poza obszar */
    }

    .gun-card {
    font-size: 120%;
    display: flex;
    flex-direction: column;
    justify-content: space-between; /* Rozciąga elementy równomiernie na wysokości karty */
    background-color: #282828;
    border: 1px solid #58b8f1;
    border-radius: 10px;
    padding: 10px;
    margin: 5px;
    color: white;
    max-width: 500px;
    min-width: 500px;
    height: 98%;
    text-align: center;
    box-shadow: 0 0 10px #58b8f1;
    flex-shrink: 0; /* Zapewnia, że karty nie będą się kurczyć */
    }

    .gun-card img {
        flex-shrink: 0; /* Upewnia się, że obraz nie jest rozciągany */
        width: 100%;
        height: auto;
        border-radius: 10px;
        margin-bottom: 10px;
    }

    .gun-card h3,
    .gun-card p,
    .gun-card .stat-bar {
        flex-grow: 1; /* Rozciąga elementy w pionie, aby równomiernie zajmowały przestrzeń */
        margin: 5px 0;
    }

    .gun-card .abilities {
        margin-top: 10px;
    }
    .gun-card .ability {
        margin-bottom: 5px;
    }   
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
</style>
</head>
  <!-- Pasek z informacjami użytkownika -->
  <div class="dashboardheaderdiv">
    <div class="dashboardleftheaderdiv">
        <img src="radiant-rank.png" style="width: 75px;height: 75px;"><br><br>
        <h5 class="glow2">SkillShot Academy</h5><br>
        <button onclick='window.location.href="dashboard.php"'>Przejdź do Dashboard</button>
    </div>
    <div class="dashboardmidheaderdiv">
    <div class="search-container">
    <input type="text" id="gunSearch" placeholder="Wyszukaj broń..." onkeyup="searchGun()">
    </div></div>
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
<div class="submaindiv" id="cardContainer">
    <?php foreach ($bronies as $broń): ?>
        <div class="gun-card">
            <img src="<?= htmlspecialchars($broń['ICON']) ?>" alt="<?= htmlspecialchars($broń['NAME']) ?>" style="width: auto; max-width: 500px; max-height: 100px ; height: auto; margin-bottom: 10px;">
            <h3><?= htmlspecialchars($broń['NAME']) ?></h3>
            <p><strong>Typ:</strong> <?= htmlspecialchars($broń['TYPE']) ?></p>
            <p><strong>Koszt:</strong> <?= htmlspecialchars($broń['PRICE']) ?> <img src="ICONS/credits.png" style="width: 20px;height: 20px;"></p>
            <p><strong>Celność:</strong> <?= $broń['ACC'] ?> z 5</p>
            <div class="stat-bar" style="width: <?= $broń['ACC'] * 20 ?>%; background-color: #58b8f1; height: 10px; margin-bottom: 5px;"></div>
            <p><strong>Obrażenia:</strong> <?= $broń['DMG'] ?> z 5</p>
            <div class="stat-bar" style="width: <?= $broń['DMG'] * 20 ?>%; background-color: #f15454; height: 10px; margin-bottom: 5px;"></div>
            <p><strong>Penetracja Ścian:</strong> <?= $broń['PEN'] ?> z 5</p>
            <div class="stat-bar" style="width: <?= $broń['PEN'] * 20 ?>%; background-color: #34c759; height: 10px; margin-bottom: 5px;"></div>
        </div>
    <?php endforeach; ?>
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