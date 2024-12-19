<?php
session_start();

// Połączenie z bazą danych
function getDBConnection() {
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "gameassistandb";

    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    return $conn;
}
$conn = getDBConnection();
// Pobieramy username z sesji
$username = isset($_SESSION['username']) ? $_SESSION['username'] : null;

$profilePic = 'https://via.placeholder.com/50';
$linkHref = 'siteinformations.php';
$linkClass = '';
$lockedIcon = '';

// Jeśli użytkownik jest zalogowany, pobieramy dane użytkownika i sprawdzamy jego rolę
if ($username) {
    // Pobieramy dane użytkownika
    $sql = "SELECT u.ID, p.PROFILEPICFILE, u.ROLEID 
            FROM users u
            LEFT JOIN profilepics p ON u.ID = p.USERID
            WHERE u.username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('s', $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $profilePic = $row['PROFILEPICFILE'] ? 'data:image/jpeg;base64,' . base64_encode($row['PROFILEPICFILE']) : 'https://via.placeholder.com/50';
        $role_id = $row['ROLEID'];

        // Jeśli użytkownik nie ma roli user+ (role_id == 2), blokujemy dostęp do statystyk
        if ($role_id == 2) {
            $lockedIcon = '<img src="lock-icon.png" alt="Locked" style="width: 16px; height: 16px; margin-left: 5px;">';
            $linkHref = '#';  // Ustawiamy href na #, aby link nie działał
            $linkClass = 'locked-link';  // Możemy dodać klasę CSS, żeby wizualnie pokazać, że link jest zablokowany
        }
    }
}
// Pobieranie Top 5 użytkowników z największą ilością logowań
function getTopUsers() {
    $conn = getDBConnection();
    $sql = "
        SELECT 
            u.username, 
            r.rank, 
            v.visit_count
        FROM users u
        LEFT JOIN user_ranks r ON u.id = r.user_id
        LEFT JOIN visit_counts v ON u.id = v.userid
        ORDER BY v.visit_count DESC
        LIMIT 5
    ";
    $result = $conn->query($sql);
    $topUsers = [];

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $topUsers[] = $row;
        }
    }
    $conn->close();
    return $topUsers;
}

// Pobieranie dystrybucji rang
function getRankDistribution() {
    $conn = getDBConnection();
    $sql = "
        SELECT 
            r.rank, 
            COUNT(u.id) AS count
        FROM users u
        LEFT JOIN user_ranks r ON u.id = r.user_id
        GROUP BY r.rank
        ORDER BY r.rank ASC
    ";
    $result = $conn->query($sql);
    $rankDistribution = [];

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $rankDistribution[] = $row;
        }
    }
    $conn->close();
    return $rankDistribution;
}

$topUsers = getTopUsers();
$rankDistribution = getRankDistribution();

// Tablica poziomów (będziesz mógł ją edytować)
$levels = [];
for ($i = 0; $i <= 25; $i++) {
    if($i == 0){
        $levels[] = "UNRATED";
    }
    elseif($i == 1){
        $levels[] = "IRON I";
    }
    elseif($i == 2){
        $levels[] = "IRON II";
    }
    elseif($i == 3){
        $levels[] = "IRON III";
    }
    elseif($i == 4){
        $levels[] = "BRONZE I";
    }
    elseif($i == 5){
        $levels[] = "BRONZE II";
    }
    elseif($i == 6){
        $levels[] = "BRONZE III";
    }
    elseif($i == 7){
        $levels[] = "SILVER I";
    }
    elseif($i == 8){
        $levels[] = "SILVER II";
    }
    elseif($i == 9){
        $levels[] = "SILVER III";
    }
    elseif($i == 10){
        $levels[] = "GOLD I";
    }
    elseif($i == 11){
        $levels[] = "GOLD II";
    }
    elseif($i == 12){
        $levels[] = "GOLD III";
    }
    elseif($i == 13){
        $levels[] = "PLATINUM I";
    }
    elseif($i == 14){
        $levels[] = "PLATINUM II";
    }
    elseif($i == 15){
        $levels[] = "PLATINUM III";
    }
    elseif($i == 16){
        $levels[] = "DIAMOND I";
    }
    elseif($i == 17){
        $levels[] = "DIAMOND II";
    }
    elseif($i == 18){
        $levels[] = "DIAMOND III";
    }
    elseif($i == 19){
        $levels[] = "ASCENDANT I";
    }
    elseif($i == 20){
        $levels[] = "ASCENDANT II";
    }
    elseif($i == 21){
        $levels[] = "ASCENDANT III";
    }
    elseif($i == 22){
        $levels[] = "IMMORTAL I";
    }
    elseif($i == 23){
        $levels[] = "IMMORTAL II";
    }
    elseif($i == 24){
        $levels[] = "IMMORTAL III";
    }
    else{
        $levels[] = "RADIANT";
    }
}

