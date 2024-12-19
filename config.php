<?php
function getDBConnection() {
    $servername = "localhost"; // nazwa
    $username = "root"; // nick
    $password = ""; // hasło
    $dbname = "gameassistandb"; // baza
    
    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    return $conn;
}
?>