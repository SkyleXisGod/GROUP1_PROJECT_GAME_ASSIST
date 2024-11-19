<?php
session_start();
require_once 'config.php';
echo '<link rel="stylesheet" type="text/css" href="gamelikecss.css">';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Pobranie danych z formularza
    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT); // Haszowanie hasła

    // Sprawdzanie, czy użytkownik już istnieje
    $stmt = $pdo->prepare("SELECT * FROM users WHERE username = ?");
    $stmt->execute([$username]);
    if ($stmt->rowCount() > 0) {
        die('Nazwa użytkownika jest już zajęta.');
    }

    // Dodanie użytkownika do bazy danych
    $data=date("Y-m-d H:i:s");

    $stmt = $pdo->prepare("INSERT INTO USERS (USERNAME, PASSWORD, REG_DATE, ROLEID) VALUES (?, ?, ?, ?)");
    if ($stmt->execute([$username, $password, $data, '2'])) {
        $_SESSION['username'] = $username;
        session_start();
        session_unset();
        session_destroy();
        header("Location: index.php");
        exit();
    } else {
        die("Błąd rejestracji.");
    }
}
?>