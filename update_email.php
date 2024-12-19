<?php
session_start();

// Sprawdzamy, czy użytkownik jest zalogowany
if (!isset($_SESSION['username'])) {
    header("Location: index.php");
    exit();
}

// Połączenie z bazą danych
include "config.php";

$conn = getDBConnection();

// Pobieramy dane użytkownika na podstawie sesji
$user = $_SESSION['username'];

// Pobieramy ID użytkownika
$sqlGetUserId = "SELECT ID FROM users WHERE username = ?";
$stmtGetUserId = $conn->prepare($sqlGetUserId);
$stmtGetUserId->bind_param("s", $user);
$stmtGetUserId->execute();
$resultUser = $stmtGetUserId->get_result();

// Sprawdzamy, czy użytkownik istnieje
if ($resultUser->num_rows === 0) {
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
                            window.location.href = "dashboard.php"; // Zmień na swoją stronę docelową
                        }, 3000); // 3000 ms = 3 sekund
                    </script>';
}

$userData = $resultUser->fetch_assoc();
$userId = $userData['ID']; // Zapisujemy ID użytkownika

// Sprawdzamy, czy formularz został wysłany
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['email'])) {
    $email = trim($_POST['email']);
    
    // Walidacja e-maila
    if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
        // Sprawdzamy, czy użytkownik ma już rekord w tabeli user_info
        $sqlCheckUserInfo = "SELECT * FROM user_info WHERE user_id = ?";
        $stmtCheckUserInfo = $conn->prepare($sqlCheckUserInfo);
        $stmtCheckUserInfo->bind_param("i", $userId);
        $stmtCheckUserInfo->execute();
        $resultCheck = $stmtCheckUserInfo->get_result();

        if ($resultCheck->num_rows > 0) {
            // Jeśli rekord istnieje, aktualizujemy e-maila
            $sqlUpdateEmail = "UPDATE user_info SET additional_info = ? WHERE user_id = ?";
            $stmtUpdateEmail = $conn->prepare($sqlUpdateEmail);
            $stmtUpdateEmail->bind_param("si", $email, $userId);
            
            if ($stmtUpdateEmail->execute()) {
                // Zmieniamy rolę użytkownika w tabeli users na "3"
                $sqlUpdateRole = "UPDATE users SET ROLEID = 3 WHERE ID = ?";
                $stmtUpdateRole = $conn->prepare($sqlUpdateRole);
                $stmtUpdateRole->bind_param("i", $userId);

                if ($stmtUpdateRole->execute()) {
                    echo '  <link rel="stylesheet" type="text/css" href="gamelikecss.css">
                            <link rel="stylesheet" type="text/css" href="profilelist.css">
                            <div class="tipsmaindiv">
                            <div class="tip-box">
                                <h2>Email pomyślnie zaktualizowany!</h2>
                            </div>
                            </div>
                    
                    <script>
                        // Przekierowanie na index.php po 7 sekundach
                        setTimeout(function() {
                            window.location.href = "dashboard.php"; // Zmień na swoją stronę docelową
                        }, 3000); // 3000 ms = 3 sekund
                    </script>';
                } else {
                    echo '  <link rel="stylesheet" type="text/css" href="gamelikecss.css">
                            <link rel="stylesheet" type="text/css" href="profilelist.css">
                            <div class="tipsmaindiv">
                            <div class="tip-box">
                                <h2>Błąd przypisu roli!</h2>
                            </div>
                            </div>
                    
                    <script>
                        // Przekierowanie na index.php po 7 sekundach
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
            // Przekierowanie na index.php po 7 sekundach
            setTimeout(function() {
                window.location.href = "dashboard.php"; // Zmień na swoją stronę docelową
            }, 3000); // 3000 ms = 3 sekund
        </script>';
            }
        } else {
            // Jeśli rekord w tabeli user_info nie istnieje, tworzymy go
            $sqlInsertEmail = "INSERT INTO user_info (user_id, additional_info) VALUES (?, ?)";
            $stmtInsertEmail = $conn->prepare($sqlInsertEmail);
            $stmtInsertEmail->bind_param("is", $userId, $email);
            
            if ($stmtInsertEmail->execute()) {
                // Zmieniamy rolę użytkownika w tabeli users na "3"
                $sqlUpdateRole = "UPDATE users SET ROLEID = 3 WHERE ID = ?";
                $stmtUpdateRole = $conn->prepare($sqlUpdateRole);
                $stmtUpdateRole->bind_param("i", $userId);

                if ($stmtUpdateRole->execute()) {
                    echo '  <link rel="stylesheet" type="text/css" href="gamelikecss.css">
                            <link rel="stylesheet" type="text/css" href="profilelist.css">
                            <div class="tipsmaindiv">
                            <div class="tip-box">
                                <h2>Email dodany! Gratulujemy członkostwa+!</h2>
                            </div>
                            </div>
                    
                    <script>
                        // Przekierowanie na index.php po 7 sekundach
                        setTimeout(function() {
                            window.location.href = "dashboard.php"; // Zmień na swoją stronę docelową
                        }, 3000); // 3000 ms = 3 sekund
                    </script>';
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
        }
    } else {
        echo '  <link rel="stylesheet" type="text/css" href="gamelikecss.css">
                            <link rel="stylesheet" type="text/css" href="profilelist.css">
                            <div class="tipsmaindiv">
                            <div class="tip-box">
                                <h2>Niepoprawny email!</h2>
                            </div>
                            </div>
                    
                    <script>
                        // Przekierowanie na index.php po 7 sekundach
                        setTimeout(function() {
                            window.location.href = "dashboard.php"; // Zmień na swoją stronę docelową
                        }, 3000); // 3000 ms = 3 sekund
                    </script>';
    }
}
?>