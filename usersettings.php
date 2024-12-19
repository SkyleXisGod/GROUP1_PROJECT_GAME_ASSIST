<?php
session_start();

// Połączenie z bazą danych
include "config.php";

$conn = getDBConnection();

// Sprawdź, czy użytkownik jest zalogowany
if (!isset($_SESSION['username'])) {
    header("Location: index.php"); // Przekierowanie do logowania, jeśli użytkownik nie jest zalogowany
    exit();
}

// Obsługa usuwania konta
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_SESSION['username']; // Pobierz nazwę użytkownika z sesji

    // Usuń użytkownika z bazy danych
    if ($conn) { // Upewnij się, że połączenie jest aktywne
        $stmt = $conn->prepare("DELETE FROM users WHERE USERNAME = ?");
        $stmt->bind_param("s", $username);

        if ($stmt->execute()) {
            $stmt->close();
            
            // Zniszcz sesję użytkownika
            session_unset();
            session_destroy();

            echo <<<HTML
<!DOCTYPE html>
<html lang="pl">
<head>
    <link rel="stylesheet" type="text/css" href="gamelikecss.css">
    <link rel="stylesheet" type="text/css" href="profilelist.css">
    <link rel="shortcut icon" href="radiant-rank.png">
    <meta charset="UTF-8">
    <title>Do zobaczenia</title>
</head>
<body>
<div class="floating-island">
    <h1>Twoje konto zostało usunięte.</h1>
    <p>Dziękujemy za skorzystanie z naszej platformy. Mamy nadzieję, że wrócisz w przyszłości!</p>
    <a href="registerindex.php" class="linkglow">Zarejestruj się ponownie</a>
</div>
</body>
</html>
HTML;
        exit();
            exit();
        } else {
            echo "Wystąpił błąd podczas usuwania konta.";
        }
    } else {
        echo "Błąd połączenia z bazą danych.";
    }
}
?>


<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkillShot Academy</title>
    <link rel="stylesheet" type="text/css" href="gamelikecss.css">
    <link rel="stylesheet" type="text/css" href="profilelist.css">
    <link rel="shortcut icon" href="radiant-rank.png">
    <script src="profilelist.js"></script>
    <script>
        function confirmDeletion() {
            // Wyświetl okno potwierdzenia
            const confirmation = confirm("Czy na pewno chcesz usunąć swoje konto? Tej operacji nie można cofnąć.");
            if (confirmation) {
                document.getElementById('deleteAccountForm').submit(); // Prześlij formularz
            }
        }
    </script>
</head>
<body>

<div class="settingsheaderdiv">
    <div class="settingstopheaderdiv">
        <img src="radiant-rank.png" style="width: 75px; height: 75px;">
        <br><br>
        <h5 class="glow2">SkillShot Academy</h5>
        <br>
    </div>

    <div class="dashboardrightheaderdiv">
        <!-- Sekcja profilowa z rozwijalnym menu ustawień -->
        <div>
            <h2>Wybierz zdjęcie profilowe</h2>
            <form action="upload.php" method="POST" enctype="multipart/form-data">
                <input type="file" name="profilepic" id="profilepic" required>
                <br><br>
                <input class="submit" type="submit" value="Zapisz zdjęcie">
            </form>
        </div>
        <div>
            <form action="update_email.php" method="POST">
            <label for="email">Wprowadź e-mail:</label>
            <input type="email" id="email" name="email" required><br><br>

            <button type="submit" name="submit">Zaktualizuj E-mail</button>
        </form>
        </div>
    </div>
    <div class="dashboardrightheaderdiv">
        <div>
            <form id="deleteAccountForm" method="POST">
                <button type="button" onclick="confirmDeletion()">Usuń Konto</button>
            </form>
        </div>
    </div>

    <div style="padding-left: 50px;" class="settingstopheaderdiv">
        <button onclick="window.location.href='dashboard.php';">Przejdź do Dashboard</button>
    </div>
</div>

</body>
</html>