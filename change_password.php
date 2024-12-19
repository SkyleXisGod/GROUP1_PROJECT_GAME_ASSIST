<?php
session_start();

// Połączenie z bazą danych
include "config.php";

$conn = getDBConnection();

// Sprawdzamy, czy użytkownik jest zalogowany
if (!isset($_SESSION['username'])) {
    header("Location: login.php"); // Jeśli użytkownik nie jest zalogowany, przekierowujemy do logowania
    exit();
}

// Pobieramy dane z formularza
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['submit'])) {
    // Pobieramy dane z formularza
    $currentPassword = $_POST['current_password'];
    $newPassword = $_POST['new_password'];
    $confirmPassword = $_POST['confirm_password'];

    // Sprawdzamy, czy nowe hasło i potwierdzenie pasują
    if ($newPassword !== $confirmPassword) {
        echo '  <link rel="stylesheet" type="text/css" href="gamelikecss.css">
        <link rel="stylesheet" type="text/css" href="profilelist.css">
        <div class="tipsmaindiv">
        <div class="tip-box">
            <h2>Różniące się hasła!</h2>
        </div>
        </div>

<script>
    // Przekierowanie na index.php po 7 sekundach
    setTimeout(function() {
        window.location.href = "change_password_form.php"; // Zmień na swoją stronę docelową
    }, 3000); // 3000 ms = 3 sekund
</script>';
    }

    // Pobieramy username z sesji
    $username = $_SESSION['username'];

    // Pobieramy dane użytkownika z bazy danych
    $sql = "SELECT * FROM users WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('s', $username);
    $stmt->execute();
    $result = $stmt->get_result();

    // Sprawdzamy, czy użytkownik istnieje
    if ($result->num_rows === 0) {
        echo '  <link rel="stylesheet" type="text/css" href="gamelikecss.css">
        <link rel="stylesheet" type="text/css" href="profilelist.css">
        <div class="tipsmaindiv">
        <div class="tip-box">
            <h2>Użytkownik nie istnieje!</h2>
        </div>
        </div>

<script>
    // Przekierowanie na index.php po 7 sekundach
    setTimeout(function() {
        window.location.href = "change_password_form.php"; // Zmień na swoją stronę docelową
    }, 3000); // 3000 ms = 3 sekund
</script>';
    }

    $user = $result->fetch_assoc();
    $storedPassword = $user['PASSWORD']; // Przechowywane hasło (zwykle zahashowane)

    // Sprawdzamy, czy aktualne hasło jest poprawne
    if (!password_verify($currentPassword, $storedPassword)) {
        header("Location: dashboard.php");
    }

    // Hashujemy nowe hasło
    $newHashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);

    // Aktualizujemy hasło w bazie danych
    $updateSql = "UPDATE users SET PASSWORD = ? WHERE username = ?";
    $updateStmt = $conn->prepare($updateSql);
    $updateStmt->bind_param('ss', $newHashedPassword, $username);
    
    if ($updateStmt->execute()) {
        echo '  <link rel="stylesheet" type="text/css" href="gamelikecss.css">
                            <link rel="stylesheet" type="text/css" href="profilelist.css">
                            <div class="tipsmaindiv">
                            <div class="tip-box">
                                <h2>Hasło zmienione pomyślnie!</h2>
                            </div>
                            </div>
                    
                    <script>
                        // Przekierowanie na index.php po 7 sekundach
                        setTimeout(function() {
                            window.location.href = "dashboard.php"; // Zmień na swoją stronę docelową
                        }, 3000); // 3000 ms = 3 sekund
                    </script>';
        // Opcjonalnie, możesz przekierować użytkownika do dashboardu lub innej strony
    } else {
        echo '  <link rel="stylesheet" type="text/css" href="gamelikecss.css">
                            <link rel="stylesheet" type="text/css" href="profilelist.css">
                            <div class="tipsmaindiv">
                            <div class="tip-box">
                                <h2>Błąd przesyłu!</h2>
                            </div>
                            </div>
                    
                    <script>
                        // Przekierowanie na index.php po 7 sekundach
                        setTimeout(function() {
                            window.location.href = "dashboard.php"; // Zmień na swoją stronę docelową
                        }, 3000); // 3000 ms = 3 sekund
                    </script>';
    }

    // Zamykamy połączenie
    $conn->close();
}
?>
