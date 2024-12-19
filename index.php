<?php
session_start();
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> SkillShot Academy / Logowanie / Rejestracja </title>
    <link rel="stylesheet" type="text/css" href="gamelikecss.css">
    <link rel="shortcut icon" href="radiant-rank.png">
</head>
<body>

    <div class="headerdiv">
    <img src="radiant-rank.png" style="width: 150px;heigth: 150px;"><br><br>
    <h1 class="glow">SkillShot Academy</h1><br>
    </div>
    <div class="maindiv">
        <div class="div">
            <?php
            if (isset($_SESSION['username'])) {
                    echo '<p>Jesteś zalogowany jako ' . $_SESSION['username'] . '.</p>';
                    echo '<a href="logout.php">Wyloguj się</a>';
            } else {
                echo '<h3>Logowanie</h3>
                    <form action="login.php" method="POST">
                        <label for="username">Nazwa użytkownika:</label><br>
                        <input type="text" id="username" name="username" required><br>
        
                        <label for="password">Hasło:</label><br>
                        <input type="password" id="password" name="password" required><br><br>
        
                        <center><button type="submit">Zaloguj się</button></center><br><br>

                        <p> Nie masz konta? <a href="registerindex.php" class="linkglow"> Zarejestruj się! </a> </p>
                    </form></div><br>';

            }
            ?>
        </div>
    </div>
    <div class="footerdiv">
        <div class="footerdivleft">
        <h2> 
        <b><i> I N F O: </b></i><br>
        </h2>
        </div>
        <div class="footerdivright">
        <a class="linkbut" href="https://support-valorant.riotgames.com/hc/en-us/categories/360003432993-VALORANT-Basics-FAQs"><img alt="faq-link" src="faq-logo.png" style="width: 90px; height: 80px;"></a><br><br>
        <a class="linkbut" href="https://discord.gg/JjmAzzcxsh"><img alt="discord-server-link" src="discord-logo.png" style="width: 80px; height: 60px;"></a><br><br>
        <a class="linkbut" href="https://www.riotgames.com/pl"><img alt="riot-games-link" src="riot-logo.png" style="width: 80px; height: 80px;"></a><br><br>
        <a class="linkbut" href="https://playvalorant.com/pl-pl/?utm_medium=card2%2Bwww.riotgames.com&utm_source=riotbar"><img alt="valorant-link" src="valorant-logo.png" style="width: 100px; height: 70px;"></a><br><br>
        </div>
    </div>
</body>
</html>