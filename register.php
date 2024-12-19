<?php
session_start();
require_once 'config.php';
require_once 'config.php'; 
echo '<link rel="stylesheet" type="text/css" href="gamelikecss.css">';

// Funkcja do filtrowania niebezpiecznych słów i znaków
function sanitize_input($data) {
    // Usuwamy wszelkie tagi HTML i PHP
    $data = htmlspecialchars($data, ENT_QUOTES, 'UTF-8');
    
    // Zakazujemy słów i fraz związanych z manipulacją bazą danych
    $forbidden_patterns = [
        '/DROP\s+TABLE/i',
        '/DELETE\s+FROM/i',
        '/TRUNCATE/i',
        '/ALTER\s+TABLE/i',
        '/UPDATE\s+/i',
        '/INSERT\s+/i',
        '/SELECT\s+/i',
        '/GRANT\s+/i',
        '/REVOKE\s+/i',
        '/EXEC\s+/i',
        '/--/', // Komentarze SQL
        '/\#/', // Komentarze SQL
        '/\/\*/', // Komentarze SQL
        '/\*\//', // Komentarze SQL
        '/OR\s+1=1/i', // Typowy atak SQL injection
        '/DROP\s+DATABASE/i'
    ];
    // Sprawdzanie, czy dane zawierają zabronione wzorce
    foreach ($forbidden_patterns as $pattern) {
        if (preg_match($pattern, $data)) {
            die("Błąd: Niedozwolona próba wykonania polecenia SQL.");
        }
    }
    return $data;
}
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Pobranie danych z formularza
    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT); // Haszowanie hasła
    // Sprawdzanie, czy użytkownik już istnieje
    $stmt = $pdo->prepare("SELECT * FROM users WHERE username = ?");
    $stmt->execute([$username]);
    if ($stmt->rowCount() > 0) {
        die('Nazwa użytkownika jest już zajęta.');
    // Pobranie danych z formularza i ich oczyszczenie
    $username = sanitize_input(trim($_POST['username']));
    $password = sanitize_input(trim($_POST['password']));
    // Walidacja nazwy użytkownika
    if (!preg_match('/^[a-zA-Z0-9_]{3,20}$/', $username)) {
        die("Nieprawidłowy format nazwy użytkownika. Dozwolone są tylko litery, cyfry i podkreślenia (3-20 znaków).");
    }

    // Dodanie użytkownika do bazy danych
    $data=date("Y-m-d H:i:s");
    $stmt = $pdo->prepare("INSERT INTO USERS (USERNAME, PASSWORD, REG_DATE, ROLEID) VALUES (?, ?, ?, ?)");
    if ($stmt->execute([$username, $password, $data, '2'])) {
        $_SESSION['username'] = $username;
        session_start();
        session_unset();
        session_destroy();
        header("Location: ranks.php");
        exit();
    } else {
        die("Błąd rejestracji.");
    try {
        // Sprawdzanie, czy użytkownik już istnieje
        $stmt = $pdo->prepare("SELECT * FROM users WHERE username = ?");
        $stmt->execute([$username]);
        if ($stmt->rowCount() > 0) {
            die('Nazwa użytkownika jest już zajęta.');
        }
        // Haszowanie hasła
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);
        // Dodanie użytkownika do bazy danych
        $data = date("Y-m-d H:i:s");
        $stmt = $pdo->prepare("INSERT INTO USERS (USERNAME, PASSWORD, REG_DATE, ROLEID) VALUES (?, ?, ?, ?)");
        if ($stmt->execute([$username, $hashed_password, $data, '2'])) {
            $_SESSION['username'] = $username;
            session_unset();
            session_destroy();
            header("Location: ranks.php");
            exit();
        } else {
            die("Błąd rejestracji.");
        }
    } catch (PDOException $e) {
        die("Błąd zapytania: " . $e->getMessage());
    }
}
?>
?>
<!-- Formularz HTML -->
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Rejestracja</title>
</head>
<body>
    <form method="post" action="">
        <label for="username">Nazwa użytkownika:</label>
        <input type="text" id="username" name="username" required>
        <br>
        <label for="password">Hasło:</label>
        <input type="password" id="password" name="password" required>
        <br>
        <button type="submit">Zarejestruj się</button>
    </form>
</body>
</html>