?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Top Użytkownicy i Dystrybucja Rang</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title> SkillShot Academy </title>
    <link rel="stylesheet" type="text/css" href="gamelikecss.css">
    <link rel="stylesheet" type="text/css" href="profilelist.css">
    <link rel="shortcut icon" href="radiant-rank.png">
    <script src="profilelist.js"></script>
    <script src="ranksystem.js"></script>
    <style>
        .dashboardheaderdiv {
            position: fixed; /* Nagłówek jest na stałe przypięty */
            top: 0;
            left: 0;
            width: 100%; /* Rozciąga się na całą szerokość */
            background-color: #1e1e1e; /* Tło dopasowane do reszty strony */
            z-index: 1000; /* Ustawienie wyższego z-index, aby było nad innymi elementami */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5); /* Lekki cień dla lepszej widoczności */
            padding: 10px 0; /* Dodajemy trochę miejsca dla elementów wewnętrznych */
        }

        .container {
            margin-top: 150px; /* Dodajemy odstęp od nagłówka, aby treść nie była pod nim */
        }
        body {
            display: flex;
            flex-direction: row;
            background-color: #1e1e1e;
            color: #ffffff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        .container {
            align-self: center;
            align-content: center;
            max-width: 900px;
            min-width: 900px;
            max-height: 600px;
            min-height: 600px;
            margin: 50px auto;
            padding: 20px;
            background: #282828;
            border-radius: 10px;
            box-shadow: 0 0 10px #58b8f1;
        }
        .top-users {
            margin-bottom: 30px;
        }
        .top-users table {
            width: 100%;
            border-collapse: collapse;
        }
        .top-users th, .top-users td {
            padding: 10px;
            border: 1px solid #444;
        }
        .top-users th {
            background: #58b8f1;
            color: #000;
        }
        .chart-container {
            position: relative;
            margin: auto;
            height: 400px;
            width: 100%;
        }
        .rank-image {
            width: 50px;
            height: 50px;
            object-fit: cover;
        }
        .rank-label {
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <div class="dashboardheaderdiv">
        <div class="dashboardleftheaderdiv">
            <img src="radiant-rank.png" style="width: 75px;height: 75px;"><br><br>
            <h5 class="glow2">SkillShot Academy</h5><br>
        </div>
        <div class="dashboardrightheaderdiv">
            <!-- Sekcja profilowa z rozwijalnym menu ustawień -->
            <div class="profile-container">
                <!-- Nagłówek profilu -->
                <div class="profile-header" onclick="toggleSettings()">
                    <!-- Wyświetlamy zdjęcie profilowe -->
                    <img src="<?php echo $profilePic; ?>" alt="Profil" class="profile-img">
                    <span class="username"><?php echo $username; ?></span>
                </div>

                <!-- Lista ustawień -->
                <div class="settings-list" id="settingsList">
                    <ul>
                        <li><a href="usersettings.php">Ustawienia konta</a></li>
                        <li><a href="change_password_form.php">Zmiana hasła</a></li>
                        <li><a href="<?php echo $linkHref; ?>" class="<?php echo $linkClass; ?>">Statystyki! <?php echo $lockedIcon; ?></a></li>
                        <li><a href="logout.php">Wyloguj się</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container">
        <h1>Top 5 Użytkowników</h1>
        <div class="top-users">
            <table>
                <thead>
                    <tr>
                        <th>Użytkownik</th>
                        <th>Ranga</th>
                        <th>Logowania</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($topUsers as $user): ?>
                        <tr>
                            <td><img src="<?php echo $profilePic; ?>" alt="Profil" class="profile-img"><?php echo htmlspecialchars($user['username']); ?></td>
                            <td>
                                <?php 
                                    $rank = htmlspecialchars($user['rank']); 
                                    $rankIndex = min($rank, 25); // Ograniczamy maksymalny indeks do 25
                                ?>
                                <img src="ranksystem/level<?php echo $rankIndex; ?>.png" class="rank-image" alt="Ranga">
                            </td>
                            <td><?php echo htmlspecialchars($user['visit_count']); ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
        </div>
        <div class="container">
        <h2>Dystrybucja Rang</h2>
        <div class="chart-container">
            <canvas id="rankChart"></canvas>
        </div><br><br><button onclick='window.location.href="dashboard.php"'>Przejdź do Dashboard</button>
    </div>
        </div>

    <script>
        // Dane dla wykresu
        const rankLabels = <?php echo json_encode(array_column($rankDistribution, 'rank')); ?>;
        const rankCounts = <?php echo json_encode(array_column($rankDistribution, 'count')); ?>;

        // Tablica poziomów do etykiet na osi X
        const levels = <?php echo json_encode($levels); ?>;

        // Tworzenie wykresu słupkowego
        const ctx = document.getElementById('rankChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: rankLabels.map(rank => levels[rank]), // Używamy poziomów jako etykiety
                datasets: [{
                    label: 'Ilość użytkowników',
                    data: rankCounts,
                    backgroundColor: 'rgba(88, 184, 241, 0.8)',
                    borderColor: 'rgba(88, 184, 241, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            color: '#ffffff'
                        }
                    },
                    x: {
                        ticks: {
                            color: '#ffffff'
                        }
                    }
                },
                plugins: {
                    legend: {
                        labels: {
                            color: '#ffffff'
                        }
                    }
                }
            }
        });
    </script>
</body>
</html>
