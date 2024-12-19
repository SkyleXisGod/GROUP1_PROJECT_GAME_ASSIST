<?php

// Połączenie z bazą danych
include "config.php";

$conn = getDBConnection();

// Rozpoczynamy sesję
session_start();

$username = $_SESSION['username']; // Pobieramy username z sesji

// Pobieramy USERID na podstawie username
$sqlGetUserId = "SELECT ID FROM users WHERE username = ?";
$stmtGetUserId = $conn->prepare($sqlGetUserId);
$stmtGetUserId->bind_param('s', $username);
$stmtGetUserId->execute();
$result = $stmtGetUserId->get_result();

if ($result->num_rows === 0) {
    die("Użytkownik nie znaleziony w bazie danych.");
}

$row = $result->fetch_assoc();
$userId = $row['ID']; // Zapisujemy USERID użytkownika

// Sprawdzamy, czy formularz został wysłany i czy plik jest poprawnie przesłany
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES['profilepic'])) {
    // Pobieramy dane pliku
    $file = $_FILES['profilepic'];
    $fileName = $_FILES['profilepic']['name'];
    $fileTmpName = $_FILES['profilepic']['tmp_name'];
    $fileSize = $_FILES['profilepic']['size'];
    $fileError = $_FILES['profilepic']['error'];
    $fileType = $_FILES['profilepic']['type'];

    // Sprawdzamy, czy nie wystąpiły błędy
    if ($fileError === 0) {
        // Sprawdzamy rozmiar pliku (do 5MB)
        if ($fileSize <= 5000000) {
            // Generujemy unikalną nazwę dla pliku
            $fileExt = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));
            $allowedExt = ['jpg', 'jpeg', 'png', 'gif'];
            
            if (in_array($fileExt, $allowedExt)) {
                // Odczytujemy zawartość pliku
                $fileContent = file_get_contents($fileTmpName);

                // Sprawdzamy, czy użytkownik już ma zapisane zdjęcie w tabeli
                $sqlCheck = "SELECT * FROM profilepics WHERE USERID = ?";
                $stmtCheck = $conn->prepare($sqlCheck);
                $stmtCheck->bind_param('i', $userId);
                $stmtCheck->execute();
                $resultCheck = $stmtCheck->get_result();

                if ($resultCheck->num_rows > 0) {
                    // Jeśli zdjęcie już istnieje, aktualizujemy je
                    $sqlUpdate = "UPDATE profilepics SET PROFILEPICFILE = ? WHERE USERID = ?";
                    $stmtUpdate = $conn->prepare($sqlUpdate);
                    $stmtUpdate->bind_param('bi', $fileContent, $userId);
                    $stmtUpdate->send_long_data(0, $fileContent); // Wysyłamy dane binarne
                    $stmtUpdate->execute();
                } else {
                    // Jeśli zdjęcie jeszcze nie istnieje, dodajemy nowe
                    $sqlInsert = "INSERT INTO profilepics (USERID, PROFILEPICFILE) VALUES (?, ?)";
                    $stmtInsert = $conn->prepare($sqlInsert);
                    $stmtInsert->bind_param('ib', $userId, $fileContent);
                    $stmtInsert->send_long_data(1, $fileContent); // Wysyłamy dane binarne
                    $stmtInsert->execute();
                }

                // Potwierdzenie sukcesu
                echo '  <link rel="stylesheet" type="text/css" href="gamelikecss.css">
                        <link rel="stylesheet" type="text/css" href="profilelist.css">
                        <div class="tipsmaindiv">
                        <div class="tip-box">
                            <h2>Sukces!</h2>
                        </div>
                        </div>
                
                <script>
                    // Przekierowanie na dashboard.php po 3 sekundach
                    setTimeout(function() {
                        window.location.href = "dashboard.php"; // Zmień na swoją stronę docelową
                    }, 3000); // 3000 ms = 3 sekund
                </script>';
            } else {
                echo '  <link rel="stylesheet" type="text/css" href="gamelikecss.css">
                            <link rel="stylesheet" type="text/css" href="profilelist.css">
                            <div class="tipsmaindiv">
                            <div class="tip-box">
                                <h2>Złe rozszerzenie!</h2>
                            </div>
                            </div>
                    
                    <script>
                        // Przekierowanie na dashboard.php po 3 sekundach
                        setTimeout(function() {
                            window.location.href = "dashboard.php"; // Zmień na swoją stronę docelową
                        }, 3000); // 3000 ms = 3 sekund
                    </script>';
            }
        } else {
            echo '  <link rel="stylesheet" type="text/css" href="gamelikecss.css">
                            <link rel="stylesheet" type="text/css" href="profilelist.css">
                            <div class="tipsmaindiv">
                            <div class="tip-box">
                                <h2>Za duży plik!</h2>
                            </div>
                            </div>
                    
                    <script>
                        // Przekierowanie na dashboard.php po 3 sekundach
                        setTimeout(function() {
                            window.location.href = "dashboard.php"; // Zmień na swoją stronę docelową
                        }, 3000); // 3000 ms = 3 sekund
                    </script>';
        }
    } else {
        echo '  <link rel="stylesheet" type="text/css" href="gamelikecss.css">
                            <link rel="stylesheet" type="text/css" href="profilelist.css">
                            <div class="tipsmaindiv">
                            <div class="tip-box">
                                <h2>Błąd przesyłu!</h2>
                            </div>
                            </div>
                    
                    <script>
                        // Przekierowanie na dashboard.php po 3 sekundach
                        setTimeout(function() {
                            window.location.href = "dashboard.php"; // Zmień na swoją stronę docelową
                        }, 3000); // 3000 ms = 3 sekund
                    </script>';
    }
} else {
    echo '  <link rel="stylesheet" type="text/css" href="gamelikecss.css">
                            <link rel="stylesheet" type="text/css" href="profilelist.css">
                            <div class="tipsmaindiv">
                            <div class="tip-box">
                                <h2>Błąd przesyłu!</h2>
                            </div>
                            </div>
                    
                    <script>
                        // Przekierowanie na dashboard.php po 3 sekundach
                        setTimeout(function() {
                            window.location.href = "dashboard.php"; // Zmień na swoją stronę docelową
                        }, 3000); // 3000 ms = 3 sekund
                    </script>';
}

// Zamykamy połączenie z bazą danych
$conn->close();
?>