<?php
session_start();

// Połączenie z bazą danych
include "config.php";

$conn = getDBConnection();


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

// Funkcja do dodawania celownika
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES['crosshair']) && isset($_POST['code'])) {
    $file = $_FILES['crosshair'];
    $code = $_POST['code'];

    // Połączenie z bazą danych
    $conn = getDBConnection();
    $imageData = file_get_contents($file['tmp_name']);  // Pobieramy dane obrazu

    // Wstawienie obrazu do bazy danych
    $sql = "INSERT INTO crosshairs (USERID, CODE, IMAGE) VALUES ((SELECT ID FROM users WHERE username = ?), ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('sss', $username, $code, $imageData);
    $stmt->execute();

    $conn->close();
}

// Pobieranie wszystkich celowników
function getCrosshairs() {
    $conn = getDBConnection();
    $sql = "SELECT c.ID, c.CODE, c.IMAGE, u.username FROM crosshairs c JOIN users u ON c.USERID = u.ID";
    $result = $conn->query($sql);

    $crosshairs = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $crosshairs[] = $row;
        }
    }

    $conn->close();
    return $crosshairs;
}

// Usuwanie celownika
if (isset($_GET['delete_id']) && isset($_GET['username'])) {
    $deleteId = $_GET['delete_id'];
    $crosshairUsername = $_GET['username']; // Username associated with the crosshair

    if ($crosshairUsername == $_SESSION['username'] || $role_id == 1) {
        $conn = getDBConnection();
        $sql = "DELETE FROM crosshairs WHERE ID = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('i', $deleteId);
        $stmt->execute();
        $conn->close();
        header("Location: crosshairindex.php");
        exit();
    } else {
        // Unauthorized access attempt
        echo "You are not authorized to delete this crosshair.";
    }
}
?>


<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dodaj Celownik</title>
    <link rel="stylesheet" type="text/css" href="gamelikecss.css">
    <link rel="stylesheet" type="text/css" href="profilelist.css">
    <link rel="shortcut icon" href="radiant-rank.png">
    <script src="profilelist.js"></script>
    <style>
        
    body {
    margin: 0;
    padding: 0;
    overflow: hidden; /* Uniemożliwia przewijanie całej strony */
    font-family: Arial, sans-serif;
    }

    .dashboardheaderdiv {
        position: fixed;
        top: 0;
        width: 100%;
        background-color: #333;
        color: white;
        display: flex;
        justify-content: space-between;
        padding: 10px;
        z-index: 1000; /* Ustaw wyższy z-index, aby nagłówek zawsze był widoczny */
        flex-direction: row;
        align-items: left; /* Wyrównanie w poziomie */
        justify-content: center; /* Wyrównanie w pionie */
    }
    .dashboardleftheaderdiv button {
        margin-left: 600px; /* Usuwa ewentualne marginesy */
    }

    /* Stylizacja paska przewijania */
    .crosshairs-container::-webkit-scrollbar {
        width: 8px; /* Szerokość paska przewijania */
        height: 8px; /* Wysokość paska przewijania (jeśli również przewijasz w pionie) */
    }

    /* Tło paska przewijania */
    .crosshairs-container::-webkit-scrollbar-track {
        background: #282828;  /* Ciemne tło paska */
        border-radius: 10px; /* Zaokrąglone rogi paska */
    }

    /* Uchwyt paska przewijania */
    .crosshairs-container::-webkit-scrollbar-thumb {
        background: #58b8f1; /* Kolor uchwytu (np. niebieski, jak w Twoim stylu) */
        border-radius: 10px; /* Zaokrąglone rogi uchwytu */
    }

    /* Efekt na uchwycie paska przewijania podczas interakcji */
    .crosshairs-container::-webkit-scrollbar-thumb:hover {
        background: #3498db;  /* Zmiana koloru uchwytu na jaśniejszy po najechaniu */
    }

    .crosshairs-container {
        position: absolute;
        top: 120px; /* Dopasuj do wysokości nagłówka */
        bottom: 0;
        left: 0;
        right: 0;
        overflow-y: scroll; /* Włącz przewijanie tylko dla sekcji z celownikami */
        padding: 20px;
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        justify-content: center;
    }

    .crosshair-card {
        width: 400px;
        height: 300px;
        border: 1px solid #ccc;
        border-radius: 10px;
        overflow: hidden;
        background: #1a1a1a;
        box-shadow: 0 0 5px #58b8f1, 0 0 10px #58b8f1, 0 0 15px #58b8f1;
        text-align: center;
        transition: transform 0.2s ease;
    }

    .crosshair-card:hover {
        transform: scale(1.05);
    }

    .crosshair-image {
        width: 150px;
        height: 150px;
        object-fit: cover;
    }

    .crosshair-details {
        padding: 10px;
    }

    .crosshair-details h4 {
        margin: 10px 0;
        font-size: 18px;
    }

    .crosshair-details p {
        margin: 5px 0;
        color: #555;
    }

    .delete-button {
        display: inline-block;
        margin-top: 10px;
        padding: 5px 10px;
        background-color: #ff4d4d;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        font-size: 14px;
    }

    .delete-button:hover {
        background-color: #e60000;
    }

    </style>
</head>
<body>
      <!-- Pasek z informacjami użytkownika -->
    <div class="dashboardheaderdiv">
        <div class="dashboardleftheaderdiv">
            <img src="radiant-rank.png" style="width: 75px;height: 75px;"><br><br>
            <h5 class="glow2">SkillShot Academy</h5><br>
            <button onclick='window.location.href="dashboard.php"'>Przejdź do Dashboard</button>
        </div>
        <div class="dashboardmidheaderdiv">
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
    <div class="crosshairs-container">
        <!-- Pierwsza karta, zawsze przeznaczona na dodawanie celownika -->
        <div class="crosshair-card">
            <form action="crosshairindex.php" method="POST" enctype="multipart/form-data">
                <label for="crosshair">Wybierz celownik:</label><br>
                <input type="file" name="crosshair" required><br><br>

                <label for="code">Kod celownika:</label><br>
                <input type="text" name="code" required><br><br><br>

                <input type="submit" value="Dodaj Celownik">
            </form>
        </div>

        <!-- Reszta istniejących celowników -->
        <?php
        $crosshairs = getCrosshairs() ?? []; // Zawsze tablica
        foreach ($crosshairs as $crosshair):
        ?>
            <div class="crosshair-card">
                <img src="get_image.php?crosshair_id=<?= $crosshair['ID'] ?>" alt="Reticle" class="crosshair-image">
                <div class="crosshair-details">
                    <b style="font-size: 10px; color: white;"><?= htmlspecialchars($crosshair['CODE']) ?></b>
                    <p>Dodane przez: <?= htmlspecialchars($crosshair['username']) ?></p>
                    <?php if ($_SESSION['username'] == $crosshair['username'] || $role_id == 1): ?>
                        <a href="crosshairindex.php?delete_id=<?= $crosshair['ID'] ?>&username=<?= urlencode($crosshair['username']) ?>" class="delete-button">Usuń</a>
                    <?php endif; ?>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</body>
</html>
