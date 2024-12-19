<?php
if (isset($_GET['crosshair_id'])) {
    $crosshairId = $_GET['crosshair_id'];

    // Połączenie z bazą danych
    include "config.php";

    $conn = getDBConnection();

    $sql = "SELECT IMAGE FROM crosshairs WHERE ID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $crosshairId);
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($imageData);

    if ($stmt->fetch()) {
        header("Content-Type: image/jpeg");
        echo $imageData;
    } else {
        http_response_code(404);
        echo "Image not found";
    }

    $stmt->close();
    $conn->close();
} else {
    http_response_code(400);
    echo "Invalid request";
}
?>
