
<?php
session_start();
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
        <h2>Zmiana hasła</h2>
        <form action="change_password.php" method="POST">
        <label for="current_password">Aktualne hasło:</label>
        <input type="password" id="current_password" name="current_password" required><br><br>

        <label for="new_password">Nowe hasło:</label>
        <input type="password" id="new_password" name="new_password" required><br><br>

        <label for="confirm_password">Potwierdź nowe hasło:</label>
        <input type="password" id="confirm_password" name="confirm_password" required><br><br>

        <button type="submit" name="submit">Zmień hasło</button>
        </div>
    </div>

    <div style="padding-left: 50px;" class="settingstopheaderdiv">
        <button onclick="window.location.href='dashboard.php';">Przejdź do Dashboard</button>
    </div>
</div>

</body>
</html>
