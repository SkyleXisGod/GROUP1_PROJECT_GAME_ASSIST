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

// Pobieranie klipów
function getClips() {
    $conn = getDBConnection();
    $sql = "SELECT c.ID, c.TITLE, c.VIDEO, c.DATE_ADDED, u.username 
            FROM clips c 
            JOIN users u ON c.USERID = u.ID";
    $result = $conn->query($sql);

    $clips = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $clips[] = $row;
        }
    }
    $conn->close();
    return $clips;
}

// Dodawanie klipu
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES['clip']) && isset($_POST['title'])) {
    $file = $_FILES['clip'];
    $title = substr($_POST['title'], 0, 20); // Maksymalnie 20 znaków
    $username = $_SESSION['username'];

    if ($file['size'] > 0 && $file['error'] == 0) {
        $conn = getDBConnection();
        $videoData = file_get_contents($file['tmp_name']);
        $sql = "INSERT INTO clips (USERID, TITLE, VIDEO, DATE_ADDED) 
                VALUES ((SELECT ID FROM users WHERE username = ?), ?, ?, NOW())";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('sss', $username, $title, $videoData);
        $stmt->execute();
        $conn->close();
    }
}

// Usuwanie klipu
if (isset($_GET['delete_id']) && isset($_GET['username'])) {
    $deleteId = $_GET['delete_id'];
    $clipUsername = $_GET['username']; // Użytkownik powiązany z klipem

    if ($clipUsername == $_SESSION['username'] || $_SESSION['role_id'] == 1) {
        $conn = getDBConnection();
        $sql = "DELETE FROM clips WHERE ID = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('i', $deleteId);
        $stmt->execute();
        $conn->close();
        header("Location: " . $_SERVER['PHP_SELF']);
        exit();
    } else {
        echo "You are not authorized to delete this clip.";
    }
}
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Valorant Clips</title>
    <link rel="stylesheet" type="text/css" href="gamelikecss.css">
    <link rel="stylesheet" type="text/css" href="profilelist.css">
    <link rel="shortcut icon" href="radiant-rank.png">
    <style>
        body {
        margin: 0;
        padding: 0;
        overflow: hidden; /* Uniemożliwia przewijanie całej strony */
        font-family: Arial, sans-serif;
        }

        /* Stylizacja paska przewijania */
        .clips-container::-webkit-scrollbar {
            width: 8px; /* Szerokość paska przewijania */
            height: 8px; /* Wysokość paska przewijania (jeśli również przewijasz w pionie) */
        }

        /* Tło paska przewijania */
        .clips-container::-webkit-scrollbar-track {
            background: #282828;  /* Ciemne tło paska */
            border-radius: 10px; /* Zaokrąglone rogi paska */
        }

        /* Uchwyt paska przewijania */
        .clips-container::-webkit-scrollbar-thumb {
            background: #58b8f1; /* Kolor uchwytu (np. niebieski, jak w Twoim stylu) */
            border-radius: 10px; /* Zaokrąglone rogi uchwytu */
        }

        /* Efekt na uchwycie paska przewijania podczas interakcji */
        .clips-container::-webkit-scrollbar-thumb:hover {
            background: #3498db;  /* Zmiana koloru uchwytu na jaśniejszy po najechaniu */
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

        .clips-container {
            position: absolute;
            top: 120px; /* Dopasuj do wysokości nagłówka */
            bottom: 0;
            left: 0;
            right: 0;
            display: flex;
            top: 120px; /* Dopasuj do wysokości nagłówka */
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            padding: 20px;
            overflow-y: auto; /* Włącza przewijanie pionowe */
        }

        .clip-card {
            width: 500px;
            height: 400px;
            border: 1px solid #ccc;
            border-radius: 10px;
            overflow: hidden;
            background: #1a1a1a;
            box-shadow: 0 0 5px #58b8f1, 0 0 10px #58b8f1, 0 0 15px #58b8f1;
            text-align: center;
            transition: transform 0.2s ease;
        }

        .clip-card:hover {
            transform: scale(1.05);
        }

        .clip-preview {
            width: 100%;
            height: 200px;
        }

        .clip-details {
            padding: 10px;
        }

        .clip-details h4 {
            margin: 10px 0;
            font-size: 18px;
        }

        .clip-details p {
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

  <!-- Stała karta do dodawania klipów -->
  <div class="clips-container">
    <div class="clip-card">
        <h2>Dodaj Klip</h2>
        <form action="" method="POST" enctype="multipart/form-data">
            <label for="clip">Wybierz klip:</label>
            <input type="file" name="clip" accept="video/*" required><br><br>
            <label for="title">Tytuł klipu:</label>
            <input type="text" name="title" maxlength="20" required><br><br>
            <input type="submit" value="Dodaj Klip">
        </form>
    </div>

    <?php
    $clips = getClips() ?? [];
    foreach ($clips as $clip):
    ?>
        <div class="clip-card">
            <video class="clip-preview" controls>
                <source src="data:video/mp4;base64,<?= base64_encode($clip['VIDEO']) ?>" type="video/mp4">
            </video>
            <div class="clip-details">
                <h4><?= htmlspecialchars($clip['TITLE']) ?></h4>
                <p>Dodane przez: <?= htmlspecialchars($clip['username']) ?></p>
                <p>Data: <?= htmlspecialchars($clip['DATE_ADDED']) ?></p>
                <?php if ($_SESSION['username'] == $clip['username'] || $_SESSION['role_id'] == 1): ?>
                    <a href="?delete_id=<?= $clip['ID'] ?>&username=<?= urlencode($clip['username']) ?>" class="delete-button">Usuń</a>
                <?php endif; ?>
            </div>
        </div>
    <?php endforeach; ?>
</div>
</body>

</html>
