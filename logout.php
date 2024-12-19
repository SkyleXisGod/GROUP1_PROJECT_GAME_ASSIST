

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

<?php
echo '<link rel="stylesheet" type="text/css" href="gamelikecss.css">';
session_start();
session_unset();
session_destroy();
header("Location: index.php");
exit();
?>

</body>
</html>