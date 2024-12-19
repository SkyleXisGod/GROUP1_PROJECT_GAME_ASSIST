-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2024 at 04:40 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gameassistandb`
--

-- --------------------------------------------------------

--
-- Table structure for table `ability_c`
--

CREATE TABLE `ability_c` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  `SHOWCASE` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ability_c`
--

INSERT INTO `ability_c` (`ID`, `NAME`, `DESCRIPTION`, `SHOWCASE`) VALUES
(1, 'Stim Beacon', 'Używa urządzenia stymulującego, które przyspiesza tempo strzelania sojuszników w jego pobliżu.', 0x6b6c697020747a772e2073686f7763617365),
(2, 'Blaze', 'Wytwarza barierę ognia, która blokuje widoczność i rani wrogów w jej zasięgu.', 0x747a772e2073686f7763617365),
(3, 'Barrier Orb', 'Tworzy solidną barierę, która blokuje wrogów i kontroluje przestrzeń.', 0x6b6c697020747a772e2073686f7763617365),
(4, 'Owl Drone', 'Wystrzeliwuje drona, którym można sterować, aby oznaczać wrogów za pomocą pocisku śledzącego.', 0x6b6c697020747a772e2073686f7763617365),
(5, 'Snake Bite', 'Wystrzeliwuje ampułkę chemiczną, która po uderzeniu tworzy trujące pole zadające obrażenia wrogom.', 0x6b6c697020747a772e2073686f7763617365),
(6, 'Tripwire', 'Cypher instaluje niewidoczną linię, która po aktywacji przez wroga powoduje unieruchomienie i stunuj', 0x6b6c697020747a772e2073686f7763617365),
(7, 'Leer', 'Reyna rzuca magiczny obiekt, który przesłania wizję wrogów w obszarze, w którym się znajduje.', 0x6b6c697020747a772e2073686f7763617365),
(8, 'Nanoswarm', 'Killjoy rzuca granat, który wybucha, zadając obrażenia wrogom w zasięgu, tworząc pole magnetyczne.', 0x6b6c697020747a772e2073686f7763617365),
(9, 'Aftershock', 'Breach wystrzeliwuje ładunek, który eksploduje, zadając obrażenia wrogom w jego zasięgu.', 0x6b6c697020747a772e2073686f7763617365),
(10, 'Shrouded Step', 'Omen teleportuje się na krótki dystans w wybrane miejsce, znikając z widoku na moment.', 0x6b6c697020747a772e2073686f7763617365),
(11, 'Boom Bot', 'Raze wystrzeliwuje robota, który porusza się po powierzchni, wykrywając wrogów i wybuchając.', 0x6b6c697020747a772e2073686f7763617365),
(12, 'Cloudburst', 'Jett wystrzeliwuje chmurę dymu, która zasłania widoczność w określonym obszarze.', 0x6b6c697020747a772e2073686f7763617365),
(13, 'Regrowth', 'Skye używa mocy do leczenia sojuszników w zasięgu lub samej siebie.', 0x6b6c697020747a772e2073686f7763617365),
(14, 'Fakeout', 'Yoru rzuca fałszywą kopię siebie, która emituje dźwięk, myląc wrogów.', 0x6b6c697020747a772e2073686f7763617365),
(15, 'FRAG/ment', 'KAY/O rzuca granat, który dzieli się na fragmenty, zadając obrażenia wrogom w jego zasięgu.', 0x6b6c697020747a772e2073686f7763617365),
(16, 'Gravity Well', 'Astra tworzy strefę, która wciąga wrogów, a potem wybucha, zadając obrażenia tymczasowe.', 0x6b6c697020747a772e2073686f7763617365),
(17, 'Trademark', 'Chamber instaluje niewidoczny drut, który powoduje unieruchomienie wroga po aktywacji.', 0x6b6c697020747a772e2073686f7763617365),
(18, 'Fast Lane', 'Neon tworzy dwie linie błyskawicy, które przechodzą przez przeszkody.', 0x6b6c697020747a772e2073686f7763617365),
(19, 'Prowler', 'Fade wysyła stwora, który ściga i oślepia wrogów, zwiększając ich podatność na ataki.', 0x6b6c697020747a772e2073686f7763617365),
(20, 'Cascade', 'Wytwarza ruchomą ścianę wody, która spowalnia przeciwników.', 0x6b6c697020747a772e2073686f7763617365),
(21, 'Mosh Pit', 'Rzuca bombę, która eksploduje, zadając obrażenia po czasie.', 0x6b6c697020747a772e2073686f7763617365),
(22, 'GravNet', 'Rzuca sieć grawitacyjną, która unieruchamia przeciwników.', 0x6b6c697020747a772e2073686f7763617365),
(23, 'Undercut', 'Rzuca ostrze energetyczne, które podwaja obrażenia na przeciwnikach w obszarze.', 0x6b6c697020747a772e2073686f7763617365),
(24, 'Pick-me-up', 'Po zabiciu wroga może wyleczyć się na chwilę do maksymalnego życia.', 0x6b6c697020747a772e2073686f7763617365),
(25, 'Razorvine', 'Rzuca na ziemię pułapkę, która po aktywacji zamienia się w pole zadające obrażenia podczas ruchu.', 0x6b6c697020747a772e2073686f7763617365);

-- --------------------------------------------------------

--
-- Table structure for table `ability_e`
--

CREATE TABLE `ability_e` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  `SHOWCASE` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ability_e`
--

INSERT INTO `ability_e` (`ID`, `NAME`, `DESCRIPTION`, `SHOWCASE`) VALUES
(1, 'Sky Smokes', 'Rzuca dym, który blokuje widoczność, pozwalając na kontrolowanie przestrzeni.', 0x6b6c697020747a772e2073686f7763617365),
(2, 'Hot Hands', 'Rzuca ognisty pocisk, który leczy Phoenixa lub zadaje obrażenia wrogom w jego zasięgu.', 0x6b6c697020747a772e2073686f7763617365),
(3, 'Healing Orb', 'Leczy sojusznika lub siebie w czasie rzeczywistym.', 0x6b6c697020747a772e2073686f7763617365),
(4, 'Recon Bolt', 'Wystrzeliwuje strzałę, która ujawnia wrogów w jej zasięgu widzenia.', 0x6b6c697020747a772e2073686f7763617365),
(5, 'Toxic Screen', 'Rozstawia rząd emitujących gaz urządzeń, które po aktywacji tworzą ścianę toksycznego gazu.', 0x6b6c697020747a772e2073686f7763617365),
(6, 'Spycam', 'Cypher instaluje kamerę, którą można aktywować, by uzyskać widok na otoczenie i oznaczyć wrogów.', 0x6b6c697020747a772e2073686f7763617365),
(7, 'Dismissing', 'Reyna może teleportować się na krótką odległość, aby unikać ataków lub poprawić swoją pozycję.', 0x6b6c697020747a772e2073686f7763617365),
(8, 'Turret', 'Killjoy rozmieszcza małą wieżyczkę, która automatycznie wykrywa i ostrzega przed wrogami w zasięgu.', 0x6b6c697020747a772e2073686f7763617365),
(9, 'Quake', 'Breach wystrzeliwuje falę energii, która ogłusza wrogów w jej zasięgu.', 0x6b6c697020747a772e2073686f7763617365),
(10, 'Dark Cover', 'Omen tworzy kulę cienia, którą może kontrolować, aby zasłonić widoczność na określonym obszarze.', 0x6b6c697020747a772e2073686f7763617365),
(11, 'Paint Shells', 'Raze wyrzuca granat, który eksploduje na małe kawałki, zadając obrażenia wrogom w ich zasięgu.', 0x6b6c697020747a772e2073686f7763617365),
(12, 'Tailwind', 'Jett wykonuje błyskawiczny ruch w określonym kierunku, dzięki czemu może szybko zmieniać pozycję.', 0x6b6c697020747a772e2073686f7763617365),
(13, 'Guiding Light', 'Skye steruje ptakiem, który eksploduje, oślepiając wrogów w pobliżu.', 0x6b6c697020747a772e2073686f7763617365),
(14, 'Gatecrash', 'Yoru wysyła portal w określony punkt, który może przejść, teleportując się do niego.', 0x6b6c697020747a772e2073686f7763617365),
(15, 'ZERO/point', 'KAY/O wysyła urządzenie, które wyłącza umiejętności wrogów w danym obszarze.', 0x6b6c697020747a772e2073686f7763617365),
(16, 'Nebula', 'Astra tworzy dymną zasłonę, która blokuje widoczność, zmieniając pole bitwy.', 0x6b6c697020747a772e2073686f7763617365),
(17, 'Rendezvous', 'Chamber tworzy punkt teleportacji, który umożliwia mu szybkie przemieszczanie się po mapie.', 0x6b6c697020747a772e2073686f7763617365),
(18, 'High Gear', 'Neon wyzwala z siebie energię co umożliwia jej bieganie.', 0x6b6c697020747a772e2073686f7763617365),
(19, 'Haunt', 'Fade rzuca oko, który prześladuje wrogów, i oznacza ich przez ścianę. Można robić combo z prowler.', 0x6b6c697020747a772e2073686f7763617365),
(20, 'High Tide', 'Rozstawia zakrzywioną ścianę wody, blokując widoczność.', 0x6b6c697020747a772e2073686f7763617365),
(21, 'Wingman', 'Wysyła stworzenie, które może rozbrajać lub podkładać spike i stunować.', 0x6b6c697020747a772e2073686f7763617365),
(22, 'Barrier Mesh', 'Tworzy barierę w kształcie X, która blokuje wrogów.', 0x6b6c697020747a772e2073686f7763617365),
(23, 'Contingency Shield', 'Rzuca wolną tarczę do przodu, która absorbuje obrażenia.', 0x6b6c697020747a772e2073686f7763617365),
(24, 'Ruse', 'Tworzy zasłonę dymną, w środku której dźwięki są lekko przytłumione.', 0x6b6c697020747a772e2073686f7763617365),
(25, 'Arc Rose', 'Tworzy różę, umożliwia oślepienie wroga.', 0x6b6c697020747a772e2073686f7763617365);

-- --------------------------------------------------------

--
-- Table structure for table `ability_q`
--

CREATE TABLE `ability_q` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  `SHOWCASE` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ability_q`
--

INSERT INTO `ability_q` (`ID`, `NAME`, `DESCRIPTION`, `SHOWCASE`) VALUES
(1, 'Incendiary', 'Wystrzela granat zapalający, który tworzy pole ognia, zadające obrażenia w zasięgu.', 0x747a772e2073686f7763617365),
(2, 'Curveball', 'Rzuca granat błyskowy, który oślepia przeciwników w jego zasięgu.', 0x6b6c697020747a772e2073686f7763617365),
(3, 'Slow Orb', 'Rzuca kulę, która tworzy pole spowalniające ruch wrogów w zasięgu.', 0x6b6c697020747a772e2073686f7763617365),
(4, 'Shock Bolt', 'Wystrzeliwuje strzałę, która eksploduje, zadając obrażenia wrogom w obszarze eksplozji.', 0x6b6c697020747a772e2073686f7763617365),
(5, 'Poison Cloud', 'Rzuca granat chemiczny, który po aktywacji tworzy toksyczną chmurę gazu.', 0x6b6c697020747a772e2073686f7763617365),
(6, 'Cyber Cage', 'Cypher rzuca pułapkę, która blokując widoczność powoduje dźwięk przy wchodzeniu w nią.', 0x6b6c697020747a772e2073686f7763617365),
(7, 'Soul Orbs', 'Po zabiciu wroga, Reyna może zebrać dusze, które pozwalają na natychmiastowe leczenie.', 0x6b6c697020747a772e2073686f7763617365),
(8, 'Alarmbot', 'Rozstawia pułapkę, która po aktywacji wybucha, nakładając osłabienie.', 0x6b6c697020747a772e2073686f7763617365),
(9, 'Flashpoint', 'Breach wystrzeliwuje ładunek, który oślepia wrogów w linii wzroku.', 0x6b6c697020747a772e2073686f7763617365),
(10, 'Paranoia', 'Omen wystrzeliwuje cienie, które przelatują przez ściany, oślepiając wrogów w zasięgu.', 0x6b6c697020747a772e2073686f7763617365),
(11, 'Blast Pack', 'Raze rzuca ładunek wybuchowy, który może przemieszczać wrogów lub pozwolić na lot Raze.', 0x6b6c697020747a772e2073686f7763617365),
(12, 'Updraft', 'Jett kumuluję energię, aby wykonać potężny skok w górę, zyskując lepszą widoczność lub unikając.', 0x6b6c697020747a772e2073686f7763617365),
(13, 'Trailblazer', 'Skye steruje psem, który przeszukuje teren i spowalnia wrogów po skoczeniu na nich.', 0x6b6c697020747a772e2073686f7763617365),
(14, 'Blindside', 'Yoru wystrzeliwuje kulę, która oślepia wszystkich wrogów w zasięgu.', 0x6b6c697020747a772e2073686f7763617365),
(15, 'FLASH/drive', 'KAY/O rzuca granat błyskowy, który oślepia wrogów w zasięgu.', 0x6b6c697020747a772e2073686f7763617365),
(16, 'Nova Pulse', 'Astra tworzy pole, które wybucha po kilku sekundach, ogłuszając wrogów w zasięgu.', 0x6b6c697020747a772e2073686f7763617365),
(17, 'Headhunter', 'Chamber używa pistoletu, który wystrzeliwuje precyzyjne, śmiertelne strzały.', 0x6b6c697020747a772e2073686f7763617365),
(18, 'Relay Bolt', 'Neon rzuca pocisk, który odbija się raz od ściany tworząc dwa pola elektryczności, stunując wrogów.', 0x6b6c697020747a772e2073686f7763617365),
(19, 'Seize', 'Fade rzuca wiązkę, które przyciąga wrogów w określony obszar.', 0x6b6c697020747a772e2073686f7763617365),
(20, 'Cove', 'Tworzy wodną kopułę chroniącą sojuszników przed ostrzałem.', 0x6b6c697020747a772e2073686f7763617365),
(21, 'Dizzy', 'Wypuszcza stworzenie, które oślepia wrogów w zasięgu widzenia.', 0x6b6c697020747a772e2073686f7763617365),
(22, 'Sonic Sensor', 'Instaluje urządzenie wykrywające dźwięk, które stunuje wrogów w zasięgu.', 0x6b6c697020747a772e2073686f7763617365),
(23, 'Double Tap', 'Aktywuje czasową tarczę, która absorbuje dowolny atak, po zabójstwie można odnowić.', 0x6b6c697020747a772e2073686f7763617365),
(24, 'Meddle', 'Rzuca kulą, która powoduje rozkład u przeciwnika ( tymczasowy dmg ).', 0x6b6c697020747a772e2073686f7763617365),
(25, 'Shear', 'To ściana aktywująca się po przejściu przeciwnika przez nią, niezniszczalna.', 0x6b6c697020747a772e2073686f7763617365);

-- --------------------------------------------------------

--
-- Table structure for table `ability_x`
--

CREATE TABLE `ability_x` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  `SHOWCASE` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ability_x`
--

INSERT INTO `ability_x` (`ID`, `NAME`, `DESCRIPTION`, `SHOWCASE`) VALUES
(1, 'Orbital Strike', 'Potężny atak orbitalny, który zadaje ogromne obrażenia w jego obszarze.', 0x6b6c697020747a772e2073686f7763617365),
(2, 'Run It Back', 'Phoenix używa swojego ulta, aby ponownie się odrodzić w miejscu, w którym został użyty.', 0x6b6c697020747a772e2073686f7763617365),
(3, 'Resurrection', 'Ożywia upadłego sojusznika z pełnym zdrowiem.', 0x6b6c697020747a772e2073686f7763617365),
(4, 'Hunter\'s Fury', 'Wystrzeliwuje trzy potężne wiązki energii, które przebijają ściany i oznaczają wrogów.', 0x6b6c697020747a772e2073686f7763617365),
(5, 'Viper\'s Pit', 'Tworzy ogromną chmurę toksycznego gazu, która utrzymuje się, dopóki Viper pozostaje w jej zasięgu.', 0x6b6c697020747a772e2073686f7763617365),
(6, 'Neural Theft', 'Cypher kradnie dane z ciała upadłego wroga, ujawniając lokalizacje wszystkich żywych przeciwników.', 0x6b6c697020747a772e2073686f7763617365),
(7, 'Empress', 'Reyna przechodzi w tryb łowcy co daje zwiększoną szybkość wszystkiego i może używać dusz do woli.', 0x6b6c697020747a772e2073686f7763617365),
(8, 'Lockdown', 'Killjoy rozmieszcza duży emitujące fale urządzenie, które unieruchamia wrogów po czasie w zasięgu.', 0x6b6c697020747a772e2073686f7763617365),
(9, 'Rolling thunder', 'Breach wyzwala potężny wstrząs ziemi, który powoduje przemieszczenie i ogłuszenie wrogów w zasięgu.', 0x6b6c697020747a772e2073686f7763617365),
(10, 'From the Shadows', 'Omen teleportuje się w wybranym miejscu, a jego obecność zostaje ujawniona dopiero po chwili.', 0x6b6c697020747a772e2073686f7763617365),
(11, 'Showstopper', 'Raze używa potężnej rakietnicy, która wystrzeliwuje rakietę, niszcząc wrogów w obszarze trafienia.', 0x6b6c697020747a772e2073686f7763617365),
(12, 'Blade Storm', 'Jett aktywuje noże, które mogą być rzucane zadając obrażenia na dużą odległość bez rozrzutu.', 0x6b6c697020747a772e2073686f7763617365),
(13, 'Seekers', 'Skye wystrzeliwuje trzy \"poszukiwacze\" ( kapusty xD ), które spowalniają i oznaczają wrogów.', 0x6b6c697020747a772e2073686f7763617365),
(14, 'Dimensional Drift', 'Yoru używa ulta, który pozwala mu przejść do innej rzeczywistości, niewidzialnym dla wrogów.', 0x6b6c697020747a772e2073686f7763617365),
(15, 'NULL/CMD', 'KAY/O wysyła impuls wyłączający umiejętności przeciwników w obszarze i umożliwia podniesienie go.', 0x6b6c697020747a772e2073686f7763617365),
(16, 'Astral Form/Cosmic Divide', 'Astra przechodzi w Astral Form przez co może umieszczać umiejętności i ścianę dzielącą mapę ( ult ).', 0x6b6c697020747a772e2073686f7763617365),
(17, 'Tour de Force', 'Chamber używa snajperki, która eliminuje wrogów jednym precyzyjnym strzałem.', 0x6b6c697020747a772e2073686f7763617365),
(18, 'Overdrive', 'Neon uruchamia tryb \"overdrive\", który pozwala jej biegać szybciej i wystrzeliwać potężne wiązkę ele', 0x6b6c697020747a772e2073686f7763617365),
(19, 'Nightfall', 'Fade używa fali ciemności, by przeszukać teren, oznaczyć wrogów i osłabić ich.', 0x6b6c697020747a772e2073686f7763617365),
(20, 'Reckoning', 'Wywołuje deszcz energii wodnej, oznaczając i osłabiając przeciwników w zasięgu.', 0x6b6c697020747a772e2073686f7763617365),
(21, 'Thrash', 'Kontroluje stwora, który atakuje i unieruchamia wrogów.', 0x6b6c697020747a772e2073686f7763617365),
(22, 'Annihilation', 'Wystrzeliwuje pocisk wiążący przeciwnika w kokon, unieruchamiając go.', 0x6b6c697020747a772e2073686f7763617365),
(23, 'Kill Contract', 'Wyzywa wroga na pojedynek 1v1 w odizolowanej przestrzeni.', 0x6b6c697020747a772e2073686f7763617365),
(24, 'Not DEAD Yet', 'Umożliwia odrodzenie się chwilowe Clove, w przypadku zabicie przeciwnika, na zawsze.', 0x6b6c697020747a772e2073686f7763617365),
(25, 'Steel Garden', 'Na określony czas zabiera przeciwnikowi broń główną, można używać noża lub pistoletu.', 0x6b6c697020747a772e2073686f7763617365);

-- --------------------------------------------------------

--
-- Stand-in structure for view `administratorcount`
-- (See below for the actual view)
--
CREATE TABLE `administratorcount` (
`Administrator` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `bronie`
--

CREATE TABLE `bronie` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(50) NOT NULL,
  `PRICE` int(11) NOT NULL,
  `ACC` int(11) NOT NULL,
  `DMG` int(11) NOT NULL,
  `PEN` int(11) NOT NULL,
  `ICON` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bronie`
--

INSERT INTO `bronie` (`ID`, `NAME`, `TYPE`, `PRICE`, `ACC`, `DMG`, `PEN`, `ICON`) VALUES
(1, 'Vandal', 'Rifle', 2900, 5, 5, 3, 'icons/vandal.png'),
(2, 'Phantom', 'Rifle', 2900, 5, 4, 3, 'icons/phantom.png'),
(3, 'Guardian', 'Rifle', 2250, 4, 4, 4, 'icons/guardian.png'),
(4, 'Bulldog', 'Rifle', 2050, 3, 3, 3, 'icons/bulldog.png'),
(5, 'Marshal', 'Sniper', 950, 5, 4, 2, 'icons/marshal.png'),
(6, 'Outlaw', 'Sniper', 2400, 5, 5, 4, 'icons/outlaw.png'),
(7, 'Operator', 'Sniper', 4700, 5, 5, 5, 'icons/operator.png'),
(8, 'Classic', 'Sidearm', 0, 2, 2, 1, 'icons/classic.png'),
(9, 'Shorty', 'Sidearm', 200, 3, 1, 1, 'icons/shorty.png'),
(10, 'Frenzy', 'Sidearm', 450, 3, 2, 1, 'icons/frenzy.png'),
(11, 'Ghost', 'Sidearm', 500, 4, 3, 2, 'icons/ghost.png'),
(12, 'Sheriff', 'Sidearm', 800, 4, 4, 3, 'icons/sheriff.png'),
(13, 'Stinger', 'SMG', 1100, 3, 2, 2, 'icons/stinger.png'),
(14, 'Spectre', 'SMG', 1600, 4, 3, 2, 'icons/spectre.png'),
(15, 'Ares', 'LMG', 1550, 3, 3, 4, 'icons/ares.png'),
(16, 'Odin', 'LMG', 3200, 4, 2, 4, 'icons/odin.png'),
(17, 'Bucky', 'Shotgun', 1850, 2, 4, 2, 'icons/bucky.png'),
(18, 'Judge', 'Shotgun', 1850, 2, 4, 2, 'icons/judge.png');

-- --------------------------------------------------------

--
-- Stand-in structure for view `championsabilities`
-- (See below for the actual view)
--
CREATE TABLE `championsabilities` (
`NAME` varchar(100)
,`ability_c` varchar(100)
,`ability_e` varchar(100)
,`ability_q` varchar(100)
,`ability_x` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `champs`
--

CREATE TABLE `champs` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(500) NOT NULL,
  `ROLE` int(11) NOT NULL,
  `ABILITY_C` int(11) NOT NULL,
  `ABILITY_E` int(11) NOT NULL,
  `ABILITY_Q` int(11) NOT NULL,
  `ABILITY_X` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `champs`
--

INSERT INTO `champs` (`ID`, `NAME`, `DESCRIPTION`, `ROLE`, `ABILITY_C`, `ABILITY_E`, `ABILITY_Q`, `ABILITY_X`) VALUES
(1, 'Brimstone', 'Brimstone to agent w VALORANT i jeden z pierwszych kontrolerów, wprowadzony od czasu zamkniętej bety.', 2, 1, 1, 1, 1),
(2, 'Phoenix', 'Phoenix to agent w VALORANT, kontroler ognia, który jest w stanie leczyć siebie oraz zadać wielkie obrażenia.', 1, 2, 2, 2, 2),
(3, 'Sage', 'Sage to agent wspierający w VALORANT, znana ze swoich zdolności do ochrony i leczenia drużyny.', 4, 3, 3, 3, 3),
(4, 'Sova', 'Sova to agent zwiadowczy w VALORANT, mistrz w ujawnianiu pozycji wrogów za pomocą zaawansowanych technologii.', 3, 4, 4, 4, 4),
(5, 'Viper', 'Viper to agentka kontrolująca pole walki w VALORANT, wykorzystująca toksyny do destabilizowania wrogów.', 2, 5, 5, 5, 5),
(6, 'Cypher', 'Cypher to agent defensywny w VALORANT, specjalizujący się w zbieraniu informacji i kontrolowaniu przestrzeni za pomocą pułapek.', 4, 6, 6, 6, 6),
(7, 'Reyna', 'Reyna to agent ofensywny w VALORANT, specjalizujący się w eliminowaniu wrogów i leczeniu siebie dzięki swojej zdolności do zbierania dusz.', 1, 7, 7, 7, 7),
(8, 'Killjoy', 'Killjoy to agentka defensywna w VALORANT, specjalizująca się w zakłócaniu ruchu przeciwnika i kontrolowaniu przestrzeni za pomocą technologii.', 4, 8, 8, 8, 8),
(9, 'Breach', 'Breach to agent ofensywny w VALORANT, specjalizujący się w wywoływaniu zamieszania i kontrolowaniu wrogów za pomocą potężnych ładunków energetycznych.', 3, 9, 9, 9, 9),
(10, 'Omen', 'Omen to agent kontroli w VALORANT, specjalizujący się w manipulowaniu widocznością i przeprowadzaniu precyzyjnych teleportacji, by zaskoczyć wrogów.', 2, 10, 10, 10, 10),
(11, 'Raze', 'Raze to agent ofensywny w VALORANT, specjalizujący się w używaniu wybuchowych narzędzi do zadawania obrażeń i kontrolowania przestrzeni.', 1, 11, 11, 11, 11),
(12, 'Jett', 'Jett to agent ofensywny w VALORANT, znany ze swojej zwinności i zdolności do manipulowania przestrzenią za pomocą swoich umiejętności.', 1, 12, 12, 12, 12),
(13, 'Skye', 'Skye to agent wspierający w VALORANT, który wykorzystuje swoje umiejętności do leczenia, spowalniania i oślepiania wrogów.', 3, 13, 13, 13, 13),
(14, 'Yoru', 'Yoru to agent z wiatrem w rękach w VALORANT, specjalizujący się w wprowadzaniu chaosu i zmyleniu wrogów.', 1, 14, 14, 14, 14),
(15, 'KAY/O', 'KAY/O to agent, który osłabia i wyłącza umiejętności wrogów, oferując wsparcie drużynie w walce.', 3, 15, 15, 15, 15),
(16, 'Astra', 'Astra to agent kontrolujący przestrzeń w VALORANT, który może zmieniać pole bitwy za pomocą różnorodnych umiejętności.', 2, 16, 16, 16, 16),
(17, 'Chamber', 'Chamber to agent w VALORANT, który wykorzystuje precyzyjne umiejętności strzeleckie oraz teleportację do kontrolowania przestrzeni.', 4, 17, 17, 17, 17),
(18, 'Neon', 'Neon to agent w VALORANT, który wykorzystuje elektryczność do przyspieszania ruchu i zadawania obrażeń.', 1, 18, 18, 18, 18),
(19, 'Fade', 'Fade to agent w VALORANT, specjalizujący się w manipulacji przestrzenią i osłabianiu wrogów za pomocą ciemności i strachów.', 3, 19, 19, 19, 19),
(20, 'Harbor', 'Harbor to kontroler, który wykorzystuje wodne zdolności do blokowania przestrzeni i wspierania sojuszników.', 2, 20, 20, 20, 20),
(21, 'Gekko', 'Gekko to unikalny agent kontrolujący pole walki za pomocą swoich stworków.', 3, 21, 21, 21, 21),
(22, 'Deadlock', 'Deadlock to agentka defensywna, kontrolująca przestrzeń za pomocą technologii wykrywającej.', 4, 22, 22, 22, 22),
(23, 'Iso', 'Iso to agent zdominowany przez agresję, wyzywający przeciwników na pojedynki.', 1, 23, 23, 23, 23),
(24, 'Clove', 'Clove to nieśmiertelny agent, który jest wsparciem dla drużyny.', 2, 24, 24, 24, 24),
(25, 'Vyse', 'Vyse to agent władający metalami. Postać opiera się na obronie site\'u.', 4, 25, 25, 25, 25);

-- --------------------------------------------------------

--
-- Table structure for table `champ_roles`
--

CREATE TABLE `champ_roles` (
  `ID` int(11) NOT NULL,
  `ROLE_NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `champ_roles`
--

INSERT INTO `champ_roles` (`ID`, `ROLE_NAME`, `DESCRIPTION`) VALUES
(1, 'Duelista', 'Dueliści to jedna z czterech ról, na które dzielą się agenci w grze VALORANT. Agenci tej roli posiad'),
(2, 'Kontroler', 'Kontrolerzy to jedna z czterech ról, na które dzielą się agenci w grze VALORANT. Umiejętności agentó'),
(3, 'Inicjator', 'Inicjatorzy to jedna z czterech ról, na które dzielą się agenci w grze VALORANT. Umiejętności agentó'),
(4, 'Sentinel', 'Sentinele to jedna z czterech ról, na które dzielą się agenci w grze VALORANT. Umiejętności agentów ');

-- --------------------------------------------------------

--
-- Table structure for table `clips`
--

CREATE TABLE `clips` (
  `ID` int(11) NOT NULL,
  `USERID` int(11) NOT NULL,
  `TITLE` varchar(20) NOT NULL,
  `VIDEO` longblob NOT NULL,
  `DATE_ADDED` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crosshairs`
--

CREATE TABLE `crosshairs` (
  `ID` int(11) NOT NULL,
  `USERID` int(11) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `IMAGE` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crosshairs`
--

INSERT INTO `crosshairs` (`ID`, `USERID`, `CODE`, `IMAGE`) VALUES
(32, 46, '0;P;c;1;o;1;0t;1;0l;5;0o;2;0a;1;0f;0;1t;3;1l;3;1o;3;1a;0;1m;0;1f;0', 0x89504e470d0a1a0a0000000d4948445200000080000000800806000000c33e61cb000000017352474200aece1ce90000042249444154785eed9ddb6e1a411044c7b9fdffff3a3795428509ac1d2c8a87a60e92a3f5b234dd55676b0612292f8b47b5022fd5d333fc02807208000000ca15281f9f0400807205cac7270100a05c81f2f14900002857a07c7c120000ca15281f9f0400807205cac7270100a05c81f2f14900002857a07c7c120000ca15281f9f0400807205cac7270100a05c81f2f14900002857a07c7c120000ca15281f9f0400807205cac7270100a05c81f2f14900002857a07c7c120000ca15281f9f0400807205cac7270100a05c81f2f14900002857a07c7c120000ca15281f9f0400807205cac7270100a05c81f2f14900002857a07c7c120000ca15281f9f0400807205cac76f4e805f9bf7b53ab40ebe9b6f0e2ab5a81c7aadf50700fd7956a0528bcaa101e0bcf801000950b90d660f70b2bd2101de32fbf253402514cf0ec091a947bbfe5baf7bbab8ec00e0f813ff3efbf953c1351e4fadd1530ff777b77f7cdf5e03f0ffeb4880810ab00778c7b4674f80b746afdcf01d89d10d00df046e5f840eccf63b5ae6abe0a2ef018e38010000b8e2a27239ac1cfa643dff1ee09fbf0cbd6341e5a57315684e80b9ae053b0780a098134b01c044d7823d034050cc89a50060a26bc19e012028e6c4520030d1b560cf0010147362290098e85ab06700088a39b114004c742dd8330004c59c580a0026ba16ec190082624e2c0500135d0bf60c0041312796028089ae057b0680a098134b01c044d7823d034050cc89a50060a26bc19e012028e6c4520030d1b560cf0010147362290098e85ab06700088a39b114004c742dd8330004c59c580a0026ba16ec190082624e2c0500135d0bf60c0041312796028089ae057b0680a098134b01c044d7823d034050cc89a50060a26bc19e012028e6c4520030d1b560cf0010147362290098e85ab06700088a39b114004c742dd8330004c59c580a0026ba16ec190082624e2c0500135d0bf69c0040353eafb57e9efeff01fdfe3dd4e3a7531dd5e6f100051200c8a42f6bad1f1700bcf7dfb1de328aea7e5d6bbd9ee0bae5355cf341050480ccd31da61f89ae1fdf713a96917ecec0eccf3b0164948f05835fb783e0fa6ed3efabdffd9caed7eb65be9245c74a947b81faa0341d97cbb06f278325b404971136c02ad850c1a2877ed7757b8218005fa3eb64b0cedb3cd597b17ee8bc9ed779fdecefa7da06901478108f4e009bbeafe57a4bdd79fb9da9e3fd9cd77a99aa639be663c1a06301a387eaeb9c0cd5c3afb3f94e1abf374bc0838c77591b26a175ec3bd2cb828df475dee0f92edf01d8f7004e03d5d5f91d0099ed48d7f3325de7f634511fbac6b0b0097c100812dd29b0afb7125ee765a437793641c678a9b8bcd38f12c077bb46f01e6107c04bcfbeb438692e13e44132f496f55de7b55966797d772a388e6de06eba3fa6e9b9a33d803770aae54de165023839f6bd83de43c079bfc01ee0418cfe062e0f8b81601c10520000000049454e44ae426082);

-- --------------------------------------------------------

--
-- Table structure for table `global_visit_count`
--

CREATE TABLE `global_visit_count` (
  `total_visits` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `global_visit_count`
--

INSERT INTO `global_visit_count` (`total_visits`) VALUES
(73);

-- --------------------------------------------------------

--
-- Table structure for table `profilepics`
--

CREATE TABLE `profilepics` (
  `USERID` int(11) NOT NULL,
  `PROFILEPICFILE` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profilepics`
--

INSERT INTO `profilepics` (`USERID`, `PROFILEPICFILE`) VALUES
(10, 0x89504e470d0a1a0a0000000d49484452000005000000036a0806000000d25be6f10000000467414d410000b18f0bfc6105000000206348524d00007a26000080840000fa00000080e8000075300000ea6000003a98000017709cba513c00000006624b474400ff00ff00ffa0bda7930000000774494d4507e807040c0a18eb18f1b0000080004944415478daecdd799c65675d27fecf73abbbd3812cec82caa223a080a2824b02380de9aa4a6008a4bb6e25ec1114044416d964910605417665111c592549f7ed4e200c245d9d30d181c00f41450177149d11942d21842cdd759fdf1f1d3009497aa95375cf39f7fd7ebde6f59a814c78ead9ce73bef79cf3490000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006055145d0074519d5dbc5f06797a6abd4f6afe3583f2a6b27bc72e3d0300d091f3dcb66d835cfcd9a726e597921c93944f64a6fe56396ff479bd03d02c0540a07b87c5f9e1afa6e6f76e600f7b7b8ebfe793cbb66d63bd0400d0e2f3dca6d33766c3e5e72699bdde7f754506f5c1e5fc9d17e92580e60c7401d0a9c3e2dc636e9e9a97e5867fc078622efefc5bf41200408bcf7349c911df7e4fbeb7f897244766b9bcab0e871bf41440731400816e29573e20c92d6fe248f9a43ab7f0341d0500d052730b2f4cadc31b3fefe5ceb924c7e92880e6280002dd52f34307fe87ca6bebe6e1fd75160040cb8e72f3c38724e5a507f18fde4a6f0134470110e89aa30ee29f599f4176d4f92d77d05d0000ed504f38f56ea9f9e383ba0f9da9be570fd0200540a06b47c77507f90fde21756697efc70000b4e004b769785466c66727b985de00587b0a8040c74e8f8343f935f8b85c5adfaed3000026787c4b4a8e28ef48724fbd0130190a8040cf95c7d5b9e113f50300c084cc2ebee826433f0058750a80c03478539d5f78806e0000585b75f3e27c4a7d899e00982c0540601aac4f2d3bea83863fa02b0000d6469ddd7ad70cea594966f406c064290002d3e2f659979df5a4938ed0150000abab6e1a1e95323827423f005a41011098263f9fe5a3dfa81b0000568fd00f80f6510004a6ed48fa24a1200000ab48e80740eb280002d348280800c02aa8b30b73423f00da4701109846424100001a5667b7de35a56c8fd00f80d6510004a695501000808608fd0068370540609a090501005821a11f00eda700084cfb9155280800c04a08fd00683d054000a12000008745e8074037280002080501003864423f00ba430110603fa12000000749e80740b7280002fc17a12000000720f403a07b140001ae7ba4150a02007053847e00748e0220c0f7120a02007003d62cf4a30e8ade06688e0220c0f7120a0200703d423f00ba4b0110e086dd3eeb32120a020020f403a0eb1400016edc71424100806927f403a0fb1400016efac82b140400986e730b2f14fa01d06d0a80000726140400984a7576612e29dbf40440b72900021c9850100060ea08fd00e80f0540808323140400981a423f00fa450110e0e0090501007a4fe80740ff2800021cda91f849757ef197f50300d05b423f007a470110e050d5fa66a12000402f8f39423f007a490110e0d0090501007a47e807407f2900021c1ea12000406f5c13fa7176847e00f4920220c0e13b2efb6efe06dd000074d9b5423feea53700fa49011060254af915a1200040a709fd00e83d05408095120a020074f51823f403602a280002ac9c501000a073847e004c0f05408066080501003a43e807c074510004688e501000a0f5847e004c1f0540802609050100daae0ba11fb5160305d01c054080e60fac42410080761e53847e004c25054080e6090501005a47e807c0f4520004baa58c6b475a2a140400680da11f00d34d011060f508050100264ee807000a8000ab49280800306973c317b43ef4038055a50008b0da6a7d73dd3cbcbf8e0000d6fc1832bb3097e4a57a0260ba290002acbef5196424140400584b423f00f80e054080b5211404005833423f00b836054080b52314040058753529595fff28423f00b8860220c05a120a0200acb6b9e10b52caa28e00e03b140001d69a50100060b58e19423f00b8010a80006b4f280800d038a11f00dc18054080c9100a02003446e80700374501106072848200002b26f40380035100049824a12000c04a09fd00e000140001264d28080070b8c788b9e16c847e0070000a800093271404003864756ef84349ce8cd00f000e400110a01d8482000007ad6e1a1e95e4dc24b7d61b001c880220407b1c97e5a35eaf1b00809b3215a11fb516230dd01c0540807679b2501000e02609fd00e010290002b48d501000e0c68e09423f00380c0a8000ed23140400f81e423f00385c0a8000edb43f146438dca02b0000a11f00ac840220407b1d974bf306dd0000d36d2a423f0058550a8000ed26140400a69dd00f0056480110a0ed848200c0f41e03847e00d000054080f6db1f0a327bdaf7eb0a00981e423f00688a02204037dc3e6579a7501000980e423f00689202204077080501802920f40380a6290002748b501000e8bbd9c5df10fa014093140001ba46280800f4f7323f379c4da92fd3130034490110a07bd667901d424100a05f847e00b05a140001bae90e424100a03f847e00b09a140001ba4b280800f480d00f00569b022040b73db9ce2efc926e00800e13fa01c02a530004e8ba52de22140400ba49e807006b410110a0fb8482004007d5134fbb4b847e00b006140001fa412808007448dd343c2ae3e50f46e8c78ddca90e8a4e0068705bd50500bd715c2e2dafd70d00d06e423f00586b0a8000fdbaa5788a5010006839a11f00ac31054080be110a0200ad25f4038049500004e81fa12000d042423f0098140540807e120a02002d22f40380495200043aa6547d70d0848200400b08fd0060d2140001fa7dcb21140400264de8070013a60008d0774241006062847e00d0060a8000fd271404002640e807006da10008301dee90b23c120a02006b43e807006da20008303d8e170a0200ab4fe807006da30008305db72442410060b5cd2d3c5fe807006da20008306d4a79539d1ffeac8e0080e6d5b9e16c527e4b4f00d0260a8000d3e788d4bc5f280800344be807006da50008309d8482004083847e00d0660a8000d34b2808003440e807006da7000830ddb72c42410060a5847e00d0720a8000d34e2808001c36a11fabd5b1b5e80480e6280002201404000e83d00f00ba42011080442808001c926b423fce8dd00f003a40011080ef100a020007e15aa11f3fae3700e802054000ae7d4b231404000e44e807001da30008c075090501801b25f403802e520004e0fa848200c00da8279e7697949c11a11f00748c02200037442808005ccb77433f6a6ea33700e81a0540006eccf1f9667d9d6e0060da09fd00a0eb140001b8893b9ef254a120004c3da11f00749c022000374d280800534ce807007da00008c081080501602a09fd00a02f1400013818424100982a423f00e8130540000e96501000a682d00f00fa4601108043b823120a02c01410fa0140cf2800027068848200d063423f00e8230540000e955010007a49e807007da50008c0e1100a0240af08fd00a0cf140001385c424100e805a11f00f49d0220002bb863120a02400fcc0d9f27f4a37d870c7d00d01c05400056462808001db63ff423bfad2700e833054000564a2808009d24f4038069a100084013848200d02975ee313717fa01c0b4500004a029424100e8849a94e44aa11f004c0d0540001abca32a4fad73c327e808005a6d6ef8bc24a7ea0800a6850220004d130a02406b09fd00601a290002d0b48d4241006823a11f004c2b05400056835010005a45e80700d34c011080d5727c2ec96b7503009326f4038069a70008744b2955277469bcf2ab4241009838a11f004c39054000569b50100026a6ce2f6e8ed00f00a69c022000ab4d28080013514f3ced2e493d33423f0098720a8000ac05a12000ac29a11f00f05f140001582b4241005813423f00e0ba140001583b424100580b423f00e03a140001586b4241005835423f00e07b290002b0d6848200b02a847e00c00d5300046012848200d0a87adcf0c88c977709fd0080efa50008c0a4080501a0113529393aef4cf2d37aa32f833a283a01a0390a80004c8e5010009a30bff8dc08fd00801ba50008c0a4090501e0b0d5f9c5cda9f5e57a02006e9c0220009326140480c322f403000e8e0220006d201404804322f403000e9e0220006d211404808322f403000e8d022000ed211404808321f403000e890220006d231404801b25f403000e9d0220006d231404801b24f403000e8f0220006d24140480eb10fa0100874f011080b6120a024012a11f00b0520a8000b49750100012a11f00b0420a8000b49d5010802926f40300564e011080b6130a0230a5847e004033140001e802a120005346e807003447011080ae383e9796d7e80680fe13fa0100cd520004a04bb7844f130a023005847e0040a3140001e81aa120003d26f403009aa7000840d7080501e829a11f00b03a140001e822a120003d23f483ebdea9d6a213001adc567501001d251404a027847e00c0ea520004a0cbb78c424100fa40e80700ac2a054000ba4e2808408709fd0080d5a7000840d7ed0f0599df72075d01d02d423f00606d280002d00777489d110a02d021423f0060ed280002d017f7130a02d00d423f00606d290002d0a75b4aa120005d30bbf09c08fd008035a3000840dfbca99e78eacfe8068076aaf38b9b53ca2bf40400ac1d054000fa6663c663a120002d24f4030026430110803efa7ea12000ed22f403002647011080be120a02d012fb433fca3b22f4030026420110803edf723eadce2d3e5e3f004cd8ecc273927a9a8e0080c9500004ba653cae3a814353df2c14046082bbb0d00f009838054000fa6e63c6e35d75ee94dbe90a80b5551fbce5ce423f0060f21400019806774cd69d2d140460edd4e3864766dfccd9423f0060f21400019816f7cba5f5d5ba0160f509fd008076510004608a945f130a02b006847e0040ab2800023065848200acea2e3bbb7082d00f006817054000a68d50108055521fbce5ce1994b322f483154fa65a7402407314000198464241001a26f40300da4b01108069251404a021423f00a0dd14000198624241001a21f403005a4d011080292714046045bbe8fed08f97eb0900682f054000a69d501080c374add08f757a0300da4b0110008482001c32a11f00d01d0a8000b09f5010804321f403003a43011000be4b2808c0c1a87343a11f00d0210a800070dddb5aa1200037b54bce2e9c90e4157a0200ba43011000ae4b2808c08d10fa0100dda4000800df4b2808c0f508fd0080ee520004801b261404e0da847e004067290002c08d120a029008fd0080ae530004809bbeed150a024cf72e28f403003a4f0110006e9a5010606a09fd00807e5000048003130a024c1da11f00d01f0a80007070848200d345e80700f4860220001c34a120c07410fa0100fda200080087765b2c1404e8f72e27f483564cc441d10900cd5100048043231404e82da11f00d04f0a800070e8848200bd734de8c72ea11f00d03f0a80007078ee976fe6777503d01bfb433feea32300a07f140001e070d53c5d2808d08bed4ce80700f49a022000acecb6592808d0ed5d4ce80700f49e022000ac8c5010a0b3847e00c0745000048095130a02748ed00f00981e0a8000d00ca12040b708fd0080a9a10008004d110a027465bb12fa010053450110009abdad160a02b47b9712fa010053470110009a251404682da11f00309d140001a079774c59b74b2808d026423f00607a290002c0aadc69e7fe4241805611fa0100534b011000568b5010a02ddbd1dce2b3857e00c0f452000480d5bded160a024c76179a5d3821a9bfa32700607a290002dd524ad50974ccc68cc73b8582009320f4030048140001602ddc492808b0d6847e0000dfa10008006b72272e14045863c7d43f8ad00f3a7ba75a8b4e0068705bd50500b0466a9e5ee7177e514700abbeddcc2d3e3bb53c424f000089022000acf15d79798b50106055b719a11f00c0f5280002c0da120a02ac1aa11f00c00d51000480b5271404689cd00f00e0c6280002c044eed473ff5c5a5ea52380c61c5ddf1aa11f00c00d5000048089a9cf100a0234b29bcc2d3e3b298fd31300c00d5100048089deb50b050156b88d08fd00000e40011000264b280870d8ea83b7dc39a59c19a11f00c04d50000480c9130a021cb2ef867e24b7d51b00c04d5100048056dcc90b05010e91d00f00e020290002406b0805010e72b710fa01001c0205400068d55dbd5010e000db84d00f00e01029000240bb0805016e94d00f00e07028000240fbec0f05b9cf13d7eb0ae03b847e0000874b0110005a79a79ffbe7d697fcae8e00be4be807007098140001a0b5848200d7ec06f30bbf2ef40300385c0a8000d0eabb7ea12030f5dbc0ecc209a9e5957a0200385c0a8000d06efb43414e1afae6174c21a11f004013140001a0fdee9471ce160a02d345e80753be028a3e00688e02200074e23e4828084c1da11f004043140001a0338482c0d4ac76a11f004083140001a04b6a794b9ddd7a5f1d013d5ee6423f00808629000240b76c4c19ec120a02fd24f40300580d0a8000d03d4241a087847e0000ab45011000ba482808f4cf31794b847e0000ab400110003a4b2808f46635cf2ffc7a6a4ed71300c06a500004802e130a02dd5fc6423f008055a6000800dd2614043a4ce80700b016140001a0fb8482400709fd0000d68a022000f441cdfd73ebafbf4a47408708fd0000d688022000f44679a65010e806a11f00c05a520004803e110a02ed5fa673c30709fd0000d692022000f48b501068b1fae02d774e7256847e00006b48011000fae74e59cef6ba69930203b488d00f006052140001a09f1e980db7f95ddd002d22f403009810054000e82da120d016423f008049520004803e130a02935f86423f0080095300043aa6547d0087646332d859373de236ba02d69ed00f38dcc593ab75024073140001a0ef4aee9c0dfb8482c01a13fa012bba55bd521f0034b8abea02a0639675011c96070905813526f4030e5fa90a80000d520004ba7618fcaa4e80c35e404241608dd4b9c5670afd80952ca27c45270034470110e8da69f05ff401ac64099537d7cd5b7f4a47c02a2eb3b9e18392ea895b387ccbb92c9fd70d00cd5100043ab66b1df199248240e0f01d993238472808ac0ea11fd0c442cadf958f8faed011000dde4aeb02a04bca79effb66923fd713b0928524140456433d6e78649667ce89d00f58e975ea2f750240b31400812e1e0acfd509b0624241a069c7e42da9f18a3dacf8ac573ea013009aa5000874f05038f39e24631d012b5e4ccfacb3c3d3f503ac9cd00f68cc25a9477c483700344b0110e89c72fe59ff92e41c3d014d2ca8bcb5ce6ebdaf8e80c327f4039a5c50e58fcad27b2fd71100cd520004baa98c5f92649f8e8015db980c760a0581c353370fef14a11fd0944bb277e695ba01a0790a80402795ddbb3e97d437e809686241090581c3518f1b1e9999bc3f423fa0292f28179df955dd00d03c0540a0bb662e7f51924feb0868845010385447973f14fa018df94096467fa01b0056870220d059e5bcf3aeca78bc98e4eb7a031a5955cfac730b8fd20f70607576f8aca45a2fd0c8e5277f9fabf79e5e92aa3300566bab05e8fa4dd8fce2e6d47a7e9219bd012b7665eaf80165cfae4fe90ab891ebcedcf0414976c777ffa009df4a19fffcfecfbb00b05a3c0108745ed9bde38294f2423d018dd89832d8554f1afaa619dc00a11fd0ec924af28b8a7f00ab4f0110e887dd3b7e37c9761d018db8539673965010b8aebae9f48d196457847e40438b2abf5596463b7504c0ea5300047aa1243597e51793fcb9de80463c2847dcf655ba01aee588cbdf9ae4be3a021a39bcedce2df2321d01b066f7cc00fd514f3ced2ea9cb7f969adbe80d686251e517cb9ed1bb740453bf146687cf4ac96bf504347217faf7b96aefcf958bde7f89ce0058abad17a06f37694241a0494241705d11fa014d12fa0130015e01067a472808344a2808534de80734bba422f40360221400817e120a024d120ac25412fa014d2f2aa11f0093a20008f4925010689c5010a68fd00f68f27026f40360b2f7c800fd2514049a5e5442419892a92ef4039abceb14fa0130f1ad18a0ef37714241a0494241e8ff7543e8073449e807400b780518e83da120d028a120f49ad00f68764945e807402b280002d341280834492808bd24f4039a5e54423f00da420110980a4241a0714241e81fa11fd0e4e14be80740bbee8901a6875010687a510905a12753796ef199497d9d9e8046ee32857e00b46e6b0698b69b3ca120d0a42b93dcbf2c8d3ead2be8ec7541e8073449e807400b790518983a65f78e0b52eb0bf4043462636a8482d059423fa0d92515a11f00ada400084ca73d3b5f1da120d08c923b0b05a18b847e40d3d783fadb423f00da49011098cef3a95010689a5010ba67fdb7df12a11fd0d4e16a778e292fd51100adbd0706985e4241a0e9452514848e4c55a11fd0e45da5d00f80d66fd500d37e132814049a241484f6effb423fa049423f003ac02bc0c0d4130a028d120a42ab09fd806697546a7dbce21f40fb29000224d7848294b37404344028082d25f4039adeefeb6f973d3b473a02a0fd140001f29d5090faf8080581a63c28eb6ff74add40ab08fd80260f4f423f00ba75cf0bc077080581a6179550105a3215857e4093fe2157effd59a11f00dda1000870fd9b44a120d024a120b4615f7f606a5d8aeffe4113847e007490578001ae472808344a28081355370fef945ab747f10f1a5952423f00ba490110e086080581e608056142847e40d3fbb9d00f80ae520004b8a1f3ad5010689a5010d69ed00f68d292d00f804edfe3027063ea83b7dc39cb339f120a024d2d2aa120acd15413fa014d12fa01d0710a800007ba89140a024d120ac2eaefdb9b87f7cf201f49b25e6fc08a09fd00e801af00031c805010689450105655dd3cbc5306393b8a7fd0c89212fa01d00f0a80000743280834a7e4ce19e74ca120344de80734bd5f0bfd00e80b0540808339ff0a058166d59c201484c609fd802609fd00e8d73d2d00074b280834bda88482d0d0549a5f78466a79bd9e804608fd00e81905408043bdc99c5d3821a5ec8e50106882501056be2f0bfd802609fd00e821af00031ca2b267e7854241a03142415811a11fd0ec9212fa01d04f0a800087432808344728088749e80734bd1f0bfd00e82b054080c3391f0b0581660905e17008fd802609fd00e8f73d2c00874b280834bda8848270905345e8073449e80740cf290002acf4265428083449280807de77857e4093847e004c01af0003ac905010689450106e92d00f68764909fd00980e0a80004d100a02cd110ac28da89b4edf98929d11fa014d6db82f17fa01301d1400019a383e0b0581660905e186acfff65b52f2333a021ab19463eb36dd003035f7ac0034452808347e5439bd2ced78b77e40e807344ae807c0b49daa750140c337a9fb4341ce4fe2f54558b92b923c4028c894efab423fa049423f00a6905780011a764d28c80bf50434e248a120d3ed9ad08f5d51fc83469694d00f80e9a40008b01a8482407384824cad6b857edc4e6f40231baad00f8029a50008b01ac76ba120d0ac9a13b2e136bfa323a68cd00f6892d00f80e9be470560b5080581c68f2e4241a665ff14fa014d12fa0130eda7685d00b0ca37b14241a0494241a661df14fa014d12fa0180578001565bd9b3f3c2242fd013d008a1203d27f4039a5d52423f0048140001d644591a090581c616945090be12fa018d6f98423f0048a20008b076848240738482f493d00f6892d00f00becb370001d690501068fc282314a42ffba3d00f6892d00f00ae7b6ad605006b7c932b14049a2414a40ffbe2fed08f0b936cd01bb062df4a06c795a5ed9fd515007c87578001d698501068d4fe50904d8ff0546d475d2bf443f10f1a5852a9f5f18a7f005c9f0220c004080581261754ee9c23f69d2514a47b847e40e31ba2d00f006e900220c0a4080581e60805e926a11fd024a11f00dc28df00049820a120d0f8d146284857f6bfd9e1d353f2063d018d10fa01c04d9f927501c0a46f828582408384827461df13fa014d12fa01c00179051860c2848240a38482b49cd00f68764909fd00e060280002b48050106872410905692ba11fd0f88627f4038083a20008d016fb4341bcb6084d100ad24e1bbef566a11fd018a11f001c34df00046811a120d0f8aa7a4459dae9e9da368c84d00f6892d00f000e89022040eb6e92858240838482b4615f13fa014d12fa01c021f30a3040cb08058146090599b03a77da1d857e40734b4ae8070087430110a085848240930b4a28c8a4d44da76f4c5dde15a11fd0d48626f40380c3a20008d0564241a039352764c36d5fa123d698d00f6892d00f000e9b6f0002b4985010687c55090559ab9e16fa014d12fa01c08a280002b4fe265a2808344828c89aec5b8bf74ba91f89effe4113847e00b0625e01066839a120d028a120abacce9d76c7947a7614ffa0912525f4038026280002748050106872410905592d423fa071af10fa014013140001ba422808344728c8ea10fa014d5acab179896e00a009be0108d0214241a0f1552514a4a99e14fa014d12fa0140a31400013a77932d14041a2414a4897de9c4854d1997a524ebf506acd86529e3e3caee5d9fd3150034c52bc0001d2314041a25146485ea49271d9171d91ec53f68c2de942c2afe01d0340540800e120a024d2e28a1202bb27cd42f44e80734e1ead4f2b8b27b74beae00a0690a80005d2514049a2314e4f095728c4e8015fb464a7948d9b3e34c5d01c06a500004e8ea3df7c7475764ddf2d6947c556f40239e53e7164ed30d876879f92f7402acc8f9d9971f2fbb775ca02b0058b5fb475d00d06d4241a05142410e671f9a1b9e9de4143d01877427f617495e5c768f3ea4330058fdcb0e003db8f95e7c76525fad27a08905952f66efbafb968bcef474edc176d9fcf056a9393bc97fd71b7093775f7f9f719632c87bcbeed1277508006b770902a01f37e0738b6726d5eb8bd0cc09e9c25cf59513cb4517edd31987b20f2d1c9f943b2639566fc0773794ab52ebbf64b0fcf765f7d95fd21f004ce6780b403f6ebc8f1b1e99a3f37f92dc476f40235e5d9646cfd50d0000749d0220408fd4076fb97396673e959adbe80d6864553da22ced3c4b3f0000d0650a80003d2314041a7545cae0fe65f7f63fd715000074d5401700f44bd9b3f3c2a4fc869e80461c99f1f8ecbae9119eaa0500a0b31400017aa82ced784d4a3d534f40130b2a77ce11fbceaa9b3679aa1600804e520004e8ab6f962724f9b48e8006d49c900db77d858e0000a08b7c0310a0c7848240e3ab4a280800009da30008d0734241a05142410000e81caf0003f49c50106894501000003a470110600a94a51daf49eabbf50434b1a084820000d02d0a8000d3e2b2f2e408058166d49c90236ef7721d01004017f80620c014110a02cd2ea9a43e52280800006da700083065848240a384820000d07a5e010698324241a0514241000068ff7da02e00984e756ee15d49799c9e80464e5417e698cc97d16859670000d0369e000498564241a0393527e49be5153a02008036f20420c014ab0fde72e7ec9bf9b324b7d51bb0f22525140400803652000498724241a05142410000681daf00034c39a120d028a1200000b48e022000294b3b5e93d477eb09686241e5ced9b0efcc3a1ccee80c0000da40011080fd84824093360b050100a02d7c031080ef120a02cd2e29a1200000b481022000d72114041a251404008089f30a3000d72114041a7564ea7897501000002649011080ef2114041a7517a12000004c92022000374c280834492808000013e31b8000dc28a120d0ec924af288b234daae2b0000584b0a8000dc24a120d028a1200000ac39af00037093848240a384820000b0e61400013820a120d028a1200000ac290540000e8e501068d2e65c525fae1b0000580bbe0108c041130a02cd2ea908050100600d2800027048848240a384820000b0eabc020cc021297b765e98529faf27a0114241000058750a80001cb2b27be76b8582406384820000b0aa140001383c4241a049424100005835be0108c061130a02cd2ea9080501006015280002b0224241a05142410000689c5780015811a120d028a1200000344e011080152bbb77be3625efd213d008a1200000344a011080667c334f895010688a501000001ae31b80003446280834bba4221404008006280002d028a120d028a1200000ac9857800168945010689450100000564c011080c609058146090501006045140001581d4241a04942410000386cbe0108c0aa110a02cd2ea908050100e030280002b0aa848240a38482000070c8bc020cc0aa120a028d120a0200c02153000460d50905814609050100e090280002b036848240938482000070d07c031080352314049a5d52110a0200c041500004604dd5b9e18392ec8e50106882501000000ec82bc000aca9b234fa885010688c501000000e48011080352714041a25140400809ba40008c064080581266dcea5f96ddd0000c00df10d40002646280834bba422140400801ba00008c044090581465d9e718e2b178cfe5a570000f01d5e010660a2848240a36e9e41ce150a0200c0b529000230714241a05142410000b80e054000da412808344928080000dfe51b8000b48650106876494528080000510004a065848240a384820000e0156000daa52c8d3e929ae7e909688450100000140001689fb267f43aa120d098bb64c3be33848200004c2f054000da492808346956280800c0f4f20d40005a4b280834bba422140400602a290002d06a4241a05142410000a6905780016835a120d028a12000005348011080d6130a028d120a02003065140001e886ab6efee4080581a6080501009822be010840670805816697544a39adecdeb143570000f49b0220009d2214041af5ad8c73bc501000807ef30a30009d2214041a759450100080fe530004a073848240a384820000f49c022000ddb43f14e4533a021a319b4bcb6fe90600807ef20d40003aab6e1ede29837c2a4241a0912525140400a09f140001e834a120d028a12000003de41560003a4d2808344a280800400f290002d0794241a051424100007a460110807e100a024d120a0200d023be0108406f080581669794501000807e500004a057848240a384820000f480578001e815a120d028a12000003da0000840ef0805814609050100e838054000fa49280834492808004087f9062000bd2514049a5d5242410000ba490110805e130a028d120a0200d0415e0106a0d7848240a3f687829c70caad7505004077280002d07b4241a05177c9ccba33858200007487022000d341280834492808004087f80620005343280834bba48482000074830220005345280834ea5bc9e0b8b2b4fdb3ba0200a0bdbc020cc054110a028d3a2a197f5028080040bb2900023075848240a384820000b49c022000d34928083449280800408bf9062000534b280834bba484820000b493022000534d2808344a280800400b79051880a95696461f49ca73f5043442280800400b29000230f5cad28ed70b0581c608050100681905400048848240b366f3cdfa32dd0000d00ebe010800d7100a02cd2e29a1200000eda0000800d72214041a25140400a005bc020c00d72214041a25140400a005140001e07acad28ed7a79677ea0968845010008009530004801bb2f7664f895010688a5010008009f20d4000b8114241a0d925251404006032140001e02608058146090501009800af0003c04d100a028d120a020030010a800070004241a05142410000d6980220001c0ca120d024a12000006bc8370001e02009058166979450100080b5a100080087402808344a280800c01af00a30001c02a120d0a8a392f1b94241000056970220001c22a120d0a81f120a0200b0ba140001e07008058126090501005845be0108008749280834bba484820000ac0e05400058813abff8c0d4ba14a120d004a1200000abc02bc000b00265f78eff2d14041a231404006015280002c00a0905814609050100689802200034412808344928080040837c0310001a2214049a5d52424100009aa10008000daa9b87f7cf201f49b25e6fc08a090501006880578001a041e582d14793f23c3d018d100a0200d000054000689850106894501000801552000480d52014049a349b4bf352dd000070787c0310005689501068764909050100383c0a8000b08a848240a3848200001c06af0003c02a2a178c3e9a529fab27a011424100000e83022000acb2b27be71b84824063848200001c22054000580b4241a049424100000e816f0002c01a110a02cd2e29a12000000747011000d690501068945010008083e015600058434241a0514725e3b3eba687df42570000dc3805400058634241a05177cd86f5db85820000dc380540009804a120d0a439a120000037ce3700016042848240b34b4a280800c00d5300048009120a028d120a02007003bc020c00132414041a25140400e006280002c0840905814609050100b81e0540006883bd377b4a6afe4c474023848200005c8b6f0002404b0805816697546a3db5ecd939d21500c0b45300048016110a028d120a020010af000340ab080581460905010088022000b48e5010689450100060ea290002401b09058126cde5d2b24d370000d3ca370001a0a5ae0905f9b324b7d31bb0f2252514040098560a8000d0624241a05142410080a9e41560006831a120d028a12000c0545200048096130a028d120a02004c1d054000e802a120d024a12000c054f10d4000e808a120d0ec92120a02004c0b054000e810a120d028a12000c054f00a3000748850106894501000602a28000240c708058146090501007a4f011000ba4828083449280800d06bbe0108001d2514049a5d5242410080be520004800ebb2614e4c2241bf406acd8b752c63f5f76effa9cae0000fac42bc000d061d784823c4f4f40238e4a1d9c23140400e81b054000e838a120d028a1200040ef280002401f08058126090501007ac5370001a027848240b34b4a280800d0170a8000d0234241a051424100805ef00a3000f448b960f4d1d43c574f402384820000bda00008003d53f68cde2814041a23140400e83c054000e823a120d024a1200040a7f9062000f494501068764909050100ba4a0110007a4c2808344a280800d0495e0106801e130a028d120a02007492022000f45cd9337a6352dea327a01177cdfaf57f5cb76d738e06003ac3c10500a6c1b1f597937c444740034a1e928f7fee513a0200e80a05400098026534ba3a331b4e89222034a3e6449d000074850220004c8972defbbe99996f3d38b5bc536fc08acde80200a02b140001608a94f3cebbaaecd9f1f8a43e22c997f5081ca69a8feb0400a02b140001600a95a59d6765e355774bcdcb927c458fc021f9bf39f2aa77e80600a033e77f5d0000d3ad6e3a7d638ef8f6c9a93939a9bf90e48e7a056ed46732c8a9e5fcd1dfe90a00a02b14000180eba80f79e42d73d5de1fccba1c955a6eae473a60b97c2b83f15e1db1da27e7f19565f7aecfe9080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e8a3a20b00a0ddeaa647dc2647eebb5df6955b26e39b273936a51c9364e67bffe1fa8d6bfe6f9726f5eb2983af6566c3d7ca79effba69e040080e9a40008001356379dbe311b2ebf674abd67921f491dfc70527f38c99d93dc36c9fa06fe672e4df2cfa9f94252fe3965fc8524ff9c41f942be72cb2f944fbf7daf910000807e5200048035544f7ad431d9b7f7fe29f5a752eb4fa4949f4872d7dcd0d37c6be7ea249f4df21729f9cbd47c3c577fe533e5a28bf619310000e83e0540005845f5e4938fce151b1f905237a566534a7e3a932df61daccb927c22a97f9a529672dc3d3f55b66d1b1b510000e89e1b2c00d6931e754cf65e799bcce4c8d4c1c6ebfe97594e1defff8e501d5f9a8d478e33fec6b7cb79e75df5dd7fe4218fbc65aeac1b52aebe799264a65e91ba615dc67bd767a65e91dd677fb92455f777e4e6f5218fbc659264ef15eb331e1c75a3ffe04cbd22eb365e7950ffd2abc747a6eedd78a3fffdbec17f968b46df9afabe1f0e37e4dbeb6f7e93ffd0157b6f96c1f888effebfd70f2ecb60fd0d3fb573bdb5da8b3eda3c3c3647ac1f7ccf7f71e5158394c1b1d7f9cf8e38e21b07fc17de6cefe56534badaca6745f3f2a42d3f98e5c129a9654b4aee9f645d0ffeacaf25654f4afd6096f3a172c1e852233da9f9f5a86332a8337a82ebb8fcdbb55cf4fe4b7a35d7370d8fcacdd7dff42710ae7fbd1facdf9bf583833b437ee88c4bdc934cc5797a26df5e7fcc41dd835cdf86ba9cb2f1c6bfa13bf3ad7de5dc732fd3cb6dde474edf989b5f7de401ffc16bd72f6ecaf5ef797fe66e974ef207d29a943ce491b730d21d342ecb6bfd8dee524f5cd8943af8b9d4fa73a9b97b4aee98e4e855fedffd6652b767fd86e7950f9df10d23df828d71ee94db25eb9f91d40727df9d03eb27dcac7f4fcaff4ead7f58f68cfea4f76370c229b7ceba75f3a9653ea5fe786a7e2cc9c655fc9fbc22b5be3beb2e7f46db8b827576eb7d53066f4df2134936acd1ffecde24e766264f2ee78dbe6297e080f374f3d61f4e290b29654b929f4dbf9fb2bf2a351724d999751bce1630b256d7eae17d92bc3dc94feb0d6ec4e5a9f5bd192fbfa85c78ced73a37c7e78727a6e6f793fcc81afecf7e3dc92792b223475c312a1ffce0b74da32eef93a7dd31597e5b4a7e2635b7ccda3c71bf37c92753ea4792f29eb27bf48f46a20de7b2e1b119943f48ea42d6ee87d84b92fc63527ebd2cedf8d335d82f5f7acd9993ee5a4ef297493e9232785fd9bdfd33abf93f56eadc7092bf7a5d9cabbff2df7d6368d217cac56726f5b793dcacbdad2cbf539676bca0a745839fcaa03c2b298b59bbe2d6b5ba366f2cbb47cf686dff6c1a1e950df942f607214cc2c7b2347a802704b8c1f979d2494764f9e6a724e597933c30d3f9698d6f27797fc6e53db9ff3df6784d78b5e6da961fccf2cc5f27b985dee0207c324ba39fefd2b5ab6e3ef5c73218ff7956f7c7cf03f9424a7952d9bde30253a8abf735c34f25b9cf646fe6cb5b72597d5ef9f8e80a2332d1b9b094647642fff3df4cf6ddb52c9df39fabf2b7cd2f3e30b55e906460a4fb356d937246aebefa5757eb89fe494f98e3b3eefbee6a9c2734bb86c3993a3b7c4f525f975617ff725906f5ddbdebfff92d77a8738befce60f0a9a43c3a9328feeddf669e581ffad0f68eff117598c915ff92e47ed93cbc9f1d83eb2c9b134ebd5b9d5d7865968ffab7a49c99e44199deefeade2cc92333a8e7e7e2cffd5b9d5bdc564f1aded62c69d8be995f8ee21f07ef67b37978af4eb5b88c9f92c916ff92e48753eb529d5d789229d4c5b3f5a9f7ce648b7f493293d4a7e5e85c50370d8f322a139a0bb3c39fcce48a7f49724ceacc29abf8173e368a7f7d5492faa8ac5fffb1fd6f68366ff2936650dd244ccaa5e5f529794cdbf7ef248f2fe78ffeae5f0794c5cda9337fde92cdfbc82caf6ff13a1cfce8e49b901fb761b07fed2e3ca0ce0d3f9499f1dfa694e765b2c5e936fafea4be24cbf9b73ab7f0ae3a77eabd744963e7253f9872a8b711b7ea587befd19a9694f2963a373cd524ea9af13d5bd498e3b32167d46ddb146926b28aebe4ef1fca60f5e6638de272bfafdff748d69d534f3ae988e66f6b27ffc7b9799ac44decdce2b393fab40eb4f4b56569b4b3577d3f3b7c7a6a5d4a72fbd634eaeaf5ed7d02b08e374ebe0d75af5d638af7cba4d4b985ff51e7861f4d2d7f9ae4c199dea7fd0ed61149795c32feab3a373cb7ce2e7a8a76c51371e09bc91c9a99dab57deaca16b56590e49dd77c7793ae1897b615db1e9a8f7f769b8199c835b305df26aeabf7ddc1eae9bf29707c966ffeb6d5b8b84d78a3ae471bdb35de8a66174e48eaef74a0a917e76bb7ead577ffeafce2f352f286d6150fd68f15336e4a29beff37adfbe5890b5b3237fc4c523e984411eb30564f9287a6d48fd6b9e1529ddbfa73bae4707b726c1fa2ef965bd69e23939cb35aaf61b10a06e3f615456a79519d5d181a9cb59e0bb5dfdf232e0a805372f87b5c9d1b3eb9d1a531f9c559d61bd835bc063d78cb9d53ca9959bb24a4c3f51fa933c3f2e9b7f7e6c9ab7ae2c296d44e145ec15eb9f9d49faf73c38f665c76255e016fc86c32f8449d1f7ea09e34bc87ee80d5dec8067edc5bb93ba6acdb5587c30dba82c3bd834f29efa8f35befa92b68705629004e8f37d6d9e17f6fea5f36f98953eb3a63ba465d7ddcf0c8ec9bd995f67fb36a5f5216cb9eb3febd377d3f7feabd332eef8dd706a1dd6b75f3f04e7576f89e0cc617c7137fabd4c93939cbf94c9d5b78633de951c7e81058b533b63347337bd6fd736979958e60058e4a1d9c53373dfc16ba82468c33a313a6c6fa946caf73a7ddb1897f591bbe0168f2ae95a3cb1f66f2c9580773d07a5e59daf1a7bd3937ce0f6f953a3e3bed4e5a86e9bebf3b6e78649d5d786506f9876bc291dc38afae7549f9b52c5ffdb77576f1d1557fc32a6c6c0a800d76e633eafcc22fea0756e0ae3962fd59753874efcbca790270da7c5fcaf207ea431fbae27a420b9e006cddf73efa796c995ff8f5a43eaa034d7d7ff68c5edf9b7e1f0e6752f3be243f6c16424bd7e9dce22fe4e8fcc535a9be5ef35a5b7748a9efcdecf0ffabf3c39fd51dd0a08157809bbd5894b7d4134ffd191dc10aee7be7f3cdfa121dc18a29004ee3fef153b9ea88158782b461e22800aefacdedf041a9e5951dd8c8fe3e331b1e5792fe7ce8fcd2faca24279a85d0c2bdf184536e5de716de95d48b92dc5d8f4c74ffff99d45c5ce787afad9b4edfa843a0894dce13800ddb98f178673d69785b5dc1e1af4ba12034318f1400a7f4c0fce83a3b7cfa4afe0d6df806e0d840ae62f73e78cb9d53b23ded0ffdf8560639a59cf7be6ff6a6ef4f5cd892945f370ba185eb7376784a66d6fd4d521e17af9fb6c54c6a9e950d977fb26e1e0a5e81959fb1ed6dcdbb53c639bbdee789420c39ec3b78a12034308b1400a777ec5f53e7171f78b8ffdf5b9002ec09c0553bf76d3a7d63f6cdec4acd6ddaded494f28472dee8f3bde9fb13b7fe44c6e53d0a0bd0be7db1ce2dbc31255d08449a563f9e413e59e7179f57b76d73c085c3def0bc02bc4aa7d6fbe7d65f170ac24a1c950cce160ac20af621e7a3e9b52eb5eeac9bb71ed627c6bc02dc67475cfed67421f4237955d9bd63476ff6e3f9e1ad321e9c9de4e62621b4686d6e3ef5c7b2e1f24f24e5d7a238df761b53eb2b73f1e776d7070d7f4077c06198f104e0ea29cf140ac2ca0e25b99b501056400170badd2a83c1d987130ad2828953aaf15b856bcadce23353737a079aba9463f3a2def4fbb66d83d4fc7192ff6616429bf6c4e11333187f3ac9bdf546a76ccefafc659d5b384957c0a16e7c0a80abdbbfe52d7576eb7d75449bc6a4634fbd0a05e1f0290072ef5cb5f13df5101f6a3071fa79a3fba0a4fe6e072e7a5fccd5eb1e5546a3fe3c057af1e75e99c48d2ab4659bd9b4695d9d1dfe7e92b72539528f747110739ba47cb0ce2f3e4f67c0a1ac1daf00afb28d29835d424158d93a2d2faa73c3051dc12152c72149b6667ee15926ce345f43360fef94e4acb43ff4e38a0c065bca45677eb5377d7fe2c29624cf360ba1256bf284536e9d0db75d4ac9afea8dce9b49adafac730b7f5487c30dba030ee694ef09c03570a72ce7acba69d33a5dc1612a49de291484439c35dea2e49a1b9ef2aaba7971fea08f067aac4763bfe9f48d1974e5c3f6e5c965f7f63fef4ddf0bfd8076adc9cdc31fcfccba3f4bf240bdd1ab13efe373693e52e74eb99dbe80036d840a806be44139e2b642415809a1201ce2fe2e4781ef9ac9a09e51e7863f7430ffb002609facfff65b92b4ff5b24b5bcb62ced78776ff6df873cf296423fa0456b726ef1a119e4e2243fa4377ae97ec9ba8f7b5a0268d1cdf8b3eaecf0741dc10ae69050100ec55817702db74a7250a1200a80fdb9e17d664aed421ad947b2f73f9fdf9b7edfb66d90bd7bdf17a11fd08e3539bbf8e8a49e9de428bdd16b3f9c3af8589d5b385e57c08d1ef33d01b8964ade5ae786f7d1111cfe2126f3b924bfa9233888fd460190ebfbc95c75c4db0e7832d04f3db856cc2f3eb013a11fc9bf6626a7958b2edad79bcefff8e77f27423fa02d7be1afa4d477a7fddf40a519c72665697ff015f0bd9ba25780d7d8c6d4080561654a5e2c148403efef0a80dce006f2e83a377cf24dfd130a805d5ffb9b87774aaddb3b70c37b65ea786b396ff495def4fd890b5b52eb73cc4268c17a9c5f7c5e6a7dabebdad4b979920fd6b9e16cefffd271f1c16f0ef13ea0d80fd7bccf7367a120ac78160905e1c0b34401901bf3c63abff0801bfb2f1d0cba7cc37bdcf0c80c724eba10fa51ea93ca9e5d9fea4ddf0bfd80f6acc7b9c557a4d657ea89a975b324e7d6b9857e3f8d2dd195433e7b8d158d27e341597f3bd7a4891c087ab34f0a05e100735d01901bb53eb5eca80f1afec00d1e27f54f972f0de5cd497eba0327d03794dd3bdfd39bfd56e807b4673dce2ebe38a9bfa127a6dec6a4bcbfce0e4fd115c0e48fbef5d78582b0b2038e50106e727e280072536e9f7519d5e170c3f5ff0b05c0aeaef9f985677422f4a3e4a339b63eaf37fd2ef403dab31ee7167f2da5be4c4f708d0d29d95e6717e67405d08233b050105678d0110ac28dee2f0a801cc871f9667dddf5ff4305c02e5e0b360fef9f5aba11fa51f76d2da3d1d5bde97ca11fd08e7d707ee1b1497dbd9ee07ad6a7949d7576f893ba82a9e7bb919326148495130ac20d5bd6051cf886a93cb5ce2d3efedaff910260d7c670f3f04e19645792f52d6fea95190c16cad239ffd99bbe9f1d9e22f4035ab016e717b7a696774cf935ecca24ff91e40b49fe21359fbfe6fffe8524974ef914393a251faa73a7ddd16a0126aae4ce19e74ca120ac68160905e17b0ec39e00e4a027cb9beb89a7fecc77fe5f2e465d1aba4da76f4cb97c6792dbb5ff52559f52cedffe67bde9fbcda7fe58caf85d11fa01935d8b279efa33198fdf9b641abe89f3a5249f49f2d749fe31c93fa6e45f7355be5c2e1a7deb26fbe9b8e19139263f90e5dc3e33e5fb33ae7748a9f74c29f74dcdbdd2fe1f9156eafb93e50fd7cdc3fb970b46975a39c0046fd44fc886dbfc4e123f2273b8be130af273e5a2f75fa23bf00a3087606396c7a37ac2237eae5c78e67f280076c9fa6fbf25253fd3811de90d65f7e89dbd39b73de491b7ccdebde72639c6248409aec5d9d3be3fe3e5f72739b2877fde38c95fa5960b937c2465efa756f20475f9f8e88a7ca76878fd7e3ce9a423323eeadea9f5be497e362927a50b3f2c1dba7b6590b3eb707852af3e450174f16efdd9756ef1b36569c7bbf505877708caddb261fd7beab66d0f2fdbb629fee05cc3215c8272e7cc2cbf34c9af280076e6c677f8f4ce847e7cf516cfed4dbf6fdb36c8c59ffbe3243f6216c204d7e271c32353963f90e4fb7b7578abd9935246b97ae643e5a233bfba26dbf479e75d95e493d7fc9fb7d46ddb06f9d8e78f4ba90f4bc9c35273b71ef5f1837269f9c3248fb38a80095fc9de5ae7869f2d4ba34feb0b0ed34373f1e77f33c9365d31f5ce49f248ddc0c1df008c8f497c03b01bc785d9c5fba5a41ba11f836c299f7efbdede74fec73efb8a240f360b61827b60527274de99e4be3df9933e999427e4eabddf57f68cfe4759daf1eeb52afedde07960dbb671d9b3e3636569f4dcb27b74f764fc6329f5b7927cb92733e8b17576e1495612d377d81702d23247a66657ddf488dbe80a56704dfb4da12094a5d1ce244fe9cf598d5576496a796de21b80eddfe2e74ebb63b27c76920d2d6fea95a9e3ade5bc5d5fe94ddfcf0e4f49c973cd4298b0b9c55f4feaa91dff2bae4cea7b5366fea0ecdefee7ed3e54eefadb24bf5987c3dfce37b3909aa725f9f96e9f94cb1beafca99f28bbb77fa6b37fc3b8d4c97f85b6bc34ebf6bd3357971bff06e76070cb9bf823d6a5cc1cddff3bb3f1311997772599ecdf5aabef16b76e6ee4ce3962df5975d3a613cb4517edd3210d1bd492fe4ffb92e41d757eebdf94ddbb3e67d0a7783b591abdb56e3afd9d5977c50f6530bed9c15f1bcac60cdaf0399dfa92d4dc7fc26d7871cae0132dac447c33b5c1a4e78d57fd7d39f7dccb1205c056ab9b4edf987af9ae948e847e2cedfa546ffa5ee807b4632dee0ffd787987ff846f25f50fb2aebcb67c7867a77ea5bde6bb79672439a3ce6ebd6f32f8b5943ca2a367878dc978473df9e4fb7ee700e4c6f6b056e4e5e5c3677fd1ce74133d9494cc0d479974f12ff104607b27c909d970db57247e64e6b01d2d1484242917bdebca247fd3c9ad7076f8e4c9df690f3e5376efb8609ae68c5780db6cc3b7dedc8dd08ffafab27b67bf423f0663a11f30e9b578d2a38ec9787c66daff04f40db92aa5fc6e96f7dda52ced7c4ef9f0a8d3af68943dbb3e55f68c1e9b41ee9552cf4c3a983e5773b75cb5e16d56d68a668282d281cc2dfc6692ad3a8203784e9d5b384d37b0a26bdafe5010f7f3c041b361b4754f9f5bfcb5a43cbe034dfd48aefe6abf423ff6ee15fa016db0bcf72d49fe5b075bfebf3233b867d9bde379e5c273bed6a72129e78ffeaeecdef9c88cc7f74dc947bbb7c99747d4b9e1132daec3edbf2a79f2a6cf6e0f4dca6fb6a7456305db76efa8efa8f3a7feb47e6005be130a021ddc02e31a35010a806d3c40ce2ede2fa9afee4053ff353339ad57df30b9f8732f8fd00f68c13e383c3da98fea58b3ff29c9096569f4d072def67feaf599ed825d7f91dda35f482d8f49d2b56fbfbea1ce6dfd51abec7006de138037ba679d70eadd92fa1e676b0ec191198fcf160ac20a771fa120c041734869db163e77da1d536a87423f46fd09fd985b7c7892e7998530e1b538bfe50e29797d879a3c4ef2f65c9d9f2c4ba38f4ccb3895a4963d3bfe38ebd7df3dc9db3b75d39dc1dbab6fbc1ec6a07ba2ec06f7ac4dc3a332333e3bc92df40687b891ee0f05190e677406877f39ce3beafcd67bea0ae04014005b75803c7d63eaf2aea423a11f7b7a14fa31b7f54793faeeb82184c91bcfbca93337d2355f4cea03cad2e849e5a2d1b7a6f2cee343677ca32c8d9e94e4b4249776a4d90fc8fce22f596c873adf075e01fe9e2d20251bf2ce246ebe39dc497442be595ea1235881fda1209b87c7ea0aba750965ad2900b689d08fc9fc350f79e42d93c10723f40326bf1ee7161f9e922d9d686cc9b919e4a7cbd2ce8b8d5c529646db93fc54924f7663b2d557d5070f6f6fe40e852700bfc7fcf0c549bc7ec74af7a3e7d4b9e1a93a82c39f43b95b0679af5010e0a6d8205a73d3bbf034a11f13e8f76ddb06b97aef7b23f40326bf1e4f7ad43149fdfd0e34753929cfc9eed1c3cbeed1d78ddc7f294ba37fceccb77e21c91f75a0b9b7ccdefa46a3762803ec1b80d73bbbfd8fd4bca4c5c77c6f357468752579a750105648280870d327035dd08203e4ece2fd92f29a0e34b587a11f9fffed943cc42ce4a617697513b516f65dfdf2243fd8f2565e96928795a51daf295e5db8e1bbd8f3cebbaa2c8d7e29a94f4db2b7dd8d2d8b757ee81a70f07ba15780bfd315279c7ab7a4fc71bbcfd2f54a23d52947a68e77090559c99457f44eea6fd6f9c5adfa81f61f18fda838090a8093dea2e7b7dc21a58e22f463edfb7e6ef1e1497dbe59082d588f9b4ffdb194fc4abb1b992f669cfb95dda30f19b18338d72ded7c4b521f96e4f25637749c37d74da76f34620735aa0eeb49eac9271f9dc1f89c24c7b67a66afcb5f1badceb94b36ec3b5328082bd9a853eb3b858200374401709207c84da76fcc78e60349eed081d6fe92d00f60d5cc8c5f99645d8b5bf87729330f28178cdc501fca5dc8d2cef352f2a024edfdf1a8e4ce39e25b4f355a0773f1f404604d4aaedaf84729b947cb4b0017970f8fbe6cd276d2e65c525fae1b5801a120c00d52009ca40d97bfa913a11f25af2b4b3bdfd79bc3fba687df42e807b4684dce2f3c203527b7f88efff3a9330f2a4b67fd9bd13a8c4bc8eed12793f12f24697131a23c7fff3728b9e96ef20460e6165e985a871d68e9db4dd84eafb5e70a0561856717a120b4db58b0d824d81026b527cf2d3c2dc9133ad0d48fe4aaaf3caf37fdbe6ddb20ebd7ff71847e404bcea729a9e5775bdcc4cf649007943d67fdbbd15ac1bdecd2aebf4d06b369eb938035b7c9f2de6719a903f5d3743f01586717e692b2adfd0b2e7f91e3eef93e13b6dbdb668482b072424180eb50009cc401726ee178a11f13f2f1cffe96d00f6891b9e1d6243fdfd2d6fd6396d7cd4bfa6de86e7669fb675306b3492e6de9d5f9593ebe7fa0419cde2700ebecd6bba694ed49dafe6db62bb33c7e42d9b64d604bf70905a189dd4b2808ce147c9702e05a6fc1f35bee90949d11fa3181be5f78586af90db3105ae5852d6dd7bf27992b179ef91f86a8c1b3deeeed9fc9a03e3cc9552d6cded139629f6bc44d8fe0541ed6ebc9271f9d323827c92ddadfd8fab472c1aebf30577b4328082bdeb88582c08d5e33a72e0f4001702de7d7a6d337a6cebc3f5d08fd28f529bd0bfda8e53d11fa01ed59979b17e793fc640b9bf6ad0cc62795a5d13f1ba555b8bc9cbff3a2d4f28b49da574caa794a9d3bed8e46e9460fca53f754d977433f920edc3c97b7953d3bffa789da3b9b73697e5b37b002424180240a806b6bc3e56f4af2b31d38eebebeecdef9cede1cde373dfc1629830fa4bda11f7b2d0ea6f30a549fdbcafbfd529e50cedff5570668f5943d3bce4cf2aa16366d63b2ef9946e8c6066e0a9f00ec4ee8c7c73373d9d34dd2156b6b91fb79756eb860780e7809f743ff8d9f6e8482d0b6438557802771fba50bd668cf9d1ffe6aba10fa51f2d17ced56fd0afdd8b0febda9b95b4bfbfbdc24ffc70a61faf6c453ef9de4412d6cd94bcbee1d3b8cd01a38fe9e2f4ccd875ab831ffd2feb4786ee0ac3e554f007626f423f972f66558ce3bef2a9374c57e33c9722b4f8cc93bebe6e18f1b2256e0a1b9f8b32fd60d30bd1400d7e20039b7707c6a5edb81a6fe6b06d9523efdf6fe3c9176f1e75e96e47fb4b4757f97e53c36edfdb519567163accf6fe1edd5ee2ced7c99c159a3eedeb66d9c411e9be4ffb6ac694767c3fa5f364237603c3dbfd67728f4636f4a5d2c1f19fd3f13b4893ba3c1526a79694b5b77540639b79e70caad0d142bb8fabe4428084cf1654e17acf201727fe8c728423f26d0f70b0f4bf2829636efb2cc644bb96074a955c2d4ed8b276df9c1a4b6ed55a6ffcc4c4e2f6dfc2e5d9f6f43768fbe9e417d4cdaf743c8afd54d9bd619a1eb0fd8782ad647dd343c2a657076ba10fa51ca53cbee9dde2468d29e1dbf9d52462d6ddd5d32b34e28082bda3552eb3beb49c37be80a9c29a68f02e0aadee49e74c435a11fdfdffe05d8b3d08f1387774f2def4e3b433f6a4af9c572dee8f35609536979f08424eb5ab526534f2f1f1e7dd9e04ce0f273fece8b92d2b6ef01fe608eb8cd438ccef557caa0f74facd7a4647dfda324f7ea4073df5a76eff84313b3e13d29a9b9aa3e3ec9675bdac4d95c5a7ecb48ddf00d4d0b1af18f69ff8f89476739bbea498f3ac69c81e9a200b89ac6477724f4a3bca157a11f279f7c74c63927494b93aeea4bcbee1dbb2c10a6b27e301cce24e5f12d6bd5ff2c4b3bcf333a133473d94b53d3ae1f456a79a281b9fe71610a7ead9f1bbe20a52c76a0a51fcfb1798649b94a53fda2d1b7929c9ce46b2dbd9a3ebfce2f2e1aa9efddb827df847a41525ed981cefad18caf160ac22497ab270027c0825fadf93cbbf8d4d4fa4bed3fe1e4a339b6f62bf4e3ca23ce48f2632dedef7373fcbdfc6acbf4ba240f4972a716adc9afe6eaf52f3030131e86f3cebb2a75f084b4eb55e013eb83b7dcd9e85c7ba0fafd04609d1bce267969079afaa5d49985321a5d6d52aee2745f1afd739247a4ada120b5fe519d3bf55e46aa858ebfc78bda197275fd4d2f270b0581e9a200b82a07c885e353eaeb3ad0d47f4bddb7b55707c88b3fffd2b435f4a3e4efb39cc7966ddb847e30c5775469db0f234f2f179df95503d382a971c1f64f24f99fad3a23ed5df75823732de3fe3e01584f3ced2e49ce4cfb433fae4ac9c3cb9eb3fedd845c837d6969b427a96d2d901c958c3f2814a485f366dbb67136ac7f4cf6bf0edcf6d60a058129a200d8f401b24ba11f83c1d6b274ce7ff6a7ef171e96d417b6b479972563a11f4cf9fe38bc5592f91635e94fcaeed11946a64566f2a22497b4e7bea83ec2a05cbb3ffaf9ba4edd343c2ae3e50f26697f21a5d65f2dbb479f3419d7d0d2ce5726d9ded2d6090569eb76f9a133be918c1f9ae49b6d6faa50102675c8d2076b4f01b0c9335997423f529e5acedffe67bde9fb2e847eecdef539ab84a936ae5bd29e1f476a06f90d83d2b22bd379a3afa4a64d9f49f8b13a3bfc4923f39d5363eddd13ec9d0afd28f5cd65cfceff6922ae71b7273597e51793fc794b9b389b4b3bf1eafa1a2ce8daaafb80b2b4eb6f93f2b8742314e4ecba7978ac49043d3fcae982266f6e3b12fa51f2c6b2b4e31dbdb9d69f7cf2d159ced911fa012ddf7b5af561fd5de5fcd1c70d4a0bdd226f4acd175bb4879f6650aeb1dcc35febe7169edf91d08f8b734c79964938a1cbd7c747576430b335256dfd64c40b8482b474ee2ced787f474241ee9e99bc472808f49b05ded4edc1dcc2533a11fa917c2cc7e4b9bde9f7ef847e94b4f5b1f50f1e30f4a3b4f2a9456876ad9e34bc6d9207b6a439cb591ebcd0a8b4f4666934ba3a83f2f2f634a86c69c7221a4cfe5ad1b32700f7877e942e04737d29756628f463c25bc1f967fd4b521e91645f1b9b2714a4c58ebfc78b927cb8fd9ba25010d6d2d82bc09338cae98206f6ca1387c725e5f51d68eabf25fbb6f4ea00f9f1cf6e4b9b433fc6798cd00f48b22f0f49b2ae25ad39a75cb8fdef0d4a8b7df516ef4af2cf2d69cd5debdcd61f352849c6fd7902b043a11f570afd68d1d16ef78e0b92b43539fea8647c76ddf4f05b18a9494e92efdd27cbb66de3ac5fffe80805817619d4a97b10470170a507c8f92d77c8383b23f463edfb7e7678726a11fa01dd58b127b5a629e3c16b8d47cb6f3f3efdf6bda9a545e33478a851496f4240ae09fd38375d08fd48847eb46d192c8d5e9d52cf6c69f3ee9a0debb70b0569e1bc110a02d7bb180b0199c8895617ac60cedee789eb93991d11fab1f67d7fe2f0ee29794f4be7b0d00fb8f682180e6752cae69634e74fca05db3f6154ba70b774c4bb927ca325ad51004c92d2fd5780af15faf1e31d68edef95a5d11f99782df4cdf284249f6e69ebe67269d966905ab8850a0501264c0170256efdf537a7e6fedd38400afd58c3cbfbcb847ec0b55c5a7f2ec9ad5ad29a371990aedc28bdf7f2d4faf69634e7e7ebdc636e3ef583d2875780e786cfeb48e8c7c7726c798e9da0a5fbd3c7475764ddf2d6245f69e969f98575766168a4da786ddbf1fe24afea40538582400f59d0877b599d1b3e3929bfec00b9c6fd9e945c79c43bdb1dfa718f975921709d4bcd5c4b1af2e57ced961f301e5ddaf4ebdbd38e2725d6a75e713f77aeddfe60779d5fdc9ce4b73bd0d4fe7db3b98fcbe1c3677f31c969696b284829ef100ad252c7dff385e94a28c8c73ff72203c6eaec525e019ec85d992e388cbdf0c4e17149ded081a67e2965b95fa971b3c36d49daf9615aa11f70236ba3debf25ed7847f9f4dbf71a900e4d9d0b767d21357fd28ec60c364dfd808c079dbdbed5076fb97352bb11fad1b36f36f77a8f5a1a7d2429cf6d69f38482b475de742914a4669b5010e80f05c0433e400e6f9f7146e942e847c9c3cbeeb3bfd49bbe9f1d9e9c92b6fe0a25f4036e68dd0e8733a9f9d9961cb9df69443a795269c9272cea7f9fecf41dfba5fc7047eea10fbd59f6cdbc3f35b7697f65a03ea94fdf6c9e066569c7eb535b7b7d99ae5090c1a033899ee543677c23e3c1c9110a02ace9b19a833f40dee789ebb39c51921fe840737b951a27f4033aea1be39f4872740b5af2e765f7e81f0d48075d9573925cd18296fcf4fef0af495d69ba7363dbbe3974c45b92fc64074a026f28bb77bec78075d0de9b3d25356d2ddccee59bf5250669cdd6f141ff58532ed8fe37a9393d4241984a7ed89c0405c043d195d08f9a37f529354ee80774f91c3c737c3b3692628d76750a5d34fa564af6b4a0291b739b4b7fdc8874ec0c313b7cd635a99b2d9fe8f968be768be71ab1aeee53efba32350b696b28482d2faa738b0f37522d9c3b7b46e7442808b0462ce083bd6ece2ffe4a47423f2ece2df2ebbde977a11fd075f769452b66aa0260b7af06ed18bff1f2cf188b4e9ddd1e98d2891beb7fcd205b7ca3b4dbca05a37fcd385b92b4711c4b52df5be7b7ded348b5905010a672d3140232090a8007b3d79d383c2eb5bea1034dfd52ea4cbf423fe6165f92be877ed478ad8b1e5fdc6b1b9e98fa42397ff47706a3cb17e2e5f3d38657a4ca040bdabe0178685366f3f04ea9757b92752d6fea15298353ca79a3af18b51e5cf22e187d34a5b63814642014a48df3a66ba120272e6c316ad04d0a8007dae3fe2bf4e3889637757fe8c79eb3febd377d3fb7f8d0a4beb8a5cd13fa01075ac3fb5f13f9b11634e502a3d1f19ba3fd89a87fd582964cee6974df003cf8aeda74fac694ec4c72db0edc4c3fa5ecdefee746ad47fbd5ee9d6f686d2848cddd72c4fab3a62614a44bf3a64ba120e3f22ea120d04d0a8037758dbccf13d7675f7644e8c7daf7fd09a7de2da9ef4d5b433f92c70bfd8003f8d85fffb724379ffc51b55c6830fa7061286d28e4bae1e9820ddf7a734a3af0ba767d4dd9337a9701eba1bd377b4a924fb573da653e97e4370d52fb080561aa8cbd023c090a8037e5d65f7f739207b4ff6a51dfdcbbd08fc1f89cb439f46369b4d30281032d9599767c6b68dfcc9f188c3e9c58c6ffa705adb8657df0f0f606a3c56788b985a725e5f1eddf1f7361aefeea6f18b19e5efe2e7ad79519676bda1a0a52f2e23a375c30522d1c9a3da37352ebef76a0a94241e8c1a161fadeaeb0606f6c2ecc2e3ca933a11fc79467f5a6df857ed0ca9dd2ab7787778a1dffb716b4e2ff960bcffc0f83d107e3763ce5be377737162d3d43cc2d1c9f94d774e0b0f3c55cb5eeb472d145fb8c5a8f2f81178cfe35c96949da38ce25c93b7b170a52ebe4cf6b4d7caff57ef77a41ba120af2b1cfbfd06a870eddd6ea821bd8cb4e1c1e9752ded881a6f630f463e137d3f7d00f9816e3729716b4e2d306a22737d3bbcffe52927f9bfcc9a9ded968b4f0ec36bfe50e491925d9d0f2a65e91c1604bb9e8ccaf1ab529d8b796461f49cdf35ada3ca1206d9d375d0a0529f5a5424138bcb923dc6c22c7585d70bd036477423faeea67e84769eb3749847ec0215fd8d3824249fd0b03d12b7fd982897d17c3d0b2f3c37d9eb83e99d991e4fbdbded424bf28f463ca2e857b46af4bc9bb5a3a23ef960debbdc6d9c679231404580536fbeb1f20bb12fa516b1f433fde13a11fd0272d280016ebb65f57eabf6bc1f5d713806d73ebafbf3935f7ef404b5f559646db0dd814baeae64f4e7b9f487f682efebc509016120a02344d01f03a07c86fbc295d08fd48794bd9b3f37ff6e676eee4938fceccf8ec24b768697f0bfd80c3f383935fbe832f18865edd0efd6d0bdaf083c6a1456788ee7cb3794f8ecd8b8cd894ee5c17bdebcaac5b6e6f2848ea6f0a0569e9dce95228c820eff634298730bbbd023c0116e8772e7b738b8f4bf2c40e34f5e339b63eb337fdbe3ff4e31d49dafa1162a11f70386b7b389c491b8afacbe37f321a7d9a58adf81ed2ad0d444ba6c3e6537fbe23df6cfe972cef7b44198d968dda14dfea7ef8ec2fa6d647a4bda120efe85d28485fec0f0539af032d7d985010683705c0ef1c2053dfd681a67e297566a157a11ff3c3172769e72f8e257f9fabf73e56e8071c86afacbb650bae315ff3ddcebe19b7e1bbb70a806d38bb9df088efcb60bc33edff66f3b792c143cb85e77ccda851f6ecbc3029bfd1d2e61d9d0cbcc6d9c679b33f14e451e94628c8b63ab7f03f8c1a079e2b9e009c84a92f00d6070f6fdf9103e4de8cb3d8abd08fcd8bf3a96977e8c745efbf642db63f5b11bdb3715f1b8a245f36107d9b5757ffbf16b4e2360662c2e787fb3c717d66f675e19bcd35a53ca12c6dffac51e3bb87bea51daf49eabb5b3a63ef9641deeb35ce1518af4e51a343a12083a49c2114045abb40a7fc00d99dd08fa7940b461fed4ddf9f70eadd32a867259969e5f147e807acccbec12d5bd08aaf1b889edd387ff083df4e72d9849b7154ddb4699dd198a05b5ff28624bfd08119fbf2b27bc70e03c6f7b8acb43c14e4b32feee645a2054f140deaaafdb05f2ed8fe3729e597d38550907d19d5934f3eda62877699ee5f773a13fa91b7f62af463d3f028a11fd0f7abcbb80d873eafdcf5530b5eebbeed46c330a133c4fcf031497d4aeb1b5ab23bc7d66d468c1b9c1e1f1f5d9175cb5b53f2d596b6f025757e716bf77a763cf9ef2b8e57b7085976efd891525edd813df01eb9f2084f93721317f4b1578027718b36b5f3ad53a11f79466ffa3d29d9907746e807f47d979dfc1352259718873e4ead16bcfe74648e34101318facd5b7f2a35edff6673c9dfe7aabda709fde026a7c987cffe62c6f5b4b43514a4d67776ee35ce5abe3d1593e798fa82244b1d68a950106899a92c007628f4e3cbd99761af423f66175f14a11f30057736d9d0821b81ab0c442fe7d665136fc3f28c2700d77a399f70caad3318ec4a5a5f7c5dcb6f08d3f5ed6ccfce0b93bca0a5cd3b3acbe956284819fced54cc9bd16839ebd79f16a120c0219aba02608752e3f6669c61f9c8e8fff5a6ef6717e652ea4b1cd8612a2e2f6df8469aa76ffa69f285dd99bac130ace1f961d3a67519acdb99e487daded4f8863087a82c8d5e9d94b35adabcbb6726efe9cc6b9cc78cff26c91553316f3e74c63732186f4d7279fbeb0de58feb09a7decd6ae77ab3d82bc0935990537480ec4e6a5c52ca537b15fa31bbf5ae29657bda19fa91244b0eecd0e4a21faf9f7c23c6fb0c443f4f8c939fdf4571792d1d71dbd7a464530736be97fa863087b7ab8ddfd2de699d93f3f1cfbda813dd381a5d9d9aa95983e5fc5d7f95417d6cda1f0a726c66c6e776ea6952a6e47ea59669fb93a7eb09c05b5ff2fbe9426a5cad7f5076eff8c3deacab4dc3a35206e7a4b5a11f4992ad757ef197ed82d0d8b1b405c5b741310ece2eab62dfb24f45acd519627ef8c8d43cbd034dfd408ebfd76f19310e798e9f70caad53cbbbdbddc86cab272e6ce946870ede92f617c49a3b6d9dbff3ec4e84822477cf20efac6df8118fb6cc5e4f004ee5217acd0e900b8f4dea933ad0d48f67dde5cfe84dbf2725ebf3eeb437f4e35a8dadbf5fe7b6fe9c6d011ab9a84ffe35cd9aa38c83b3cbaa187bbd7c6dce6ea7de3b355df841f4ef32cee37c4398439ee39b36adcbccba51daff7a7bc9b8bcab0ba120e582ed9f48ca9b26d7800914358ebbc76f2439af0353fe94cc2d080581a93e44afc5c575f3a93f9f5adede81a6ee0ffd38efbcfe7cb87e6ee18529d9d291d61e910ccea9b3a77dbfad0156bcf35e39f9368c6f6e1c7ae998165c2dae360cabbc83cc0f6f953a3e3bc9cd5aded4cb32932de582d1a5468d43df4b6efb9a240fec486bbb130a72f5cd9e9be43393d9bcd6fe95c2b26ddb38258f4ef285f64fa3f2d23a3f7c88c50f93d1fb02e035a11fa37421f4a3d4c5de857ea46ceb58b3ef90b2bcb30e873ef00e2b3be04dfe878c523c01d84fb79c780baeb8f965866115cf0fdbb60d52f3be243fdcf2a68e93fac872dee8f3468d439ee7730b8feac8ebedd7d689509072d1bbaeccbae587a5e4ab13387b4ce4b5c6b27bf4f50cc6a7a40ba120356776e16952567b131c7b0578220bb0cf73eabf423f7eb003cdfdd5b27be7ffe94ddfb73ff4e3a61c976fd6d7ad5d67f916067dbcba9436a4f0ddc640f4d2a40b807bcb45efbad230aca28b3ff7ca2427b6ffb0535e5c9676fe2f03c6a19f93873f9974e2eda41b3ab79e9c8f7dbef5af71960f9ffdc58ceb6949a62610ac43a120dd799a14fa768bd6ebbfee565fffbd7421f423e56d6569f4f6be74fb35a11f67a7dda11f073ad43fb5ce2efc922d020ed3be7d5f6b412bbccedfb79be6934f3e3ac991136ec6b78cc42a8ef1fea0816777a0a9efcf9e1dbf63c438e4397ec229b74e49175e6fbf895b97baadce2dfc8fd63773cfce0b53eb547d73ae63a120ef160a026babb705c03abff0d894f22b1d68ea273273d9d37bd3ef49c9fafa4749eed5fd2b6879539d1ffeac6d020ec3cdf67ea505adb87d1d0e670c468f7cfb88bbb4a0155f3710ab7486983bf55e1997f7a4fd37847f978d573db64c51d2280dcdf1ee847e1cc43d6439a313af71eed9f9ea24dba76aa2752714e4614241a65891023ca1cdbb8f07c8ad3fd7a1d08f857e857e0c5f9052167bf2d71c919af70b0581c3b8a69f7bee654926bdb7adcb2533df6734fa746a297769c5b59b55da38c6ef49d2f6f09e2b32182f5eb3c7c1a1d970bb57a73ba11f07d289d7384b5273597e31c99fafcdffe2e4bf6b56b66d1b67fdfa4725f9a70e6cfc2fedc2d3a4d09ba374dffea07ac223be2f19ec8cd08fb5effbb9e16c9297f66c4add2165792414040ecbe49f021c8cef6e187aa50d4fcd2800aec619627e78abd4fc54079afaae72feaebf32621cfa3979e151497d46cffeac4ebcc6593e3eba228399ad13090599d4dffca133be91c1784bba100a927246dd7cea8fd925a68d270027b4e07a746115fa31b9be3ff1b4bb243933dd0cfd3890e373495e6bbb804336f942491d3b50f6eb16fa9e2d38af2a00ae86abbef2cd245feb404b7fa4ed09a8b470e79a3ff5de9d0dfd38b04ebcc659ce3feb5f92f28824cbd332ef3a150a32189f231404565fbf0e30b7fec61bd389d08ffaeede857e8c973f98e4d6fdbd82e657ebdcf009b60c38947553feb9056bf71e06a257ee3df1168cf3af86611596ea4517ed4b6a177e6c9bcdc59f7fa911e3a0cfc9f3c35ba58ebb1dfa71e015dc89d738cbee1d1724f5c553b5b79ebff3ec24afe940538582c01ae84d01b0ce2f3c36c9933bd0d44f64e6f227f5a6dffb14fa71604241e0508cc75f98fc26557ec240f4e47ab33fd0e5c7277f721afc93d158253397bf2ec9e73a301b5f586787a718300e72df3a23c90ff7ff9eb223af712eed7c656add315513f1f87b3e3f4241689b32f60af06436eb1e5c5ce74ffde9d4f2071d686a0f433f169edfa3d08f03d9989af7d7f92d77b075c0c15cd8cb175ad08afbd6fb3c71bdc1e8816fe41e69c31334e3aa00b85a5bc679e75d9541b626f966db9b9a9277fb66150774697d756ae6a7e4afddff1ae7498f3aa6dd8b37357bcb13927c766af6d66ddbc62979748482d026e3167c0370a64edd13a79d2f00d6131ef17da9e30f2439b2e54ded69e847f9ad295b3377489d110a020775866b4501f0c8dcf6d29f3418bd984fedf8c4c791572900aee6309f3ffabb948e7cb36a66fc7edface246cfc9f3c34726e59953f667df3dcb57bfa7f5a120178dbe95c1cc43d38def8e36f337ef1e7d5d2808d0e902e035a11fdbd385d08f5a9f26f4a337ee974bebab6d1f7000e3c1e75bd18ee5f1f106a3172796ffde8256fcdf72eeb997198cd5be51ddf981a4bcacfd87a1dc2d33d97ecd6b9ef05f5363fed47ba7e60fa7f4cf7f58e6862f68fd3e73fe59ff92a4f95090d2de6453a12040b79f00bcf5256f485a714370a0edf63d65cfceb7f5e650b33ff4e3dcf439f4e3c063fa6b756ef1f1cdfcab7cec969eae923d67fd7b92af4cbe2139c16874fcba9394d4fa0b2d68c8678cc61a59daf1d224bb3a3039e773497ed380f1dd293115a11f07f4b23a3f7c48ebcf294ba33d495e32556733a12030d53a5b00acf3c3c724f5291d68ea273273d9137b7513b63ff4e3c72d9ffae67ae2a93fa31fe026fd650bdaf0a0bae9f48d86a2c34e3cf5be49be6ff2774ead98cfd371939ad46cbcea1753f3f90e34f6c5756eb860d498a2d08f03df63d674241464f48a94329aaad1e9542848fb9f26856e6dce5dbcb86edefa53a9e9c21375ff9199e561bf423f86cf9ba2d08f03d998f178579d3be576ba026e74c76ec3135337cfba6fff7763d161e37a724b5af2d70663ed9473cfbd2c33d992e4d2b63735c93beafcd67b1ab529375da11f07724c06e3b33b110a72557d7c3a9140ded0dfdca95090bc4c2808ab779b321002d2fa313ae111df97c1e0dc7421f42365b19c77f6ffedcdfa985d984bf2db768aebb863b2eeacba69d3bac3efd88840a7cffeb21da7ddeaf0d8ed2bd0c35ad2904f4ef5304c202daf9c3ffabbd43c36c9b8e5bd73743238db37aba678979aced08f03f9d12c5ffdee4e8482d4f129492e999681110a02d3a95305c04e857e94f26b6569c79ff6e65073e26977c9a0bc2fd319fa71200fcc11b73dfc6f69f80620bdbecaacfb583bf6e40c5754a86772d79fb9ad3f9a767c76e24b6569f4cf466402cb77cfe8dc94faf2f64fd6dc2d83bcb76edb36306a53b64f4d77e8c7813c3cb38bbfd1fe7d66d73f24f53169ff8f0dcdfdcde7effaaba4fe52079a7a7406e3513df9e4a32d2758e1ad59a75a7b9bafbf3e5d09fdd8bde30f7a73a8396e7864c6cbbb52731b4be6460ffd4faf73c327e808b8fee1f2ac7f49f26f2d68caf765dded848174d2cc635bd2908f198b093aee5edb92fcaf0eb4f4a1b9f8b32f366053740414fa71108781fa5bdd0805d9f9bf92e90af5294b3bcf4a6a174241ee992b8f78af50109addc0ab57805b7c717d4c6a796a079afafff52ef4e3e8bc33c94fdb210ee84d757ef8b3bac1c581eff17f5a7203f22843d1b1a5b76ddb20a98f6ec905f1e3466482cb77dbb671365ef5c84e8482a4bca4ce2f6e356a53b04709fd38f87bce9af7d6f9e18fb4bea54ba35724d97ef893a274efd33ec7dfeb7949ceef404b8582c08a37e32e5c5cbb15fab1d0abd08ff9c5e72639d55239281b53f3fe3a7bdaf7eb0ab88e8fb6e39e3c5bebfcf05686a3432efedc0949eed892d67c64eac763c23f86742a14a4d677d69386f7b0887bee9bf95da11f07ed96a9f960274241b2f10999a2d0a76b42411e95ae848274e0695268abd61700af09fdf840ba10fa51736aaf423fe61737a776e09b3bed728794e5511d0e37e80af8ee95a62d85939ba5c6abfaddf26b2d69c77f64cfe83386a30537aae78ffe2ea53e2e697d80d6d1598e50901eabf3c347a6e6597ae29074231464e9bd97673073724abe3a357b6b9742416a8482f462d2b5e06959af00b7ecc2fa5fa11f77ec405f3ebdec19fd496f0e350fde72e7a49e19a11f87e3f85c5a5eaf1be05a37ecc93fb46373cb53af79658bb65f8766b7de35c9835bd29a3d2512dbdb73a3baf30349e9c20f9477cf20ef160ad2c3fd49e8c74a3c3c730bcf6fffd9e5ac7fc9b89e9664dff49cd776fd5506f5b169fff5ee980cc667b7fd695268a3761f486ef58dd7a50ba11f35ef2d4ba3b7f6e65033f7989b67dfcc073a12faf1f596f6e2538482c0758e951f6a473372e75c9a538c4717a6cccc335a734e2965c98024a983f6fc527efc3d5e926e84823c2c1ffbfc0b4d9e1e2d83134eb975eaf8fd696fe8c7251dd8e07fabce0f4f6c7d2bf7ecbc3035cf9baa4beff93bcf4eea6b3bd0d41fcdf2d5ef110a0287a6b505c03a3f7c4c4a7eb5037df8e7f9569ed4af6971d5ff4c72eff65fa1f2bad49c90e4db2d6de15bebfcc2030eea2f81de9f28f3a116b5669b27725a7e833dbfe50e49fdc59634676fd286f92b8ce83a5bca77424192bf697f63ebb63ab7f03f8c5a0ff6a6e1702633ebfe38c95d5adac473b23cf8b9b4bf0838939a33ba100a52f68c5e975ade395513fdd8f2fc0805611a0c065e016ec5c5b55ba11f0f2b1f1f5dd19b83cddcf039493dad034dfd48aefacaf3ca9ed15fa696b61660d7a7961df541c31fb0bb32f58ea97f9ae49b2d69cd3df3b1cf4ae86cf7f1e48569cfb77fffa4ec1e7ddd98b4f0c6fcdc732fcb20a7b4686fb989f376f1cdaa3ef8667e37495b9f5cfbeb64e363ca85dbff3eb59e9a64b9e5bdd989509024c9de9b3d25357f36357beb68b42c14047a7ac26e5b83eadc29b713fa31a1be9f5d3821c92b3ad0d47fcd4c4e2b175db42f49ca9e1d7f9c94df6f695b6f9f75d9594f3ae908db0d537da33e1a5d9dd473dad3a0f212df026ce9b568f3f04ea9e5975ad4a2738c4a8bf796fda1205df866d5d1198ccff1cdaa2e9f93171fd1e2d08f6fa4644b597aefe5fbcfc63b9792bca403ddfaa359befa5dad0f05b9e85d5726330f4ff2ef07fea7c7bdf85eac5010e8a7561500eba64deb52d77524f4a33ea377a11f83725692752d6fea95a9e3ade5bcd157aef39f5efd9fcf4acd452d6df3cf67f9e66f0b4cfddd53ce68516bee996f965f36286d3c99d4972769cb8f26fbb2bc7e9741f9eed8b4f2267d7f2848277ec0bcbb6f5675f4f2357feabd536a5b433fc6497d54d93dfac7ebfca74ba357a4d61d1de8de5332376cfd77f6ca9eb3fe3da9c324574fcbbc2fe7effaabd44e9c958482c0c11ee55ad59a0db77b5d4a3675e026f6bd6569e75b7a73a8396e7864f6cdecea44e847a94f297b767dea7bfee38b2eda97f1be8524ffdcd2863faece2ffe8a2d87a9768b7261922fb767f3ab2faf9b1e711b03d3a2ebd189c3e392f2a8165def77970bcffc0f23d301c7dff337535bf5add11be39b555ddb97e687b74a1d9f9de4e6ed3c62961794a59de77dcf7f9cd4ec2d4f48f2d90e74f3cbebece283dbdec8b2b4f3e224cf98a6f95ff6ec3833b50805a1a71b7cf50dc089f5fdece2a393fab4f6ef82f98bde857e1c5ddf9ae43e1d58a1af2fbb77dee84778cb85e77c2de3f1d624edfc2663adbf576787ff3d30a5ca68b49cb4ea69845b65c3be971999966c91dbb60d32ceefa74d87f792f71a998eec2fdbb68db36e433742417cb3aa3bfbd27038939af725f9e19636f19cecdef1bb37ba2e2e1a7d2b75bc25ed0f0519a4d43fee4428c8d2e8ad49de3e550be116f579e94a28c8ece26fd8b9baa21fafcb774d2b0a8075f3d69f4aa9dd08fd182c9fdcafd08fc56727e571ed3fd9e7a3f9daad0ef87a40b960d75fa4a4bda12025dbeb495b7ed0d6c3f4de4db52e49ef49fb9f3a63e22efeec53d3ae1fa32ec96539d7c0744739ef7ddf4cc65bd28550909af776a1d831f52e29af4a7b433ffe26331b4e2f07f8fe65d9b3eb1f3a140a726e275ee3fcda2d7f35c99f4ecddefa5fa1205f687f63eb6ff981056eea0032f9bbc15b6730d895e4662defab9e867ed4dfe94053ff35836c299f7efbde83daf7778fde9b52dfdcd2bfe5fbb23cf3817adcf0c8c034dea0ef19fd65928b5b751d1ce79d75d3e91b8dce04af4773c31f4a4abbbee156f2ee3efde0d7cc40b5ff5599b2b4eb6faff961b3ed4f16742701755aa7fbece22352eaafb7b479df48c9c9fb8bde0773eded4c28c88f752214e4d36fdf9be5758b49feefb4ac87b27bf4f5944167424192faa376310e62a7f70af004fafcb793fc50fb77bd3cab77a11fa59c99ae867e1cc8576ff5cc246d1daf9fce51110ac2345f6bdfdab216dd3d1b2e7f898199d074484a6ade91e4a85635ab8effc0e874f4467569c7fb533af103e78f66f9ea77fb66550bf7a513b7fe44ab433f6a79f4f7847e1cc8d2e8152965d481ee3f25f38bcf6dfd3e73e199ff918c17925c79bdab476f7fe42fbbb77f26254fec40538f492daf08f03ddaf00af0cd5bdf4b35ef2dbb476feacda1e63ba11fc96ddb7fa5b9e1d08f03fe7fdbffcbdca969eb2f73258fa9730b4f0b4ca375978d927ca565ad7aeefea7a25973b30bcf696100d8ffdeff24199d75dcbd5edc91509087772101759ad4f9e1ad321eb43bf463cf8e0f1ffad1333557d5c7a70ba120b5bea2ce2d9cd4fadb94a55dff5f6a9e7cddbbebc1057d5e1f65f7e88c8e848278db0a6ec040171cf06ad9bfd08f63f2967422f4a3bce1a6423f0ef8fffbc233ff23e3f1c9696b2848caebea890b9b2c32a66e5b3defbcab92f23f5b773d2ce5bd75ee94db19a135bcc7db3cbc7f4a7979fb2669fd3da3d3f17d66dbb67136ac7f4c927fec40733b91803a15c6fb06d7847efcb796b6f026433f0eb82eba140a92f2be7ad2a9ffaded53a6ec19bd2b294f48b22b258f2abb77eceafd3ad9fb9fcf4fc985360cba7f101d780598ebf8cfd49987f52af46376f8acd49cdefe86e6a25cfd9fcf59f145f9825d7f91945f6de95fb92ee3b23d25b7b7d4983aebeaefe5faafcd4cde1d927567d5fb3c71bd015a836dfea4e16d33c85969dfa728fe26c7ddeb8346e8068f8d9d3a28970f9df18d64fcd0742114a42309a8bd57062f4f7b433f3e9babf3d8b2c2ef5b963dbbfe21258f4e326ef968dc32cbe3b3ebdc635affb65859daf18eb2345a28bb47674cc532b9e8a27d4916d3855010e07a070e6eccbe0ceaa965e9ac7febcdcdd6dcf041297955079afaaf29fb4ebde6e2d2c84539c95b5bfab7de2e3577b3dc98ba7bac0f8fbe9ce43d2d6cda03739bafbfde08adf2f56838dc90e56c4ff2032d9c9daf2adbb68d8d524ff69a6e85829c2b1464d29b53dafa29886fa4e49472d1e85b8dac8bdda30f25b50bdfbefd89d42bdfe33b992ddc5bff2b14e4db7a03ba4301f0c64f00cf2ae7efbca8377fcde6e19d92563e69717d57663058284be7fc67a3ffd6afddf2e949fed4bc86366d4ce3d724596e5fbbca53ebdcf0c90668b5eeaf537269fda3240f6c61f3fe2dc7d6338d52cf6e549776bc3f29afec40533b9180ca9a3bbcd08f0359daf9f24e8482946cc9ecc2734c83160ecdfe50905fd613d01d0a80377c7bf2c76569e7eff7e6afd974fac60cd28dd08f94a796f3b7ff59e3ffd6fda1208b696b28084ce3c171cfae7f484d5b5f97f9fd3abfb8d528ad82b9c59724e5d1edbc60d69797d1e86a83d443c7dfe345493edc81969ea2d8c1f5bcf070423f0e780dee52284829bfd3855090a93ccbed1e9d9192d7e9090e635d4ffec9fc41f50d40f29739e2aa7e857e1c71f95b93dcb7fd9b40de78cdebbaabf3afbff0ccff48c60b49ae32cda125d60d5e9a646f0b5b36935adf57e7860f3248cda9b3c367b5f8b5b32fe4ebb77a8751baa901ecee41b96cdb36cefaf58f4e174241143bf82fe76469b46a9fef110a42238ec973939caf23a0fd1400afeb6b49b6940f7eb037df32a8738bcfec44e847f2b16b2e1eab7ba65edaf5ffa5d4279aead092fbdcf3b6ff539277b6b4794724f9609d5fdc6ca41ab81ecd2efc524a5ed3dec9585f5a3efdf6bd46aac7fbcd87cef846c68393d3855010c50e92bfc9cc86d3cb2a7fbf72ffd3f8f5d4b4f1931cd7d5995090a9db5b47a3e5943c2a4241a0f51400ffcbbe0cea42591afd736f6eb6e6171f98d4dfed4053ff2dd9b765ad5ebb2abb77be27296f33e5a135bbefcb925cded2d6dd2cb57e40117085d7a3b9c55f4b296f4f7bbf6df65739a6bccf484dc18dea05dbffe69a1f46db1f0aa2d831cdbe919293cb79ef5b936275d9b37329a9db3ad02f4241dabab70a05a1930754af004ff3b6f5ebbd0afd983bed8ea9757bba11fab1b5f1d08f03f9da2d9e96e4ff98f7d082ddf723a3ff979236ff5871b3d4fabfeadcc26946eb30ae47f38bcf4bea1bd3ee1bb66797d168d9684dc99eb367744e925775a0a98a1dd36975423f0ea44ba120738bbf6e9ab47068848240eb2900eebf3df9e3b2b4e3f77af3d76c3a7d63eaf254877e1cf07ff5d36fdf9b75594cf2ffcc7f68816fe6d549feb5c52d3c2229efabb3c3a71bac83bd166d5a57e7866f4bad6d4f5f7d7f591aed316207736aecd12fe5c7dff385e942288862c7345a95d08f034fb50e8582a4beca77325bba65090581761fe574410f433f365cfea694fc4c072edebfb79aa11f07bc407d78f4e58c074241a00d07c68f8fae4856ff3ba02bbe6696bca1ce2ebcb50e871b8cda4deceef3c35be588db9e9fa4eddf5cbd32251257a771cfe9522848ea2bebfcf044a336155635f4e380eba25ba1207fec3b992d754c9e9b92dd3a82f65f5e075e019e323d0cfd58784a922774a0a91fcbb165e2375de582ed9f48ad9ee88136dc902f8db6a70b2972a5fc4a2ecd47ea8387b7376a37701dda3cfcf1d47c32352774a0b52f5ff3d7ec68cf52ee4e28c84c6ade57376ffd61a3d66b7fbb16a11f075c17dd0905b995ef64b6746fddff498d47462808b4ce341700f7a59461af423f4e1c1e9794d777a0a96b1afa71e083ceceb72579bbed005a60ddf2af24f956075a7abfeccb67eafcf02106ed5ad7a1f985c766904f24e9c253197f9799cb5fdda15baac98756f4f097f272c1f6bf4929bf9cf68782dc2a83c1aefad087decc4ed34bdf48c943d72af4e320cec6424158d91c120ac201cf142d38d70c84804cd184cbb3cbee1dffbb377fce8387b7cf38a3246d7f2d6d32a11f07f2b55bfe6a8482c0e40f8c1f3efb8b497969479a7bbbd47cb0ce0f5f5b4f3ae988a93ec36d7ac46deadc70945ade9da40b058a71c6f9a572de791dfa04440b0ea9655cfb387fcbee1d3b524a178ac13f99ab36fea12b45ef4c26f4e340ba140a32bff02cd3a88d7bab5010dabefb963a6d7ff2941600cbfbca9ed11b7b73e3759f27aecfbeec48f2031de8fb89847e1cb0554241a03d8ebfc7eb92fc49572e28a97956968ffa6c9d1b3e681a87abce2e0cb361dfe7932c74a7d1e5f5e582d1472d3607e5ef3aee1ebf91e4bc0eb4f4917576a8d8d12f1309fd38f0c5edbba1209febc09efe2adfc96ce92169f7e88ca4be5e4f7003870a4f004ee24f9ec299f69739e28a27f6ea2fbad5d77f2fc9033a7009f8fd49867e1cb0751f1e7d39830c23140426bb16b76d1b6766f08474e355e0eff891247beadce21fd4134eb9f5348c539ddd7ad73a3bfc5f2965473a913aff5d9fcbde9bbdc84a3b9cc5d9df02e035a1208f4af24fed6f6c7eb76e5e9c37217be1fd930cfd38e054db1f0a724ada1f0ae23b996d766c798e5010a6e94cd166d35600ec5fe8c7fcf03129e5573ad0d48fe5d8faecd6ef43e78f3e9ee499b60698f05a3c6ffb3f25f9f5ee5d53eb9332b3ee1feafcc233ea7d9eb8be8f6353370f8fad730baf4e197c36255dfb06e2d52983c7968bde75a555c6f7ec3b1f3ae31b198cb724b9bce54d9dc9a09ea1d8d1797f9b990d8f2b2dfffe64a742410603a1206d9c434241b8216305c009ddac4c8dfe857e6cdefa53a9795b079afaa594e5615b423f0e78915a1abd35a9beb103935f8b6f4f7246079b7ecbd4f2fadcea1bff50e7864fac9b36adebc53567d3f0a83abff8bc0cf2cf497976daffcdd91bf823f21b65f7f63fb7ba0efbb4defbc37a397fd75f65501f9b6e84829c2d14a4b35a15fa71c075d19d50907ba75ce10cdfc639241484ef99146d38537805b8c713ac3ea757a11f279c72eb0c06672739b2e54dbd32250f2fbbcffe52a73af86bb77a6a4a7c1f0a265e6fc853d28557f26ef0ba933b27795b36dcf66feadcf089f5b8e1915dfc33eafc963bd4b9e16f6743be985a5f99e4961d1d8f73b367e43b441c78aa9cbff3ec24afe94053ef9dab8e7cbb11ebe095ad8da11f07d29550905a1ee13b992ddd5b858270dd19e109c00958372593eb7d65f7e80d7df96beaa64deb3258b733c95d3ad0dc5f2dbb479fecdc8cf9f4dbf7d6f92d8bc9cca7927cbfad62daaf4fd9526717faf7aa552935a55cd2ccc6345e9f5afe4fd9336a34bca35c30bab4ce9fba983abe38495793767f24c9db72745e51e717de96b2ee0fcbf967fd4babaf3349c9e6e1fd32a84f4a2d8be9e2d37ed7fd83be98925f2ced7faaabfd7bc6b438fe9ecfcfc59fbb5792935a3eb91f5567877fd6a770bbfeab2f2a7b461feedcf24f6abdaa3e3e1b728f24f76c79637fb76e5efc5cb96087efceb56d68768fcea8730bf74d8a4f2e3953d454c7b2b5360d05c0cff42ef463c3ed5e9dd44d1db8e17a53d933faa3ee5ea0cefe523d71b890712eeafccd2f2b9dcbf329a59f1f5c6fecc25b92925ae7869bcbd2e823cdaec5ed7f5e6787bf92927776bcb76f9d5a5e90bafcfc3a3bfcd394f2ae8cebfbcb05a34b5b331d66b7de35a59c9a94c725f991a4176f467c3b83c196b27bfbd76d661cf4beb36ddbb8ce0f1f9d9a4f26f96fed6e6c5e53e717ffaa4f6fbaf4d8fbb3b4f3959d5d17178dbe5567b79e9232f864925bb4b8a9dff94ee6cf940b76f9ee5cdb1c5b9e936fe61ea9116634cdc6e39a32e173661d7805b867be9ef1b85fa11fb38b8f48ea333ad0d48b738bce7dc0ff7b0f3ae78f3e9e5abc4600077b1b9a9cb82affe23da37725b52faf6f0e52b229a9efca20ff59e786bbebdcf0c97576eb5dd7fc9a729f27aeafb38bf7abf30b2fab73c3bf4e19fc7d527e2bfb9f5aecc56533c9e37df7afa9c3fa74bdae53768fbede91509075a97554e7863f6492b65a27423f0e7c3dee582888ef64b66f0e09052191023cb103437f2d675c1ed9a75f7dea895b7f22e34e84537c2975665846675ddd877e2f7b76bcb9ce2ffe646afd255b06dcf43695928facdabffdd8f29c5c9a7b2699eb519f6db8e6ef994b19a4ce0dff5f52ff7732f8b394f15fe488abffb29c7bee658d0dd0fc963ba40eee93e43e29e5b8d46fdc3fc9cd7bfc0de45794a5d1764bb3a90be278ea0eebe5fc5d7f554f5c786cc66567dafd48ecad939c5d1ffad0fbf5e987ef1ee954e8c781cfc63b97eadcc2b66b7e306ab37be7aa8d7f98e451a660cbe6d0eed1d7ebfca95baef9c48b22ed74ce82eacb2c6bafc705c0f29c3e7df7a13ee491b7ccdebd6727697bb4fdfed08fa5b3febd57d36970d9af66f9a89f48f2b3b60db851af2abb47e7afdaae3e1a2dd7cdc3c50cf2a7497ea2a77df803497974521f9d5a922b8fa8756ef86f29f987d4f28fa9f9d7947c39c95752c697a496fd37fa657c65ea60630683416a3d36e3f12d3328df97716e9b527f38293f92921f49cd6dfeebc2d2fb83e55939fe1ebf99a59195c9ca66d2f93bcfae730bafbd26fdbacd7e32571df1b6248f316aad324ec9633a17fa71204b3b5f9ef9c59f48adc396b7f491756ef15365698710a8b6edadbbb77fa6ce0f7f3935efd31bd33801c6750a4378275fd6e8e9df75469f36f9ba6ddb207bf7be2f6dff06cd7e9d0cfd38e0fe74de7957a52c3f3cc9bf07b88145920b736c5eb4eaff33178c2e4d9d3929355f9c9a9e4dee949a1392faa494faf2a4fe5152cf4d2d7f9ae453493e953af86c924f653cfe646add935276a4e6f753f29bfb0b8af9f9eb14fffaef4f3273d9e965dbb6b1c5d9e46c9ce2d7758ebfd7f3929cdf81417a749d5b789ac9daaa93fc8bcaeed1877a7871aab9aa3e3ec9e73a3006afae9b177d6fae8df368f7e88ca4bc414f4ce3d63898fc19ad56df00ec81cfe4882bfb152f7ef1e75e9ed6a7d02529f5cd65a9bba11f07be409dfda5a40e935c1de05a17cf7c3157ad3bed9a6fbaacfe5adc73d6bf675d1e9c44a80337e4b3b97aefc3cb79e75da52b686cdfd9b66d9c924725f9a70eb4f675f5c4854d46ad153a1dfa71c09976d1e85ba9e353925cd2f2a67e2714e4874dc9163ab63e3b25129ba7eec23af6feef04f4ad00d8bfd08fb9c58727795e079a7a718ee97f584659da7971529f1de03bae4cc9d672d1995f5dd3b578dee8f3fb9f8acb370c01d7f20f29cb73e5a2f75fa22b56c1f2747fb0bb53a120e3b2bdce9d76479376a27a11fa71c07521148495cea1ff0a05f967bd3145c6424026a14f05c01e867e0cef9ed477a7dd1f9d4ebe1bfa319a8a27e3cad2cedf4ff24701929affbfbd7b0faeabbaee38fe5de74a48c636b8c5e13134ed240361c06d1e251048027682656197b18d2d09130a2149c3bb6368c1f00f549d42322421d450421ed07af060ac7bae6cb009f6bd57769484603ae15ddeb429d869074c708c1f58af7b56ff909b07c1968425dd7dcefd7d66fcafbcef5a7befb3cf3ee7ec75a995e2c7ab73d3113f4512cd01762a11026ca6aed234f8b6b6c818cd3beb3b9fc12d0d5f9a1c8e551ef0535b27286b5591a9a21f435f8f0b25dcfe31054dfd18bd13beafee19601f2ac6db7016002a625433490f600330d227c069be095d92a9a21f73e74e2661357048e04dedc5986fe595b575365edfc42b707eae995b6a9bdf66e5785955d70e5d1d8f12f95c6097f251d35e25ca4db78756bda6508ce580d3e73a0056cedf87db2d29581b7f82497c4f191b77d92cfa319472fe46cc525075c9cff3e6962bd54d439c5be3a7c02f52246a66aad49aa20ab2b101687e9f95e36f67e6961a8c3d0dcb80e3c36fac67b2e8c7905dae7b590f965b086cd5342235ea110eb56b82188feb0bdd78f239742660ad7a0972a7dbfa95af2a14633dd8f4b9ce6f4cf174140531cef7a6b6cb95b0f15c1bdbf5592cfa3174574b515110b76f7953cb2c75d600fb51a970af8a82684d2163270b1b804fe313b255f46356cb0d180bc21fb47e87950b77d5ee056ae516dc16a0a220527b5e0fedb37f2b773e4692cc04de547a6ae9469be7f1dce7adb4728b8221e33ae7c471656f5190f08f9e31bfd59b5aa72b6be3e27ecaf9afd7ecb848535110b3153eabf543eab201eadb7a0df0230522e3423803d0237d029c3283453f4acb776725218325eaedfa1434b5268a7e0cbde990ff19ce12cde05243fa49680df1b37febea7c9288d3d021d2b5e2a7449c56734750547590e969fdef85a3186fc3a2349c59558fd1e1b317fc89b236a66aa2e8c7d06be3d41405390c50519010fb5077f700958156ade7b2c1d3b15200000d3f494441549e687d025c0d69de00ac609c97a9a21f4d0b8f25f295402ef0a6d654d18fa1173af152f07f5524a4465c615df1c3c18ec7f5f14b54064e021e51aa32ad939d345b31d667df52dd39a7d8f134461abe4439824a4e4541c64e4d15fd187a6d9c9aa2201f57519040fbd086d56fa92848e6b3ac0dc02a8852dc5faeb562bc3e2b89f019ad93b068153025f0a6f64272b6deb87897be4997ab2888d4c085fa1e2bc5c12f946dc3eab7a07116c61ae52c83dc6fa614b7daa6788f8231ce123dad7fcf39a718afc048c359d47fc964fbae3236fa23a3268b7e0c254d45419a5a172b6101cead2a0a92f1f55c081b80aa029c92cec22a8a856c15fda8f7bb813f4fc18dd71556eafc77cd58efba40752febc16941e78f49663b394fb2d32f494d734bcb77538ce763761d90288199d083f3252b17aeabf54fec244087b004a3988255e7053eabf552256c54dd508b453f865e36e034f47c057821058dfd969fd93243590b713d57b81763a92291c5e4eaa16235a47103f019acf1824c2dfe9bdb9660d6968251fa9d5a2efa316474bae2cd242c00fa150dc998ad786e5edadeb832702be66fc67d11b05b694cb5cd58f4192bc7cb148a6a0e2a7daeb3cfd0c47105f80269280a024b7d56dbe9cadaa8b89f52fc3585611fe362cd9a9d78328ff08b82d49198cec90c55ef9b57a3a220599c21b4a6a882b46d006e231765abe84753cb19b8df9482a66ee250bf4a43668869ac2b7e18ec5a454232a41fa72dcd5556ad5c8849a293806795ce545a4b5fdd8956ec7842a1a8f660d2627dbfe1495351103cafcd8e03a6a21fc3ba0677be42628b08bf28c8e154729d3e7b7683b216581f525110ad2964d4a4690330c138cfd675fc575682ef7316fc1991a5a5e8478b8a7e0c732e2be56fc5eddf1409c9c64465575939fe71eac76557c70bf44d3c09fc362535357a70aea414cfb3eefb7ea570482ae69a74150589b5d9f1be6dc793b92afa31dc6b70be9892a22027539978bb3216601f525190ec09e15c61d71980210ffb8c15fdb8b091815c27ced4c09bda4f429b8a7e8c346a075f063ca64048ba272a965b397f4766168fddcb7aac54580cb462684329ecbef73c51f2292bc74bf5764d488348e7f50c2b4cc57805f8ad2968ea2954267e4f191bf96d2bc65f5bb9f315856204525314c4beaa733203cd8c8a82642ca17a03b01ad2b101e8aca294bf2553916fd87d2770620a06e6e5839fb5ca48371a4858888a82486a3b314fb28b8b33f9d34a71011f9806dcaf440779cd5f8e359e6ceb3b9f513024b50eb56bd25114c4bee84d2d172b612399a3ec7a15fd783fcb0a9c5eff32f05c0a9a7b9b37b59ca1ac85b8865351900c65531b805590860dc0ffc85ad10f6f6a5d8c73610a9a7aa715f33fd030799f535a57bc1958040c281a92326f1055e6a6ade8c7c81690abb75a293e1bf32fa28dfa50bc827bb395e30bb274d66fa654b4581ff61cf3dba220e19f596576bb37b79ca6ac0dcb0394f35f5718de6757eb8e775189169086a22066796f5a78acb216201505c9c88410c0570551a44f8003b31392b66c15fd68fb0cc63752d0d44de476a9e8c7016f32c41b31bf4e919014e9c739c7d6adfa654d8cd162e11eeaeb8fdb7b3660a2f457451fee37d337f1a3562e94140ec9cefc126f4bc99955f5b8e5fdf3ad472b6bfb5bc4f33c8dbde7eb5882031c171b3a5e063f3f05d7dc3fc6a2077ceedcc9ca5a607d484541b221d143c56a087903d089fc422b75be98997543f382a3308f8183026feaeb0cd06aebd6f56a888cca06c32d18cb140949c94c7565168a7e8c688cfe70c5afad54584cc2747476e738079f22c6342b17aeb3ee653d0a48e8f9d2627dc4214bcf9955475247414541f669071eb5d89a353b158a511817a5c283b8b5a7a0a9c7d3d3b0dcc194b5c0fa908a82684d21ef4bc01b807693ad2faccacc2df5ecd90d78ee7ee0a8c09bda4f42ab6d8cff47c36354978d97018f2b1012f895f81e2b15be53b3bfbe2b7e984f4ffbd4decf8235078e69b0791968b5627ca615e3ff544024d3dd3d3d67569d4265b2ced6fa4309c617acabe30585621495f337028514b4741ecd6d4b94b000e75615054979025505b81ac2dc00348a1ceaedd95a3a4cfe17e0e4f007a28a7e8c495837c57ba8ab2c54e55109d813ecf44b6a7eacb6b727562cdc4343cf478025c056758d51f50b9c2fd1fbe6342bc50585438bf59a317866550adeaef68bbdb9edab4ad8efc5e41f54f4632c6ef7701a7bbf0c84bfb1ea7e9337b7cd54d602ec47a5c2bd7b8f7191b4d127c05511e206e04bd4d59fbbf7f0e46c2c1b9adb2ec1fd6f527071fbae8a7e8ce105eaa155af91b88a824888de20579997e5a21f231eaf6bd7be63a5f89bd0f8619c2b81d7159503b205e74a72bb4eb072bcccbabb350f4a6dcd29dddd03d4b108f8df14ac076ff799e79ca2ac01f000a5c24d0ac3188d8b356b765289e6137e51901ceef7f819671fa6ac05a8ef577f8f8a82a47002d006603584b601f816c659f6c315bfce4a807de639a7e0fecf2968ea234cb1c51a12633ccf950b1b70ae0eafa312f0867ba4c20c63ab9f84965a29fa31e2315b5abedbcaf152683c06f76b51c5e0917a11b88cdcae63ad1c2fd5d9b229a72ac007369f3c14bf4e929c05ec08bca90d4449c19b178cf7b1358d81c5e13915fd188771919ea220475197bb5d190bb00f75770fc0c0226073602dd3dcb1fff00430e6adb1d6c21ed206e076a2687696ce02f239ad4712250520f403955fa0af6e9ec5719f66a2719866caf152ccef08ab5195902b6def52af19cb89ca2fd367ffc31822a5e5bbad5cf806347e08b38b802714957d4a30d600b328c5275829be531b7fa3d109a9fe355a4feb0f3c845d9d4f62b610087dcd75349e5b39ceff67486f06ff9284392afa315ed7d8c283b85d1ffe9ac9cef559ad2dca58887d68f5562c9a0b84f32291a32f6bf6bb5a0c614de1fdb516f6503600b71345b36c7dc7cf33734f0dc60079e0e8c09bfa18033459f77d3a9b6e3c150b7f8bf93f11c653e55759b72ae482076575983151015b6ce5c25d0ac5481698cb775b31ff032bc527029f04be0fec566400787bef393cc758319e67a5b8ac37674673a1ccc6aab7c0a2cd4ac428cc23c57c17580be13fe03add679c3b751c23b33190dffd221133ad2b567f1fcf7151ce7f0dfcd61434f5566f6f8f94b110e7d68ea749a239019db9be5159d95fc2fce5aaaf6b2ad1865a0b7bb5272f07d612e53e91a5cd3fd87bb02d1409f7e66727ee3793dbf55955fcad4effb062e1069c8554f775f504b3ab83be492fe57faa0be8a877c087313e6da5bc0e4d3e903096e2c7ad145f4c7dfd0731bf0a788cdadbf0da09acc07c3eb95d4758a9b0d84af17fab778c816d7fb40ea77a6b25f76f5a69e5162562b4e68ffc5a92e864c23eb7ea6d7a07c6f10147c39dc07355fcbd3d98df411f27d9faf825f5d26a8c8bc2dfe12ca8723f18aa95775b7bbb8ea709353b5d1d8f127102d8bd50d5238e1ea57f6b4919d9ef3aba0cacae5e0bfcdb834710d458dcbdb9ed7324c954cca6e23695c80fc3fd302c6ad8bbe09b04d40ff177b603870eee6becd76eccfa48fc0d227b8e4aa5645d9dbfc87280fdccd65371cec1391a9832ca7fbe1fb3e13f3d1e3ce76d1bf8d3f4f5e7adfbfeed9a7a02e823275e54cf61dbcfc4990e7e38d17ece22708ff68eb5e1e8c36cdf0bf7845d18cbac94ff49f0313ab5750293b814b38f614ca8522b1a700e4e6317c36c3b89f7606c2262a36e6cc630d8b3167d10af2cc0380b9801d465f067ee0136601ee3133aadb45c6f408e57ff9a7dde2154fa2e068e013ff8376bb5f7be5ed888d71dce0e22abfccedf3808670770b795e31f2b036394d7a6d68f637e16f0a75834bc9cb94f1ef6fcf2eebcfea1b7f1779fc5e4bb8972f78df7037a9f317f0af5f55711d9f1fbf8ddf5c0a4515d2b3bdb307f161fc85b69b52abf07b170c138f39c4f92f8f4c171910cdea7eeff5e730f663da3d067007661d68f7b3fffffa6aed976dcfbe99b78a3752feb519652d08fce38f70872fd0b81e3303e0051dd01aceb13ccde7eefff28e9057be77776585ea0d7eeb2ee58c7180d95a3f6f6884dcf7f054f4edfef9a0620f183b1611dad36b8e7b4efbfd343640f5a319fafc5989bba9d8888c8182c6ae6b41e49c5e6e3fe57c06719fd8740e325019e02df88d9060eeaf989ad5dfb8e322c22222222921eda001411111963dede1ef1b3e73e0a4c074ec7380df840a0cd1d60b07aefe0e7f795811fd986d56f298b2222222222e9a50d4011119171e660cc5a781c6e7f8145d3304e20f16918c732f4b11ba36907c633e04f93f014f853f44f7e569f378988888888648b360045444402e1275e54cfd4b73e82e73e8c7124f851b81d017e3470f8de7f93f9ed26e194775dcb13e06d062b13ef017630787ed1ebe05b20da8225af416e0b51b2c5d6c56f2aea22222222222222222281f31933ea7cf6ec06454244444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444243dfe0fda892933460e767d0000002574455874646174653a63726561746500323032342d30372d30345431323a31303a32342b30303a303044859aad0000002574455874646174653a6d6f6469667900323032342d30372d30345431323a31303a32342b30303a303035d822110000000049454e44ae426082);
INSERT INTO `profilepics` (`USERID`, `PROFILEPICFILE`) VALUES
(19, 0x52494646822e0000574542505650384c752e00002fe7c3f910ffc73492642b93bf252e249920efcdf0d368268d24092afff4753d7c270fefa699349224a8fcd3d7f5f09d3cbc9b661d49b2129e3b9a0f89930e7fee0e9b1001a97ec04f4335e794403e73ce56fdeb5e06040890eaa91e00a082db0da81c10206e27ac950552fd6e0fec950602b65add9a4a435e018e0a70ae7b7d05b82a8082da2d80aae64a56be02f470bb656e70bb2be176c3ee56b8ed6ecfba57cf39c7f9ff747fdff3f83eb23d8f8e489224396e242432ba67e1ff5f2c20ab805e8f11fd9f80b1e676b35dd997b962db57d976e4e5455e06ded69e47eb8ab71b87d1b3dcbc060e178e37cf3e92568e01175fec2ebdb80890191c57245c0732ebea151fc61b3e88033e84233e800b5ce712675cf365120537b860d7c8446966768380337b49ee91201185c789db041f4c91e6bac147e87a927944cc0bb64d4af435cd96f9efdf356a6afdfcf49b3303be8e794c9fdbf43938e26476090ef80a1df081f78c2e67b3104a12f4b8e0ca88246870c1353201151766839d1d87922f13147c9d20f2071004fe10828d3f8860e10f239813176c8e984c305db00df4d9900920f2eb90669724c86c20f06a0c9d84c40b360ec6187d829d372cf6ab758b60e580be667871c45d032417b86b802bbe6c041c066d2339caccf047bde5ee0b8088980040d7adc77302a0246196e499ad27b4e4f2e6a369e53189d86a9e7a7c4ca3e922d55c344fa6ae7c8aeb2a77dfa27aa66d2a77b3fd5e7c75709bb553f1215bb5a637a37b7a336ab013b1d5bffa9456126d61695b231aa4464962dbc33f92db8d37ecffd7a7edffef9eb6f3ededeeeeeeeeee7ee9fd7177f7f9f69e5bddbdb0514a8bb4a5694b0b94e050dae04d4248208440844088bd5eaf5c98beedfe783c5f1f8b8809f0a46ddb22c9b56dbdc6e6649134c46a875a30a005a334ca0c456c013600cb2a0d666881463f48ac3466138d54b8d9ff7fdf9ff6668e2b2226c01fffff87dcfaff779f999d3583c64e1136b599d36edbb0eda6c136766de3e865dbb66ddbb66dbf5e47455ef3b25f8ffbe3d9bf2262023c6bffffa8916d5b3f3c042ef004010827900364411214490a929097d26756d530cd7107e362c69d8ce6688da6eff9d1f663e4335af58cf2ad217deaffffb7226202f0fffe7f8abef7fd729ff7e3c7d2f52defd57ddefcd26b647dd7ff31f6f9a5df02d7dff77f809dfeb7008489faa1ff3decfa5d9a7ee27f073b7f9ba45ff85fc5ee2f4ad1abe11741f1bf0cbf305340989e3f249f9f41818e43ce0944685333864ce07389c9c0f2111dc4498902d0a14b4a00460c14f26c0c4a8c7d758c1e383e4e418bfeb3aab80b668c34311da80198d4e0811dd3480b477ad062128220c34c05a0c8487e650296fcaff422d0a4e5a0cb8e20f900541989600b32906590dae2812f3f30cb409809642148fe0cd28ca56825a0cd20ac14c4e90f903a803a13a0229f3b409f409ff1cf19f9017f481051e2834143847c70681c4f1681e37d1069124d103389f8c19c40a6212ce7844dfc31281e48de4b29e52290cc07a5060249c0aa9130bc18b41afab208c1f1c901d41a6472f041aebe14ca33f8f52c820c0c1b7712b8508c048300241b3d6bbb1368d6b7db1283698f363b806ad3d65e47907c0cba4d323b9d41b8be950250aee7d92703e91eace3f98f61e6ea23cddb1f133ff391935fbf58f71ce071a6273b636593994c26972fcaa6cadb1aefa1e971bb214b6c8945d3562c9988c5edb45d8ca71359bfd638263609f018323bb93c93584c2616179349fcfaa78ab95c319fcf3985ecef3ced00cf2261f8f820930f85a2d1d8fcecfc0bf09bda572c3b8e5bef38c58c364050da22c16340efdb03a1e05424f222fc36b5ebb566abe50e83ea0f074b2491d37322631313c1d0776cfc162fb75aeb1b5b9d88cab3e405aebeec3f78cb4f26af2f81455fbdbbd11bfe55d99d33f3b5b18373827efff0f0750e282df5b7079bbd8c7a8367bc673db8f578e4f2e0c59bf260d7d7dedf1b1d25d41aa2c07031dc797cbabfefe26b6d105dd9db1fcf12ea0c07a3f921dcb867b2b7bbef0d2550de188d4e8e7d6accec211cb8d57da1a3ebede03e30984ce74515962da6ca52b8ee95333edf0d6508b13e99ce36028a0b9ea12a0f4e7bc5dbdafa3c4833339b4f8e3e5759488d743ec25d979a5b5b9e07a9e69fcc2f9bea0aa9817ab86aefb5e74e5fef40b895d5b39b84a232f0e5e4a6661a4fff6c1932f6edaecefa6525756398d2877bcef49d3af13ac83ab1bc7ed2564fa63dc235e76b8ebf7e1922dfbbbe380aa8a6d4205904b73cde507f03245fbc7dbe57564a7e6c8e140ed9d3dd50ff2ec83f71797f135747e60c523863bbadeee827a185e1a7af671d65145ccc10c311db6d7ffbeaaba08bc1c5eb801299d18b42853d9d8fbf6e0e1ae96b1dd813d1a1d3f61c68f06855f5a7a197fe8eecea42050ac7ad25a0bfc1faaaf7403b933d831b3ced01cedbb2a1bd954307de56818a960ff4356b4fe46f290eddf574ee79fe0a1475dd4867beea6cda07d54decdef769686b78efd47a4f75c2ad846dc5f11676bcca81ca564d1c0b294eec6dc30fbd4daeffc339e8adaff340aba735c0dd2d041cadf11676bcac02e5ad999a8e6b4d12af2f02a5cd6ef8a31834d8cd9c6ed1990ddef4e9cce0632f2d438d971ecaba2ae3f9eb8a4363e3a7377d04ba9c37714a6390accb5598a547debf007d76feeca2c200e17a5c07ea1abae7e525a8b45df7d7758ebe1c8eab71a0ac9e73f7bf058addf5af9bd3dab2da023f7475f5c8435f86724fddfa605e5b426f0d372da86a65e33ba3d0f06b7fff5fdfa02a8857e00f425317b7be2c092d5ffbb37ff888a600f5b552d0d4c8bd0fe4a0eadfbee3439a72ba7b9db990a2a4eedd9483ba7fc9a72857b6a0a7a9ffda5386c69fbbd9a728717985b09accfcf39e32b4beed669f9a20beb5800f4a9abce560199adf76b34f4b80d76e0b3a1ab9b9da86f6b7dddda325974fdfc63d01a8e8fc63fbcb3081defb423a72bb2e347479c3ce024c61e3cd333a92069f241e868216776ccbc120568edcbfa421883f8903fdb46b36a46118ad7d1bd20a027f7914270efdf43e148581cc6d3decd50f5c1ec1b3a09ebd0f0cc350c61f2de8c7a31e74b523b6a91d067372bd5f3d0edffcb8fa6b6f0fa946657b1d0c67dbc625dd38ffb57afe6300cc0ec33eb02b0ff379e37ffed3557ae1677874cf55746c9883197dc3833f568b4f9c854e22b1f322cce95736be5d25e24fe624337b1b6154d7fdfdbfbc5421a25b095d43f79e1598d6573ee8d187db8d7ca730bdf50a4cecf67e5d48eedd9253cc549f85a1edaab53421c2ed27ae60e4501ec6d6aaf12ac2359f7503d91d6330bad37b633a90165771829e279a607c4fd73a1a70832b07a9f6c60e65608057aac30a70fd4577ab477a61882f1e88cbee705e81eebb0f97608cadda39d1f958e578d05afaefd7c1288fef4f8bcdc75aef29adf34d2fde609650691c135aeaad46e7e9bf5ef399308c73f8afd3225bf572d4d47b3a6f043a7f1e86997ecbcecf03b1cf072515ad0bbea6f09ecef22d5b60ac3d7ffb60e2f341083a4e5606f88ac2bb56c330d96f714250cde4a0283779ba05ce0ecb8d847cb5d93225abd376d8dacf369530d5c6b398a6b2ad117560802345793061101254b61881ea2fe4141a64f1a9e98c2733ded0526c1c78a47480813d4e3273c6477e6a28428e61ecc02723939f9828381a8d8a03183e0a68c8fc290785890598fe12d24f600bf4ece367d660fa6722e289ed82967822cb307d14534e72cf42a41bc1ce01e1d8fad9906cd2c25a747b039b475463773fa099c3d97244ebc3fe29c5f89060e6114cea8980e9ab23b94472c0995be244104cdf9f68254a031756097ec0c1f4e599504e4c18d5cfb0046c22d8ec48259964c834104e4c231ea41ba424922de2a1fa944042212d097d9cf1e4d11375c4a242441c073ca9f4c2197e2a30f8941143e61e61483df3c82238888d2e43483ea00ad95f78224c8547940bc4ef8714e14383114304990a98fe109143a4079083a709a63fc7b490dc55063a5a88f1e4d6282184745209ee114204ad7a74a0573fa182c34931641840b7210d78d06e1691c0413f549f1040a8242fd8fd258992a8feb0eb4b5495f83bbea854954b4fb39bece692f977fc2c3a01b80400c6124039e673c6c92e67b34bd9bca6e9fbecb28265b75a2ae77395cabde888757a3f39175f4c2e2ecccdc66245dd3a2aac7451f146abd16c6ed6accfe5ff7a7e26110e85c3a1b44a0599c2dc72a0d5eb6e760769795873b37d93131393795d52fa6b1727e4f607fdde96250fb7277cc9efbf7cc5d6a18bd6f069d7531f1d1c343af23896477bfa07fc96f67881da005b6d92c793d961421edb7878b0b333ac39aa77a21a539b4e679b7e79b483173b7d83b6cadc2caad3d7d27c715e95c77fa1b7b5e552455df4efd393e8fce2aafdb9600c8c789ba7352570005e4447ba17b7a711c139ee6d6e2b2ac905bb48ffe4fe9d2354ade6fae30b1ae20a03aa115ddebf4a095be74253435039226780905a84579fac328278e4506d48318ed8390617ef5ec505745f4d6d542bdc62481f0ebeffa624b43ded079ea7107ee218e0d705e7d31f358579beeaeb6bb421c17ed1699f4adb107ca46ad7942a6864c4d681f289fe1a48df6edbd2682981135209380a60b5cd6e774061feb16d5115f0e1d6c4f8d8e922f0e8cd6d685700bd8cbacc2d383c900299238f563f409d2fa818789d4bdbbab31d1e089d7ff2937f459c07cdbcf6ba006556e7d516b0ea3de9d1df25cd866e76dcff4cc2dca1938bc0ecdb7ef3f0cf3276ef3dca81e13574b9630fca01bbd66beff82c5f999dcae1ec07d9c191bb73c0b0f5c6bb3fc6d6dbec97e8c6de1857eef4a972d0fcded39fe20ad9825faa462b98b686ced48169eb5597bf42d52fe68d69c66bc174f7ddf560fb8f2fb8ca149e6bbf5d2f1e28256ac3235682f1df9ec8210a3b16dc508bc3619ae63fac1ba42747475d9ebe19b8ac159f709e4452ce95a124788f1deca6090f0a7c5527962e05c7ced06812dc571e5cc612b065914638a3e078e3a118f85f3795cb12c635229ba0a874ba1a2ae86ce9b5492ae8d287443b0876077ba086b5d3ab384226a20eb32078c584054dac1f4a50641fd686963a7e92c3d550466728cd1096d7e842781cf4a6f779d0c7d0700541987254613cc64ef160023ab9ba8da0fc5e4d48ec06b9db36402d533db5f4a03fa20847c16d714f0c9ab9aecd62c739a207cdcbb8496f8572fabaabc8c1c66a2d70a6c16c5e4710fad9bc991ccc6a416f3e332bd250d154471e37e51d3a101b02afa18e30b474fb0a6a30195081a32e2f8b5fe2414fc33bfdcc44fa34a0b41db41e7cb40b4df5369713837d350a701cac265b5d686bc92a62ace3fcad59c24afd46286caa354c0b3636b2e71c06a9ab3e019ddd544a0b8eb2375cc449745d1a5a1b6da2a5763377d62c28ad6882e2ce5beb90822349ea8e442969ae85ea7acbf348c99ba06e1884dacb2d686f713927980e1237e32324d10c052e5fc8496892b87f049f450ba1c2ee629b1164cb69eb39c2476d005abc2cce887392b67f079df5f3a0c725b984a07d2169ad6dd2706b3d6872bc90105ce6ccf3cf1066641194d92b27640b67470785919b03752eaae1036f67ccbe19b29c9782427b352e1d6b18ab1a93455e2e74bac265c37e3d5f993b20ca421b5a1d0e9381a636ba6aa644516243af8be364e0824356e61e08d22e856ac71264d465c8aa890ac2c98172fba25ce08a4355e61ec8d117857a07225cd465a8aa89cac11f8582df13a502571ca232f7408c41172a1e8f51519721aa262a065f0194dc0930812b0e4d997b20c5048a1e67a22e43534d540a9eaf699e4504ae3824791f84db7f711f490b21211c9afd06eef228b2ef850cc767b1e35cd54e51d3980c861cbbce4751f40bb839efa1a1752d41ad0322e89d9d35c7021ec6cf17be08093a8eda017929ec5e4acf7d9060310fc5b75784605d65e7a33f9340a908d5cf2ec90093cde4dcbf5600e52494ffc66519041fcecdebff02fc5b79a8bf9313014ec5a9b9f57afeec2c0c603427829c3ba8f977d0ef24600473cb12c0ed1631f197f1370b4368e72450354b8c17f4cf794c01668a02c0a31d5ed6d3174fc31cce3902d8dc454bc7e7d85b28c32446058027d0f208c85fc8c2287a0202186910caf49bc84bafc23016c2fcf91f2b940d15eef21118c7c21c7db82893f41b41bd1382810ca4e92bcc88a436cbdd048c6422c71e0e8b640ba81ff39a090c3bec6d9148d7a7a99bfa304ce5107bed21816c02f30b61184b6b9c3c3c2c8fec4b99cb45603097a2e41d5c10c7a63273976034c7d3dcadd44ac3792388efb5cd067a6ceab0451ade28716353309c1e1f77a343c2d801dee32918cf153f75582f8bfcf3792b0dc1808ecd50575b10c563166f9d30a22305e656f74ac2b307b4f755cc08ce3187dd9238fd75da428330a4e96ee6062705b117b4f7c39846a689c36372283d8fb6bd30a8ad25e2aa8b62d85362adf27326c57396b8ec3131ec07e9f6275b4c0a96fb79c37e298cbf8b34e7080c6bdb3c6f671242d80fd24fad9a1634f2e6ec9581f33ad2c62230aee973b4619f0c5a639ce5cfc1c04e4fd136d123823de0bcc1636250ebb0868312a83c8fb3ee248c6cfc286db5ab02a8c951b67c1486367685b58576015481f2273ca606d50e69a8e26ff15594f584616cad46d6ea2dfaea2cc6722760707d01d27275f45581f12adbe4e01069a8622ff512c6fa866074038da49d0a90b70f845b4760787b1638b3dac9ab65acb6687ab08f33d472977a0961211f8c6fb483b3960075fb40f87618e05d45caac76ea6a093b316b82acfd94a196b9d44bf85add0f235c1fa1ac2540dc3ef0bd376e86b09532ab9db87abe828330c4a176c650cf5bf6457c6d81315e6f3376364ddb1187aeb513e668f1006385f3b43580ee3f8541debf44181a58abdc40d7f3ee3549f1cd8c1df792565fa0eb3f9e6792d016262ced610d6cbffeef61943d8f1086139c392fa5ebf66bcc123afa086be0ac27cdd63b7f0ed37c3b619110654d60fb176b8d53770b5f3842d949b63efa4398e7fb093bc958ec356cfda262a0428dbc7ccb841d07d99fff0a4cf47ff1b29b093bc9d6dd30d2a396b87092aff20bc9dab4ce4c619fc06cba5a57c97a100cf525792d06e93a0bae57ad35550d5de2429d723d04c6fa2e799d656be5f95c2ddf6cae1a7788cb6791d554e1ea0c0cf6717195ce90750654d7ec3659db96490b6c9de6eaa463b2705a5ca7b91a7f1755f9a330da894a698de6a96a03d54702662b7d525a68a4ea2c5581a330dc0371699d65cad346557fd474a5c6a4d5ca54f02d541d87f13e6d092b1823aa194c6f6c325f456dc2c279a25aa93a02037e5c5aad3c79da982a8d98b0adf3b56afc9d4c8da74d98372dac6084a676106d4fc08867fdb2420f4d3ea6769598b1823dc2f269d4140cf9a84ee56f20aa749729db5e23aba134492741f4986dcabc0959d90324f9981a81311fb444854e923a89da5069ce8a5b152afe06a28660d08764d5eba168bac453286bd2b21151652e51d40f9ebb8326cdca880a7e8aba899a8451cfcaaa9ba25e9e522bcddad67c51f53214781b4f99b059b3f7886a284e501444c1b0ef1655394c50374f85856e5b38a47091a08b3cbdf5ebb6c04bc534409468f737a806f8c9dd4453f644bf9de6488dacd2730934dff8f59bff9a5429444f0f4fcf45c3df93421f3d8334c53c1d7715253548cf104d5e44c70557a486d8c9bc8ca61bd1f237a4fcec042c9a667aee82543645ce24581eb6f55c650714bac919a6e94234bd476a981cbfdbe919293f39c32ca5ffabeb467150c3dc14ae6769eee93a7b0e6ad44bcd10585e8ab627557e13359fa5e942dfad40618c9a77b0546aebbbad0ca8716a5ec2d2fc737d1778a288685e8ac65fa8216f86a5239d77ac865ee9905418e8bcdd34a74c969830489e88ce0f1c73c26562422c9d6a3d99800a10136469a1f746a082c404488a34f5de5180538098204907b6decbf439057971c2248d45f38f1450d422e940f71d724a97689904c947baef8813c2b484494a7575df7a98d3255a22241d7caefbac21a788f688f63fd465bbfa6fa8cb7afa6fa47cec198e829bfa6f43f924cb1c6d59fa2fba8629592165161cf7c5001c62c2242901920626409fd32c297192364d804dd5132369d70438e414d39cd06f4d808cea99e7a8ed9900850aa679526639ea8911d8c5344b4adc45b58129ce493ce9a25ac734cbc91a70ec9a010d4c850a2509926a66400713227a13f88b19d0e014a7649ea39a670624d39852942c70d41443b08569819204470d53a0812941c922475553c0c5b448499223d7b44a5292e6a86a5aa529c970e49a02654c19bd69980255ed15b24d8186f62a7c6e0a44630a67c1a1a828c6605ee1944071c11c28527216088973943707f2945022a4ecb2ca615a25c4e6a8680e14311508794b467973e081987281d4324a9b0337349789a916482923dbbc2a0552c828640e3c1053219049464d73e0464c9340de9351d81cb82fa6f70422e49439701193442b11053e3707163155021944941073f024a6c1d1840d02dfe15422b20c026452aa0422e39849104849a29d8822264126a54e208d884cec4620324e1b58aed667121c1e6f198509cd3d0179219559201ea9f802f9bf9f279a2b1e6f7d30091c6e28a2cf0cac50206711fdcf24a8a57416888cff6d12f45292682ca2cf4c82524ab1408e22fa60124c523a0a8471c9455080deda88f22e82324d3610c815f7c00c4d442d4651f7408e260b489851d13d50a6290c24c928e51ec8d094041263b4ec1ec8d214036219564b3459406c464bee812c4d792029468bee81244d01207e4649f7c0224d212059468bee81059a2c20194609f755164888d1a27b2049d32f80fc8251d23db0c852dc03e2c511cdbb0656532cd942d446b454740b1460ba90700b84cd57f8bfcdcdba05e6fedbdc8cea9418c5dc02319a4a48f28c226e81084d79243946536e81299a72488a26d5ea0c4d15241946e9823b20e1a88ec3084177c015d09c4592821470074478fa39925288d1943b608aa6828744ca8cc6dd01e334f5856985d1a43b6092260f8ac368c21560f3f443286546730537c04c89a632149711226e8029d0ec422943ea73035ce6a90cc58534e20618e6a905a500c9ef06b8cc5311ca8631658fd01470a0c4538c2239f397c8d1e4faa1489d11facd5f2f68ae8bda19357f974dd945f337a43f6b9006cc5f3f4f6b58ea90fc71d3978df254c7d28464454c5f0778ee281ef49bbe019e7c052ca514a401d3d7cf53cdc6222d48bda6af8fa796707d0d6974d9ec85e33cb5c1fc185265c0ec7580e716989f40c239b3d7495407cc4f29f9cc9e8fa82e98df53eaf59abcc2305103309284947b91c9ebaef054f391e94242bbc9f382e7ae90dda474dee49d236a134d97529bd7dce50688eaa2d9a2947ba9b96b7588eaa159a304afb96b01d15b68da414ae7ccdd79a2522e1abb4ba9c33275f94b44ed08db1d4a45afa93b0cd38653a6ee941ef50d27e70c537b704698823366ee528aa91e9ca24509c7cc5c3d882ee7e104b6313599b926a6fa42771f536bcec4258798dac7b38bc96a3471d5607a5719a1dec4d553b5c92780e954dcbc05da994a6ce3896c625a1e326fdd3653bb013cb2870947ccdb6130bd270ae9d8aa69cb9d3675e9f3a6adae44551fd02c800935a6ed71301ddf03e4dbe6d418376b8116aa0efc8064cc29db6bd6da2caac642f888130e9ab543a0fa08d11ea8a692491b6be3ea8491c5095b4c5a1da82eb988fc87a03e61d20e703516c6a7a070d99c0d05b83a853425556bceb683eb63485d527bbca6ac52cd55f80452670bd45cc994ed5de6ea300449a6a0b0d3946d07d753a13c217572d68cf9fbc89a605a92727699b19d207b84c92981c26eaf09ab1c24ab57c2247352333913b66389acb9705e92c20603e6d908b297a03c54ed23e6ebf4285b1ea8aa4b0a8f9aafcd207b3b014ae6a8aa174dd774135b735155859da66b7d45b33c5478fc0db3f5d008a4eda1aad651fdec7946cb7f01d21e2450c90a151e3967b2460bc4b51285f5f5371aacc2bb206e0fd6dc870a0f3758a30bc41599c2ca1fb0fac8878c957327c4fd510496ac58e192b1ea6d91d74a685fc27adf674cd555c8fb1cd75682152e182aab455ea53e2e7b01eb6d9f36536f86bccf3fc725d7b070d14cdd29b06be17d41eb6d9f3151affb98bc822b6095212c9c3050735720ef4912985cd17adfbbcdd3cbbf20b02b5160386799a6b75d81c05f201b67697df2b5a6e97bdf12d85a0b99ff8a161605cdd25831047e2bccef71e168da24f96620f12b68f328ae79c326e96444629929b4cc1217c683e6283400895f59d0e48e57f080399ab2457627d45ffb702153628a966d83c42367d85227bc70dc141d84c817196cf202d8d2663394ae96d90be1fe436098724c903b06910767e0b26360b9232668382cb345079cbc06865ebff9296987cc5f0bf91f107326cdcf0464ee9fa1cbed03c39226d3b3a94668f30e3a794d0c83b6d971fb20f4d7c2fefbc8627bcd4ebf2bb4c07b78ce98186e2b36390dab20f4650a1eb222c390c1f9fc7b423d0be90fda222bdc6a6eee52d48269f1256e1319d23153539c0af5ce7cf1a15f66e83135af057b3fe49f09caac78ab99799ac6965c4540a45d66d8153431f5b960cf14128041a1a1cbc4dc0bf74130d89a27b4824de6659ee456b99182705668581d352db55de13eec518031a9a1d3b0f82f05fc08386c6a925a748b59b90c83db50410246a486c6afe9949db6801f018b633ea961b3a74f7ca7023edc4e436287d8ac853e590af93df934604a6c281ee992590add3878dc55243619a6f548ba27e4176c22c21e979bcc3fd721d654d04f81c9314b6efe990e99087a77828aca56b949bea43f3a09765d712a302938597774477f4dd8cf80cb6d798293234b6ff876857de5263292e3929363bd7122f0a71d32306449cedad41983203cff41b059b74b725228ea8b4d5be0f744e9c001d14933a92bd2aed03f093eb757894eb62d3de16e08fdc52d843833b293a196f09a05ff01303a14905da8ae231600fff3262829e8979dc4ebfaa13424bfbfb728c149e14936a31b6ae310bf27044e1b360b4f9ccff542241ff2ffc1515270547ab2e6e884f79580c00b9f6665ae4d7a28f5ccc1e75e80029bd741ac39e2438931585e84068f81d77ba3e2b38b4dc14bd0607e96188c8b0fee3c33f0acaf82032e33971cf1211836017713683038036673f7c90fe102fdbb1f4185a305d4e02a0108dada77134385d63970bba0950084e3bae7a7d0e19e3272709101442ccdcb8e50e279b0bba5910144027ae79da0c4754be9f1ce50a0f911b47816fce6577110bd47ebd4d8dc4150fa0c074a9f1cf570de23085d852c7c4ce13ca8b12603860b4fb1105aa56f8a3cef5084d15c1270ffad1b657bc071ea100bcadef58af8c1f3c0f289040dd76f54b4018a7cd8359a62c7684049d134f9d3a782e713111a502aead858abe241d7888a1de201b98a868d0d34f9cbc782e963111e90cbead75b2d54f9c8df5055708808e46dedca3ba8f2574f07d7c72244a090d2adae872e1ff91bb20a8e32816252b3fedb4097bf7a16d83e9b600285985efd6b84321f7d8daed8592a509e532acfbf1628f3a7cf01dfd3055400b38e46a5e7a0ce47fc96b0d4393230ede8d3e22cf4f93a303e5c4606a2d3da746d0cf2ac9ba32c79950d245675299884405f09ce4be6b38174449366b210e8d24f918657d9d2c09a0935b247ca10e8e01948dd5a230e3843651d2a0f43a40f41eeef9307309ed6a0c900447a664470f88e40109dd59f541c22addc0fc9af5f2b10a4fa95c7d393854c6b93a27be3ef4b04655f5173b25d0e645abc0fb2ffc57512018616f4263202a9ee0e08ef65ff22134c0f6a4dff2ca49a390ee9dff62a9960e9c2aac6581d0588756b467c9e5f0805b8b0a02f912ec8f54a1be4fff30f4905e37ddad2128260d74301d73e2a1664cf16352577b600c1b6f935009ffd9158808e493de9ef83642beba1830f5d2d175c39e9e848e65404a23d9c578237fc8360503e39a12131af03d1ae6c8016def32ac10043bdeae169198370f764d4003531c960b936a11b91234508f74a37f4d0b3553480af5931eca3fd10ef1668e2b04f3658aa4d6845ac2e0ff19e9e53056c716403741cb335c2fbc400e45bda045d0c1c960eb207a6f5e1a587f210f0c18a32a035291da06f7751170a7b8621e1993a68a3678f7c60d57469c2f16315887837f471b84f3e4068e3b4168c6e9f838c5be71402bb6d0101cdfb8b1a50d8d30629ef8446160e8b08857da7c4e7a9adb620e5dab24aa029262220bc7e58769d1be390f353a194bb8404b43d94905bf4e17e08ba67ab56cc75480995da4d6999051e6d82a4138f805a1e141390df713023aff4d607cb10f5c3caf5c2fb3e39018987ebbdb2ca1cbc671eb25e370dc5dcb1465040f481158b276ffcd62884ed7fa6a7181fb3fe4e54005ace661c8abcf1bb8310f76d85b72b061e4dbe565840dd958c434fa6eebe20e4fd8ed86dd0cc174eef12175077212f4d4d71df3d5148fcc8e82b54035f7bb5c080b21343295a4a0f6d4840e66ffe045c89a903a7e394a47eb123075762496e4070706a191d3d9b6a2c88ded18b74517200b61c6d7388c8346fe881f40b7aa18095873a6b49c83fbc2d06d762b9a20040a0677c93fcecb62d8d1674d079dd4d400beba6da6a45977f6cd714f47070129a18e81cb1d3428bfb0e345b7035661d550050b0bf77b9c07a0ed4a4a08ee3e0186c28644b6f5f05aaf1c3d59350c9d93168e5aad7776d487307aafd7041162db580f826f7ef1d3ca30d4707a09a43ee0cd473e7fee5908bed7fbcfe0a5c928e7e8848f5f2e2b4002430d87c6a1e3a1ab8809cad2222129c5c9c1d7d0ec2e9f736f73a50d3b17600ba9a3f7b7a5923e0099e38d79e86bbb2ac2c5f77cf26cfea8147cc196dbf703e018ded75977714e6ebf6c9f4a389ef11ca75fb7c5d2bd0daa9539deafa370e47c7db9147a3726160a07f126ecdceed7c637073d01f0c2a0fdc58e0b2fff2a4030d6eb4d6c21967fadd8deeee6fbd0767353a3e3131e15f861ecf83d29c73a8dd6eb41aeb6bc90760716a7a2a1c0a4ed97085d6eee9db136ed571aba542d9890756e52ca762b1d85c343617cd43b12b7df570e1bedc837b597693dd5c32ff8e7f6fba0be0c17b002eef0278277c7bca5a2b4bd9a56c7629954c42c9477591bc57edfa724d8dd8f7cf8adaff7b3a9a0a0278a8a3051cff0f90e03c69e7958205506a87e5cf5c30e58a29b900b56248be5b086138aba40623762a21f965a285ae5346075e1c9541f2f9480ecda28601eca807869c3530f714d1941ac0d3861fcaeef58e28da8be8583ea68b416a554f17dd3b4263f985344679150369f48bb8587e628e2597d43832074649b17ccd1f5327a369e20f2c3222d1593e058b4c9574969945a87e94cc432e996bc1b0fc4c289d4c72306a2b1292f7265aa9a55182577b6190fc34904be989a101bb4e6220f9bca798621240078e5d04c0b3adddce2dd114bdd5463c957a39dbaa6bd80695ad6670fc0cca9d3afb7835e7a0b50fcb07cc332e3679b7611ef43661f99e7ffadc0e61cb3f98ecc0f23d0bb5b3e9deed5888ea1b930d0b1575b9c9f0b4eed04cf94c487d63a4094ff71e4dd38db434d48661f9999c7a735413398d8b31587e60a8a530413333146613b07cc75373bead164f259fb653b315caadf478e26cd467b6aeb94e52fd06bc4a51f6fb3fb7d8647d78b44152a8d73742d34d9ff9f105c754adbba3b9ef1da2729d8577dff8d84233f5eecba55bbe0e6177de9aa6425bc08aaf5c3b659b277b57ccff1ec8bb5dd3023ddf98fb5b701f7ef3d30b4dd3fcbec2fb5f81a72e59825af13fa0e97bf10fb67ce5da059f49727637e21fae88aa99d6f14aa1aa7fdcbdfb7a6fb3396ad8ed82f8611daa6fc28f7b0266c8bfbb01da79d61d80f49e952668f16018ec57f9d556c4072c18c9313db1c10a28e07c3515f47adaccce6d7b1ce8607b8d62450780e8fef9e6a674a8185a583eb8c22af4b069c06f66ec3d6bf16f5e2645b9c1b1bb1a0ac7b698989513f9f8b797ba7af7b9a9d8925a67d94ca569c99d68823656d73f2745e8e38ec18049b1321b3ddcb219986935272bc66aa193956793b57402283ab4c08c144c2f8556ae3e9b32f472e36cd27cf887db1ddc021ace0e388663e7d17ca8a6937dbaa5926e0079275b4d46e3c1226867d17aaa77063f2ea7692340d5b126535178640effa5ddaca82f8ebdee29d6752d7f4c4cc566806dc74a4c44647a6f1affb59d9ebe586a59f714b8a1bbf01e296dda19988d9b0667f4520a0afa8952cb3a3cedd597b3efd10f207064c8350a6d8faf82867e6cb9731d9ef16a5e41007ceff6e77ba660c343d740451d3c7baba222c0972fbfc608b43c780774b450790ee0147504f8c4e5b7ab5fedddbd1e54d75612e04397dea77a6597cbd250d2667eaee62d2d013e74e97d6a5776a13709352df1dc97a4328fc6013e74e97d2a5776a13789ffb5855e665cb32c951a46fed0a5f7a95bd985de24fe07cf5ae9af836bcb3231f6fb1eea55b59a737b9350e484aa00c3771da96859f3f91e1b9ada3557c3d596aa0057eead2a6bd8aa8b1d1e7435c70a97950548ddbd33a75d3b2fae85b2ce58e7aaad2cc0f2b6f531c572b397aaa1ade3b012e80b90697ac8af548999891a28f6b2a32e80a7e541af42551e194ee1ffe6ac87a15b112a52686d02e0cac67dcab4f5489b83ffa7b91a3aac7a49061dac5b78eccd7a14da7fb61a2a3b61eda30aac6c376f3a53d1a0cad9ddb5d0d9a55b1d4a470320bc75df82f2d86d33db1d287aef6c804cf3f676c5291a9f2e81da4eed26bcc6dd0018dd7930a53256ebcc8e301477c0465b9703c4dbf79ca9684bc5e8c15c68eebc60ab53af3a00529bf7861525b07b6c8b03dd2db0e19cf200f6b9aaba9c8eac1c9af0438a9ddc369d7538ab0401a0f2f8c1338e76546533cd10a4d70aadde160a2b8c0d10677efb8121c548ee1bd8e44181076cfd258cc974fc899a099588740c2c2f840a8fd8be95d3210003758743ca10bd7adf1680129730a1ed681180c9dd752135889ebf5d65c430560a7a0460a4f6e8b002a46e9edf06452197a6002c4d02305755d75b915ce9feedc812a53c79e6c896750940fe89a63339990d6fee870151cc238c5ad22600f1d1fae361614517d73715215d0aa99ecce2380ce5c27af254fda90b0529f5bcd52222b0a75946c64d15f9593c810128fa4e9c1e118f7d76fe222b8aba340fcafc483ed1dc7a76562c91e9fc6ae01765bde406c2ba925e3d79e6544bebbc3842a3e5721412953dc2cc79dd7af2446b47c7b418e2c793e93c288abb3d1b0a5659bb9e1cbb70a1c35f61af389d9efec3139dbbaa614f2e74f4f5f4cc9316d91b8f9f38a2c6abc060285a3af694c996debe8b2b54f9370ec6873b967c075da452c3ec0e238b529e6c8f8c0d0c0da4090af6f7f68ff77cf25d352f4532c0f4cb153e8a49314f3d7665d8ef9fb059a9f4fb3bfb555b94fbb0180f8e43879633b343c363e3218b09a7b7b93d1885455faf28dd53af46c7c726c6838bbfe5acd6fa56b737888ac26fdeb1024a9af7b485c06420100acd58bf6d4aad76abb5eed645fd87b0645eff9ed64ece4e4622919958a2f29b2d53aed5ebf5f256b02c9a70803df3a6e0197adfb29888c5e792f38b8bc9ca6f8a4c3e9f2f16dc722b5b0989669c668ba0681a9eb19d9f4d253399cc522693c9e5df6bea7225f1583c1db36cdb4edbb69d75cb3ff3c410ac1e5fdce6bbfd3ba892a1a99a8fd4fdc7c4c78f1c4e87a83be1e5e65370a3bd08badc32de2880d199b8e4732f8106d6cdadd7e43b1c090eb0f064bd7dfe6225e405e1587b669b61b2d6b9269b0a161f9866f461f3ae279a0696eff6799595acbf4cd6e976419d7da6ca7e406399e1bc0bb2f00c09e696d9e7cf2364f8b0a5971a52bcd08b20878e5a0a49e01d669921cba1a7950ee29c76794b6dbe06f2cc67c335fb24a57ba3d1e66e9ff75026688db6d7f784827122930e726db8a49b0483766612e1f63c52b4c241b5d31b0cd443bce33e2f1f4dd341c2b959ea682765dce12c224c46e9c1cc5e6e927d7ed5490998c843d253c51cada8808137e64558794b1b026ff77969bbb52617d879dce5a1de9ad0eb2d35f56e6be3add4ba654323f6f9b3d410d5dba1eb9e2abad72587ba210ae98f0b4bf4b1f4307724514181d33eafefd6b54085af8f6b9af76378775563ae03a05f4fbf27d3f9b09e9dfe18e901e9400d2534f906312c50663cb2c25c6803052b68b49e767ae375e64e23d8eb0df3553ae8b4986f6fdcb3e97cb9b5e9f59dde43bde0e16d31fac804b56e50f2400fedf62c3043bd5ec30185a71fa0dde9f5c3a3e978ea1fe1c19e0eeda3d44a02aaff91fd7357f7a8e3a4a435c752df7d2a0b66fe0c35bfa021f6c5a770e957b99ef08a96d217dd7a07287b5dcbeac75d7a7fd516aef57ec2a5f7bb3bdafabf9f0300),
(47, 0x52494646822e0000574542505650384c752e00002fe7c3f910ffc73492642b93bf252e249920efcdf0d368268d24092afff4753d7c270fefa699349224a8fcd3d7f5f09d3cbc9b661d49b2129e3b9a0f89930e7fee0e9b1001a97ec04f4335e794403e73ce56fdeb5e06040890eaa91e00a082db0da81c10206e27ac950552fd6e0fec950602b65add9a4a435e018e0a70ae7b7d05b82a8082da2d80aae64a56be02f470bb656e70bb2be176c3ee56b8ed6ecfba57cf39c7f9ff747fdff3f83eb23d8f8e489224396e242432ba67e1ff5f2c20ab805e8f11fd9f80b1e676b35dd997b962db57d976e4e5455e06ded69e47eb8ab71b87d1b3dcbc060e178e37cf3e92568e01175fec2ebdb80890191c57245c0732ebea151fc61b3e88033e84233e800b5ce712675cf365120537b860d7c8446966768380337b49ee91201185c789db041f4c91e6bac147e87a927944cc0bb64d4af435cd96f9efdf356a6afdfcf49b3303be8e794c9fdbf43938e26476090ef80a1df081f78c2e67b3104a12f4b8e0ca88246870c1353201151766839d1d87922f13147c9d20f2071004fe10828d3f8860e10f239813176c8e984c305db00df4d9900920f2eb90669724c86c20f06a0c9d84c40b360ec6187d829d372cf6ab758b60e580be667871c45d032417b86b802bbe6c041c066d2339caccf047bde5ee0b8088980040d7adc77302a0246196e499ad27b4e4f2e6a369e53189d86a9e7a7c4ca3e922d55c344fa6ae7c8aeb2a77dfa27aa66d2a77b3fd5e7c75709bb553f1215bb5a637a37b7a336ab013b1d5bffa9456126d61695b231aa4464962dbc33f92db8d37ecffd7a7edffef9eb6f3ededeeeeeeeeee7ee9fd7177f7f9f69e5bddbdb0514a8bb4a5694b0b94e050dae04d4248208440844088bd5eaf5c98beedfe783c5f1f8b8809f0a46ddb22c9b56dbdc6e6649134c46a875a30a005a334ca0c456c013600cb2a0d666881463f48ac3466138d54b8d9ff7fdf9ff6668e2b2226c01fffff87dcfaff779f999d3583c64e1136b599d36edbb0eda6c136766de3e865dbb66ddbb66dbf5e47455ef3b25f8ffbe3d9bf2262023c6bffffa8916d5b3f3c042ef004010827900364411214490a929097d26756d530cd7107e362c69d8ce6688da6eff9d1f663e4335af58cf2ad217deaffffb7226202f0fffe7f8abef7fd729ff7e3c7d2f52defd57ddefcd26b647dd7ff31f6f9a5df02d7dff77f809dfeb7008489faa1ff3decfa5d9a7ee27f073b7f9ba45ff85fc5ee2f4ad1abe11741f1bf0cbf305340989e3f249f9f41818e43ce0944685333864ce07389c9c0f2111dc4498902d0a14b4a00460c14f26c0c4a8c7d758c1e383e4e418bfeb3aab80b668c34311da80198d4e0811dd3480b477ad062128220c34c05a0c8487e650296fcaff422d0a4e5a0cb8e20f900541989600b32906590dae2812f3f30cb409809642148fe0cd28ca56825a0cd20ac14c4e90f903a803a13a0229f3b409f409ff1cf19f9017f481051e2834143847c70681c4f1681e37d1069124d103389f8c19c40a6212ce7844dfc31281e48de4b29e52290cc07a5060249c0aa9130bc18b41afab208c1f1c901d41a6472f041aebe14ca33f8f52c820c0c1b7712b8508c048300241b3d6bbb1368d6b7db1283698f363b806ad3d65e47907c0cba4d323b9d41b8be950250aee7d92703e91eace3f98f61e6ea23cddb1f133ff391935fbf58f71ce071a6273b636593994c26972fcaa6cadb1aefa1e971bb214b6c8945d3562c9988c5edb45d8ca71359bfd638263609f018323bb93c93584c2616179349fcfaa78ab95c319fcf3985ecef3ced00cf2261f8f820930f85a2d1d8fcecfc0bf09bda572c3b8e5bef38c58c364050da22c16340efdb03a1e05424f222fc36b5ebb566abe50e83ea0f074b2491d37322631313c1d0776cfc162fb75aeb1b5b9d88cab3e405aebeec3f78cb4f26af2f81455fbdbbd11bfe55d99d33f3b5b18373827efff0f0750e282df5b7079bbd8c7a8367bc673db8f578e4f2e0c59bf260d7d7dedf1b1d25d41aa2c07031dc797cbabfefe26b6d105dd9db1fcf12ea0c07a3f921dcb867b2b7bbef0d2550de188d4e8e7d6accec211cb8d57da1a3ebede03e30984ce74515962da6ca52b8ee95333edf0d6508b13e99ce36028a0b9ea12a0f4e7bc5dbdafa3c4833339b4f8e3e5759488d743ec25d979a5b5b9e07a9e69fcc2f9bea0aa9817ab86aefb5e74e5fef40b895d5b39b84a232f0e5e4a6661a4fff6c1932f6edaecefa6525756398d2877bcef49d3af13ac83ab1bc7ed2564fa63dc235e76b8ebf7e1922dfbbbe380aa8a6d4205904b73cde507f03245fbc7dbe57564a7e6c8e140ed9d3dd50ff2ec83f71797f135747e60c523863bbadeee827a185e1a7af671d65145ccc10c311db6d7ffbeaaba08bc1c5eb801299d18b42853d9d8fbf6e0e1ae96b1dd813d1a1d3f61c68f06855f5a7a197fe8eecea42050ac7ad25a0bfc1faaaf7403b933d831b3ced01cedbb2a1bd954307de56818a960ff4356b4fe46f290eddf574ee79fe0a1475dd4867beea6cda07d54decdef769686b78efd47a4f75c2ad846dc5f11676bcca81ca564d1c0b294eec6dc30fbd4daeffc339e8adaff340aba735c0dd2d041cadf11676bcac02e5ad999a8e6b4d12af2f02a5cd6ef8a31834d8cd9c6ed1990ddef4e9cce0632f2d438d971ecaba2ae3f9eb8a4363e3a7377d04ba9c37714a6390accb5598a547debf007d76feeca2c200e17a5c07ea1abae7e525a8b45df7d7758ebe1c8eab71a0ac9e73f7bf058addf5af9bd3dab2da023f7475f5c8435f86724fddfa605e5b426f0d372da86a65e33ba3d0f06b7fff5fdfa02a8857e00f425317b7be2c092d5ffbb37ff888a600f5b552d0d4c8bd0fe4a0eadfbee3439a72ba7b9db990a2a4eedd9483ba7fc9a72857b6a0a7a9ffda5386c69fbbd9a728717985b09accfcf39e32b4beed669f9a20beb5800f4a9abce560199adf76b34f4b80d76e0b3a1ab9b9da86f6b7dddda325974fdfc63d01a8e8fc63fbcb3081defb423a72bb2e347479c3ce024c61e3cd333a92069f241e868216776ccbc120568edcbfa421883f8903fdb46b36a46118ad7d1bd20a027f7914270efdf43e148581cc6d3decd50f5c1ec1b3a09ebd0f0cc350c61f2de8c7a31e74b523b6a91d067372bd5f3d0edffcb8fa6b6f0fa946657b1d0c67dbc625dd38ffb57afe6300cc0ec33eb02b0ff379e37ffed3557ae1677874cf55746c9883197dc3833f568b4f9c854e22b1f322cce95736be5d25e24fe624337b1b6154d7fdfdbfbc5421a25b095d43f79e1598d6573ee8d187db8d7ca730bdf50a4cecf67e5d48eedd9253cc549f85a1edaab53421c2ed27ae60e4501ec6d6aaf12ac2359f7503d91d6330bad37b633a90165771829e279a607c4fd73a1a70832b07a9f6c60e65608057aac30a70fd4577ab477a61882f1e88cbee705e81eebb0f97608cadda39d1f958e578d05afaefd7c1288fef4f8bcdc75aef29adf34d2fde609650691c135aeaad46e7e9bf5ef399308c73f8afd3225bf572d4d47b3a6f043a7f1e86997ecbcecf03b1cf072515ad0bbea6f09ecef22d5b60ac3d7ffb60e2f341083a4e5606f88ac2bb56c330d96f714250cde4a0283779ba05ce0ecb8d847cb5d93225abd376d8dacf369530d5c6b398a6b2ad117560802345793061101254b61881ea2fe4141a64f1a9e98c2733ded0526c1c78a47480813d4e3273c6477e6a28428e61ecc02723939f9828381a8d8a03183e0a68c8fc290785890598fe12d24f600bf4ece367d660fa6722e289ed82967822cb307d14534e72cf42a41bc1ce01e1d8fad9906cd2c25a747b039b475463773fa099c3d97244ebc3fe29c5f89060e6114cea8980e9ab23b94472c0995be244104cdf9f68254a031756097ec0c1f4e599504e4c18d5cfb0046c22d8ec48259964c834104e4c231ea41ba424922de2a1fa944042212d097d9cf1e4d11375c4a242441c073ca9f4c2197e2a30f8941143e61e61483df3c82238888d2e43483ea00ad95f78224c8547940bc4ef8714e14383114304990a98fe109143a4079083a709a63fc7b490dc55063a5a88f1e4d6282184745209ee114204ad7a74a0573fa182c34931641840b7210d78d06e1691c0413f549f1040a8242fd8fd258992a8feb0eb4b5495f83bbea854954b4fb39bece692f977fc2c3a01b80400c6124039e673c6c92e67b34bd9bca6e9fbecb28265b75a2ae77395cabde888757a3f39175f4c2e2ecccdc66245dd3a2aac7451f146abd16c6ed6accfe5ff7a7e26110e85c3a1b44a0599c2dc72a0d5eb6e760769795873b37d93131393795d52fa6b1727e4f607fdde96250fb7277cc9efbf7cc5d6a18bd6f069d7531f1d1c343af23896477bfa07fc96f67881da005b6d92c793d961421edb7878b0b333ac39aa77a21a539b4e679b7e79b483173b7d83b6cadc2caad3d7d27c715e95c77fa1b7b5e552455df4efd393e8fce2aafdb9600c8c789ba7352570005e4447ba17b7a711c139ee6d6e2b2ac905bb48ffe4fe9d2354ade6fae30b1ae20a03aa115ddebf4a095be74253435039226780905a84579fac328278e4506d48318ed8390617ef5ec505745f4d6d542bdc62481f0ebeffa624b43ded079ea7107ee218e0d705e7d31f358579beeaeb6bb421c17ed1699f4adb107ca46ad7942a6864c4d681f289fe1a48df6edbd2682981135209380a60b5cd6e774061feb16d5115f0e1d6c4f8d8e922f0e8cd6d685700bd8cbacc2d383c900299238f563f409d2fa818789d4bdbbab31d1e089d7ff2937f459c07cdbcf6ba006556e7d516b0ea3de9d1df25cd866e76dcff4cc2dca1938bc0ecdb7ef3f0cf3276ef3dca81e13574b9630fca01bbd66beff82c5f999dcae1ec07d9c191bb73c0b0f5c6bb3fc6d6dbec97e8c6de1857eef4a972d0fcded39fe20ad9825faa462b98b686ced48169eb5597bf42d52fe68d69c66bc174f7ddf560fb8f2fb8ca149e6bbf5d2f1e28256ac3235682f1df9ec8210a3b16dc508bc3619ae63fac1ba42747475d9ebe19b8ac159f709e4452ce95a124788f1deca6090f0a7c5527962e05c7ced06812dc571e5cc612b065914638a3e078e3a118f85f3795cb12c635229ba0a874ba1a2ae86ce9b5492ae8d287443b0876077ba086b5d3ab384226a20eb32078c584054dac1f4a50641fd686963a7e92c3d550466728cd1096d7e842781cf4a6f779d0c7d0700541987254613cc64ef160023ab9ba8da0fc5e4d48ec06b9db36402d533db5f4a03fa20847c16d714f0c9ab9aecd62c739a207cdcbb8496f8572fabaabc8c1c66a2d70a6c16c5e4710fad9bc991ccc6a416f3e332bd250d154471e37e51d3a101b02afa18e30b474fb0a6a30195081a32e2f8b5fe2414fc33bfdcc44fa34a0b41db41e7cb40b4df5369713837d350a701cac265b5d686bc92a62ace3fcad59c24afd46286caa354c0b3636b2e71c06a9ab3e019ddd544a0b8eb2375cc449745d1a5a1b6da2a5763377d62c28ad6882e2ce5beb90822349ea8e442969ae85ea7acbf348c99ba06e1884dacb2d686f713927980e1237e32324d10c052e5fc8496892b87f049f450ba1c2ee629b1164cb69eb39c2476d005abc2cce887392b67f079df5f3a0c725b984a07d2169ad6dd2706b3d6872bc90105ce6ccf3cf1066641194d92b27640b67470785919b03752eaae1036f67ccbe19b29c9782427b352e1d6b18ab1a93455e2e74bac265c37e3d5f993b20ca421b5a1d0e9381a636ba6aa644516243af8be364e0824356e61e08d22e856ac71264d465c8aa890ac2c98172fba25ce08a4355e61ec8d117857a07225cd465a8aa89cac11f8582df13a502571ca232f7408c41172a1e8f51519721aa262a065f0194dc0930812b0e4d997b20c5048a1e67a22e43534d540a9eaf699e4504ae3824791f84db7f711f490b21211c9afd06eef228b2ef850cc767b1e35cd54e51d3980c861cbbce4751f40bb839efa1a1752d41ad0322e89d9d35c7021ec6cf17be08093a8eda017929ec5e4acf7d9060310fc5b75784605d65e7a33f9340a908d5cf2ec90093cde4dcbf5600e52494ffc66519041fcecdebff02fc5b79a8bf9313014ec5a9b9f57afeec2c0c603427829c3ba8f977d0ef24600473cb12c0ed1631f197f1370b4368e72450354b8c17f4cf794c01668a02c0a31d5ed6d3174fc31cce3902d8dc454bc7e7d85b28c32446058027d0f208c85fc8c2287a0202186910caf49bc84bafc23016c2fcf91f2b940d15eef21118c7c21c7db82893f41b41bd1382810ca4e92bcc88a436cbdd048c6422c71e0e8b640ba81ff39a090c3bec6d9148d7a7a99bfa304ce5107bed21816c02f30b61184b6b9c3c3c2c8fec4b99cb45603097a2e41d5c10c7a63273976034c7d3dcadd44ac3792388efb5cd067a6ceab0451ade28716353309c1e1f77a343c2d801dee32918cf153f75582f8bfcf3792b0dc1808ecd50575b10c563166f9d30a22305e656f74ac2b307b4f755cc08ce3187dd9238fd75da428330a4e96ee6062705b117b4f7c39846a689c36372283d8fb6bd30a8ad25e2aa8b62d85362adf27326c57396b8ec3131ec07e9f6275b4c0a96fb79c37e298cbf8b34e7080c6bdb3c6f671242d80fd24fad9a1634f2e6ec9581f33ad2c62230aee973b4619f0c5a639ce5cfc1c04e4fd136d123823de0bcc1636250ebb0868312a83c8fb3ee248c6cfc286db5ab02a8c951b67c1486367685b58576015481f2273ca606d50e69a8e26ff15594f584616cad46d6ea2dfaea2cc6722760707d01d27275f45581f12adbe4e01069a8622ff512c6fa866074038da49d0a90b70f845b4760787b1638b3dac9ab65acb6687ab08f33d472977a0961211f8c6fb483b3960075fb40f87618e05d45caac76ea6a093b316b82acfd94a196b9d44bf85add0f235c1fa1ac2540dc3ef0bd376e86b09532ab9db87abe828330c4a176c650cf5bf6457c6d81315e6f3376364ddb1187aeb513e668f1006385f3b43580ee3f8541debf44181a58abdc40d7f3ee3549f1cd8c1df792565fa0eb3f9e6792d016262ced610d6cbffeef61943d8f1086139c392fa5ebf66bcc123afa086be0ac27cdd63b7f0ed37c3b619110654d60fb176b8d53770b5f3842d949b63efa4398e7fb093bc958ec356cfda262a0428dbc7ccb841d07d99fff0a4cf47ff1b29b093bc9d6dd30d2a396b87092aff20bc9dab4ce4c619fc06cba5a57c97a100cf525792d06e93a0bae57ad35550d5de2429d723d04c6fa2e799d656be5f95c2ddf6cae1a7788cb6791d554e1ea0c0cf6717195ce90750654d7ec3659db96490b6c9de6eaa463b2705a5ca7b91a7f1755f9a330da894a698de6a96a03d54702662b7d525a68a4ea2c5581a330dc0371699d65cad346557fd474a5c6a4d5ca54f02d541d87f13e6d092b1823aa194c6f6c325f456dc2c279a25aa93a02037e5c5aad3c79da982a8d98b0adf3b56afc9d4c8da74d98372dac6084a676106d4fc08867fdb2420f4d3ea6769598b1823dc2f269d4140cf9a84ee56f20aa749729db5e23aba134492741f4986dcabc0959d90324f9981a81311fb444854e923a89da5069ce8a5b152afe06a28660d08764d5eba168bac453286bd2b21151652e51d40f9ebb8326cdca880a7e8aba899a8451cfcaaa9ba25e9e522bcddad67c51f53214781b4f99b059b3f7886a284e501444c1b0ef1655394c50374f85856e5b38a47091a08b3cbdf5ebb6c04bc534409468f737a806f8c9dd4453f644bf9de6488dacd2730934dff8f59bff9a5429444f0f4fcf45c3df93421f3d8334c53c1d7715253548cf104d5e44c70557a486d8c9bc8ca61bd1f237a4fcec042c9a667aee82543645ce24581eb6f55c650714bac919a6e94234bd476a981cbfdbe919293f39c32ca5ffabeb467150c3dc14ae6769eee93a7b0e6ad44bcd10585e8ab627557e13359fa5e942dfad40618c9a77b0546aebbbad0ca8716a5ec2d2fc737d1778a288685e8ac65fa8216f86a5239d77ac865ee9905418e8bcdd34a74c969830489e88ce0f1c73c26562422c9d6a3d99800a10136469a1f746a082c404488a34f5de5180538098204907b6decbf439057971c2248d45f38f1450d422e940f71d724a97689904c947baef8813c2b484494a7575df7a98d3255a22241d7caefbac21a788f688f63fd465bbfa6fa8cb7afa6fa47cec198e829bfa6f43f924cb1c6d59fa2fba8629592165161cf7c5001c62c2242901920626409fd32c297192364d804dd5132369d70438e414d39cd06f4d808cea99e7a8ed9900850aa679526639ea8911d8c5344b4adc45b58129ce493ce9a25ac734cbc91a70ec9a010d4c850a2509926a66400713227a13f88b19d0e014a7649ea39a670624d39852942c70d41443b08569819204470d53a0812941c922475553c0c5b448499223d7b44a5292e6a86a5aa529c970e49a02654c19bd69980255ed15b24d8186f62a7c6e0a44630a67c1a1a828c6605ee1944071c11c28527216088973943707f2945022a4ecb2ca615a25c4e6a8680e14311508794b467973e081987281d4324a9b0337349789a916482923dbbc2a0552c828640e3c1053219049464d73e0464c9340de9351d81cb82fa6f70422e49439701193442b11053e3707163155021944941073f024a6c1d1840d02dfe15422b20c026452aa0422e39849104849a29d8822264126a54e208d884cec4620324e1b58aed667121c1e6f198509cd3d0179219559201ea9f802f9bf9f279a2b1e6f7d30091c6e28a2cf0cac50206711fdcf24a8a57416888cff6d12f45292682ca2cf4c82524ab1408e22fa60124c523a0a8471c9455080deda88f22e82324d3610c815f7c00c4d442d4651f7408e260b489851d13d50a6290c24c928e51ec8d094041263b4ec1ec8d214036219564b3459406c464bee812c4d792029468bee81244d01207e4649f7c0224d212059468bee81059a2c20194609f755164888d1a27b2049d32f80fc8251d23db0c852dc03e2c511cdbb0656532cd942d446b454740b1460ba90700b84cd57f8bfcdcdba05e6fedbdc8cea9418c5dc02319a4a48f28c226e81084d79243946536e81299a72488a26d5ea0c4d15241946e9823b20e1a88ec3084177c015d09c4592821470074478fa39925288d1943b608aa6828744ca8cc6dd01e334f5856985d1a43b6092260f8ac368c21560f3f443286546730537c04c89a632149711226e8029d0ec422943ea73035ce6a90cc58534e20618e6a905a500c9ef06b8cc5311ca8631658fd01470a0c4538c2239f397c8d1e4faa1489d11facd5f2f68ae8bda19357f974dd945f337a43f6b9006cc5f3f4f6b58ea90fc71d3978df254c7d28464454c5f0778ee281ef49bbe019e7c052ca514a401d3d7cf53cdc6222d48bda6af8fa796707d0d6974d9ec85e33cb5c1fc185265c0ec7580e716989f40c239b3d7495407cc4f29f9cc9e8fa82e98df53eaf59abcc2305103309284947b91c9ebaef054f391e94242bbc9f382e7ae90dda474dee49d236a134d97529bd7dce50688eaa2d9a2947ba9b96b7588eaa159a304afb96b01d15b68da414ae7ccdd79a2522e1abb4ba9c33275f94b44ed08db1d4a45afa93b0cd38653a6ee941ef50d27e70c537b704698823366ee528aa91e9ca24509c7cc5c3d882ee7e104b6313599b926a6fa42771f536bcec4258798dac7b38bc96a3471d5607a5719a1dec4d553b5c92780e954dcbc05da994a6ce3896c625a1e326fdd3653bb013cb2870947ccdb6130bd270ae9d8aa69cb9d3675e9f3a6adae44551fd02c800935a6ed71301ddf03e4dbe6d418376b8116aa0efc8064cc29db6bd6da2caac642f888130e9ab543a0fa08d11ea8a692491b6be3ea8491c5095b4c5a1da82eb988fc87a03e61d20e703516c6a7a070d99c0d05b83a853425556bceb683eb63485d527bbca6ac52cd55f80452670bd45cc994ed5de6ea300449a6a0b0d3946d07d753a13c217572d68cf9fbc89a605a92727699b19d207b84c92981c26eaf09ab1c24ab57c2247352333913b66389acb9705e92c20603e6d908b297a03c54ed23e6ebf4285b1ea8aa4b0a8f9aafcd207b3b014ae6a8aa174dd774135b735155859da66b7d45b33c5478fc0db3f5d008a4eda1aad651fdec7946cb7f01d21e2450c90a151e3967b2460bc4b51285f5f5371aacc2bb206e0fd6dc870a0f3758a30bc41599c2ca1fb0fac8878c957327c4fd510496ac58e192b1ea6d91d74a685fc27adf674cd555c8fb1cd75682152e182aab455ea53e2e7b01eb6d9f36536f86bccf3fc725d7b070d14cdd29b06be17d41eb6d9f3151affb98bc822b6095212c9c3050735720ef4912985cd17adfbbcdd3cbbf20b02b5160386799a6b75d81c05f201b67697df2b5a6e97bdf12d85a0b99ff8a161605cdd25831047e2bccef71e168da24f96620f12b68f328ae79c326e96444629929b4cc1217c683e6283400895f59d0e48e57f080399ab2457627d45ffb702153628a966d83c42367d85227bc70dc141d84c817196cf202d8d2663394ae96d90be1fe436098724c903b06910767e0b26360b9232668382cb345079cbc06865ebff9296987cc5f0bf91f107326cdcf0464ee9fa1cbed03c39226d3b3a94668f30e3a794d0c83b6d971fb20f4d7c2fefbc8627bcd4ebf2bb4c07b78ce98186e2b36390dab20f4650a1eb222c390c1f9fc7b423d0be90fda222bdc6a6eee52d48269f1256e1319d23153539c0af5ce7cf1a15f66e83135af057b3fe49f09caac78ab99799ac6965c4540a45d66d8153431f5b960cf14128041a1a1cbc4dc0bf74130d89a27b4824de6659ee456b99182705668581d352db55de13eec518031a9a1d3b0f82f05fc08386c6a925a748b59b90c83db50410246a486c6afe9949db6801f018b633ea961b3a74f7ca7023edc4e436287d8ac853e590af93df934604a6c281ee992590add3878dc55243619a6f548ba27e4176c22c21e979bcc3fd721d654d04f81c9314b6efe990e99087a77828aca56b949bea43f3a09765d712a302938597774477f4dd8cf80cb6d798293234b6ff876857de5263292e3929363bd7122f0a71d32306449cedad41983203cff41b059b74b725228ea8b4d5be0f744e9c001d14933a92bd2aed03f093eb757894eb62d3de16e08fdc52d843833b293a196f09a05ff01303a14905da8ae231600fff3262829e8979dc4ebfaa13424bfbfb728c149e14936a31b6ae310bf27044e1b360b4f9ccff542241ff2ffc1515270547ab2e6e884f79580c00b9f6665ae4d7a28f5ccc1e75e80029bd741ac39e2438931585e84068f81d77ba3e2b38b4dc14bd0607e96188c8b0fee3c33f0acaf82032e33971cf1211836017713683038036673f7c90fe102fdbb1f4185a305d4e02a0108dada77134385d63970bba0950084e3bae7a7d0e19e3272709101442ccdcb8e50e279b0bba5910144027ae79da0c4754be9f1ce50a0f911b47816fce6577110bd47ebd4d8dc4150fa0c074a9f1cf570de23085d852c7c4ce13ca8b12603860b4fb1105aa56f8a3cef5084d15c1270ffad1b657bc071ea100bcadef58af8c1f3c0f289040dd76f54b4018a7cd8359a62c7684049d134f9d3a782e713111a502aead858abe241d7888a1de201b98a868d0d34f9cbc782e963111e90cbead75b2d54f9c8df5055708808e46dedca3ba8f2574f07d7c72244a090d2adae872e1ff91bb20a8e32816252b3fedb4097bf7a16d83e9b600285985efd6b84321f7d8daed8592a509e532acfbf1628f3a7cf01dfd3055400b38e46a5e7a0ce47fc96b0d4393230ede8d3e22cf4f93a303e5c4606a2d3da746d0cf2ac9ba32c79950d245675299884405f09ce4be6b38174449366b210e8d24f918657d9d2c09a0935b247ca10e8e01948dd5a230e3843651d2a0f43a40f41eeef9307309ed6a0c900447a664470f88e40109dd59f541c22addc0fc9af5f2b10a4fa95c7d393854c6b93a27be3ef4b04655f5173b25d0e645abc0fb2ffc57512018616f4263202a9ee0e08ef65ff22134c0f6a4dff2ca49a390ee9dff62a9960e9c2aac6581d0588756b467c9e5f0805b8b0a02f912ec8f54a1be4fff30f4905e37ddad2128260d74301d73e2a1664cf16352577b600c1b6f935009ffd9158808e493de9ef83642beba1830f5d2d175c39e9e848e65404a23d9c578237fc8360503e39a12131af03d1ae6c8016def32ac10043bdeae169198370f764d4003531c960b936a11b91234508f74a37f4d0b3553480af5931eca3fd10ef1668e2b04f3658aa4d6845ac2e0ff19e9e53056c716403741cb335c2fbc400e45bda045d0c1c960eb207a6f5e1a587f210f0c18a32a035291da06f7751170a7b8621e1993a68a3678f7c60d57469c2f16315887837f471b84f3e4068e3b4168c6e9f838c5be71402bb6d0101cdfb8b1a50d8d30629ef8446160e8b08857da7c4e7a9adb620e5dab24aa029262220bc7e58769d1be390f353a194bb8404b43d94905bf4e17e08ba67ab56cc75480995da4d6999051e6d82a4138f805a1e141390df713023aff4d607cb10f5c3caf5c2fb3e39018987ebbdb2ca1cbc671eb25e370dc5dcb1465040f481158b276ffcd62884ed7fa6a7181fb3fe4e54005ace661c8abcf1bb8310f76d85b72b061e4dbe565840dd958c434fa6eebe20e4fd8ed86dd0cc174eef12175077212f4d4d71df3d5148fcc8e82b54035f7bb5c080b21343295a4a0f6d4840e66ffe045c89a903a7e394a47eb123075762496e4070706a191d3d9b6a2c88ded18b74517200b61c6d7388c8346fe881f40b7aa18095873a6b49c83fbc2d06d762b9a20040a0677c93fcecb62d8d1674d079dd4d400beba6da6a45977f6cd714f47070129a18e81cb1d3428bfb0e345b7035661d550050b0bf77b9c07a0ed4a4a08ee3e0186c28644b6f5f05aaf1c3d59350c9d93168e5aad7776d487307aafd7041162db580f826f7ef1d3ca30d4707a09a43ee0cd473e7fee5908bed7fbcfe0a5c928e7e8848f5f2e2b4002430d87c6a1e3a1ab8809cad2222129c5c9c1d7d0ec2e9f736f73a50d3b17600ba9a3f7b7a5923e0099e38d79e86bbb2ac2c5f77cf26cfea8147cc196dbf703e018ded75977714e6ebf6c9f4a389ef11ca75fb7c5d2bd0daa9539deafa370e47c7db9147a3726160a07f126ecdceed7c637073d01f0c2a0fdc58e0b2fff2a4030d6eb4d6c21967fadd8deeee6fbd0767353a3e3131e15f861ecf83d29c73a8dd6eb41aeb6bc90760716a7a2a1c0a4ed97085d6eee9db136ed571aba542d9890756e52ca762b1d85c343617cd43b12b7df570e1bedc837b597693dd5c32ff8e7f6fba0be0c17b002eef0278277c7bca5a2b4bd9a56c7629954c42c9477591bc57edfa724d8dd8f7cf8adaff7b3a9a0a0278a8a3051cff0f90e03c69e7958205506a87e5cf5c30e58a29b900b56248be5b086138aba40623762a21f965a285ae5346075e1c9541f2f9480ecda28601eca807869c3530f714d1941ac0d3861fcaeef58e28da8be8583ea68b416a554f17dd3b4263f985344679150369f48bb8587e628e2597d43832074649b17ccd1f5327a369e20f2c3222d1593e058b4c9574969945a87e94cc432e996bc1b0fc4c289d4c72306a2b1292f7265aa9a55182577b6190fc34904be989a101bb4e6220f9bca798621240078e5d04c0b3adddce2dd114bdd5463c957a39dbaa6bd80695ad6670fc0cca9d3afb7835e7a0b50fcb07cc332e3679b7611ef43661f99e7ffadc0e61cb3f98ecc0f23d0bb5b3e9deed5888ea1b930d0b1575b9c9f0b4eed04cf94c487d63a4094ff71e4dd38db434d48661f9999c7a735413398d8b31587e60a8a530413333146613b07cc75373bead164f259fb653b315caadf478e26cd467b6aeb94e52fd06bc4a51f6fb3fb7d8647d78b44152a8d73742d34d9ff9f105c754adbba3b9ef1da2729d8577dff8d84233f5eecba55bbe0e6177de9aa6425bc08aaf5c3b659b277b57ccff1ec8bb5dd3023ddf98fb5b701f7ef3d30b4dd3fcbec2fb5f81a72e59825af13fa0e97bf10fb67ce5da059f49727637e21fae88aa99d6f14aa1aa7fdcbdfb7a6fb3396ad8ed82f8611daa6fc28f7b0266c8bfbb01da79d61d80f49e952668f16018ec57f9d556c4072c18c9313db1c10a28e07c3515f47adaccce6d7b1ce8607b8d62450780e8fef9e6a674a8185a583eb8c22af4b069c06f66ec3d6bf16f5e2645b9c1b1bb1a0ac7b698989513f9f8b797ba7af7b9a9d8925a67d94ca569c99d68823656d73f2745e8e38ec18049b1321b3ddcb219986935272bc66aa193956793b57402283ab4c08c144c2f8556ae3e9b32f472e36cd27cf887db1ddc021ace0e388663e7d17ca8a6937dbaa5926e0079275b4d46e3c1226867d17aaa77063f2ea7692340d5b126535178640effa5ddaca82f8ebdee29d6752d7f4c4cc566806dc74a4c44647a6f1affb59d9ebe586a59f714b8a1bbf01e296dda19988d9b0667f4520a0afa8952cb3a3cedd597b3efd10f207064c8350a6d8faf82867e6cb9731d9ef16a5e41007ceff6e77ba660c343d740451d3c7baba222c0972fbfc608b43c780774b450790ee0147504f8c4e5b7ab5fedddbd1e54d75612e04397dea77a6597cbd250d2667eaee62d2d013e74e97d6a5776a13709352df1dc97a4328fc6013e74e97d2a5776a13789ffb5855e665cb32c951a46fed0a5f7a95bd985de24fe07cf5ae9af836bcb3231f6fb1eea55b59a737b9350e484aa00c3771da96859f3f91e1b9ada3557c3d596aa0057eead2a6bd8aa8b1d1e7435c70a97950548ddbd33a75d3b2fae85b2ce58e7aaad2cc0f2b6f531c572b397aaa1ade3b012e80b90697ac8af548999891a28f6b2a32e80a7e541af42551e194ee1ffe6ac87a15b112a52686d02e0cac67dcab4f5489b83ffa7b91a3aac7a49061dac5b78eccd7a14da7fb61a2a3b61eda30aac6c376f3a53d1a0cad9ddb5d0d9a55b1d4a470320bc75df82f2d86d33db1d287aef6c804cf3f676c5291a9f2e81da4eed26bcc6dd0018dd7930a53256ebcc8e301477c0465b9703c4dbf79ca9684bc5e8c15c68eebc60ab53af3a00529bf7861525b07b6c8b03dd2db0e19cf200f6b9aaba9c8eac1c9af0438a9ddc369d7538ab0401a0f2f8c1338e76546533cd10a4d70aadde160a2b8c0d10677efb8121c548ee1bd8e44181076cfd258cc974fc899a099588740c2c2f840a8fd8be95d3210003758743ca10bd7adf1680129730a1ed681180c9dd752135889ebf5d65c430560a7a0460a4f6e8b002a46e9edf06452197a6002c4d02305755d75b915ce9feedc812a53c79e6c896750940fe89a63339990d6fee870151cc238c5ad22600f1d1fae361614517d73715215d0aa99ecce2380ce5c27af254fda90b0529f5bcd52222b0a75946c64d15f9593c810128fa4e9c1e118f7d76fe222b8aba340fcafc483ed1dc7a76562c91e9fc6ae01765bde406c2ba925e3d79e6544bebbc3842a3e5721412953dc2cc79dd7af2446b47c7b418e2c793e93c288abb3d1b0a5659bb9e1cbb70a1c35f61af389d9efec3139dbbaa614f2e74f4f5f4cc9316d91b8f9f38a2c6abc060285a3af694c996debe8b2b54f9370ec6873b967c075da452c3ec0e238b529e6c8f8c0d0c0da4090af6f7f68ff77cf25d352f4532c0f4cb153e8a49314f3d7665d8ef9fb059a9f4fb3bfb555b94fbb0180f8e43879633b343c363e3218b09a7b7b93d1885455faf28dd53af46c7c726c6838bbfe5acd6fa56b737888ac26fdeb1024a9af7b485c06420100acd58bf6d4aad76abb5eed645fd87b0645eff9ed64ece4e4622919958a2f29b2d53aed5ebf5f256b02c9a70803df3a6e0197adfb29888c5e792f38b8bc9ca6f8a4c3e9f2f16dc722b5b0989669c668ba0681a9eb19d9f4d253399cc522693c9e5df6bea7225f1583c1db36cdb4edbb69d75cb3ff3c410ac1e5fdce6bbfd3ba892a1a99a8fd4fdc7c4c78f1c4e87a83be1e5e65370a3bd08badc32de2880d199b8e4732f8106d6cdadd7e43b1c090eb0f064bd7dfe6225e405e1587b669b61b2d6b9269b0a161f9866f461f3ae279a0696eff6799595acbf4cd6e976419d7da6ca7e406399e1bc0bb2f00c09e696d9e7cf2364f8b0a5971a52bcd08b20878e5a0a49e01d669921cba1a7950ee29c76794b6dbe06f2cc67c335fb24a57ba3d1e66e9ff75026688db6d7f784827122930e726db8a49b0483766612e1f63c52b4c241b5d31b0cd443bce33e2f1f4dd341c2b959ea682765dce12c224c46e9c1cc5e6e927d7ed5490998c843d253c51cada8808137e64558794b1b026ff77969bbb52617d879dce5a1de9ad0eb2d35f56e6be3add4ba654323f6f9b3d410d5dba1eb9e2abad72587ba210ae98f0b4bf4b1f4307724514181d33eafefd6b54085af8f6b9af76378775563ae03a05f4fbf27d3f9b09e9dfe18e901e9400d2534f906312c50663cb2c25c6803052b68b49e767ae375e64e23d8eb0df3553ae8b4986f6fdcb3e97cb9b5e9f59dde43bde0e16d31fac804b56e50f2400fedf62c3043bd5ec30185a71fa0dde9f5c3a3e978ea1fe1c19e0eeda3d44a02aaff91fd7357f7a8e3a4a435c752df7d2a0b66fe0c35bfa021f6c5a770e957b99ef08a96d217dd7a07287b5dcbeac75d7a7fd516aef57ec2a5f7bb3bdafabf9f0300);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `ROLEID` int(11) NOT NULL,
  `ROLE_NAME` varchar(225) NOT NULL,
  `DESCRIPTION` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`ROLEID`, `ROLE_NAME`, `DESCRIPTION`) VALUES
(1, 'Admin', 'administrator strony'),
(2, 'User', 'zwykly uzytkownik bez dodatkowych benefitow'),
(3, 'Usersplus', 'Uzytkownik z dodatkowymi funkcjami');

-- --------------------------------------------------------

--
-- Table structure for table `tips`
--

CREATE TABLE `tips` (
  `TIPID` int(11) NOT NULL,
  `DESCRIPTION` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tips`
--

INSERT INTO `tips` (`TIPID`, `DESCRIPTION`) VALUES
(1, 'Znajomość mapy jest kluczowa. Wiedza o miejscach, gdzie mogą być przeciwnicy pozwala na lepsze planowanie działań i unikanie pułapek.'),
(2, 'Używaj słuchawek, aby słyszeć kroki wroga i inne ważne dźwięki. To pozwoli Ci lepiej reagować na ruchy przeciwnika.'),
(3, 'Zawsze staraj się grać w grupie. Valorant to gra drużynowa i współpraca z innymi członkami drużyny jest kluczem do sukcesu.'),
(4, 'Używaj umiejętności do sprawdzania podejrzanych miejsc. Często scout może ujawnić wroga, zanim go zauważysz.'),
(5, 'Kiedy jesteś atakowany z dwóch stron, staraj się znaleźć miejsce do osłony, zamiast wystawiać się na obu wrogów.'),
(6, 'Rozgrzewka przed meczem jest ważna. Regularna praktyka pomoże poprawić celowanie i reakcje w trakcie gry.'),
(7, 'Wykorzystuj umiejętności agentów, aby kontrolować pole bitwy. Nie zapominaj, że nie tylko broń jest twoją siłą.'),
(8, 'Zawsze graj ostrożnie, gdy masz przewagę liczebną. Wykorzystaj ją, aby zabezpieczyć pozycje i zmniejszyć ryzyko.'),
(9, 'Zmieniaj swoje miejsce pobytu po każdej serii. Zmiana pozycji uniemożliwia wrogowi trafienie w ciebie.'),
(10, 'Nie bądź zbyt agresywny, gdy masz mało zdrowia. Czasami lepiej jest cofnąć się i odzyskać zdrowie, niż ryzykować śmiercią.'),
(11, 'Pamiętaj o przeładowywaniu. Nie zostawiaj swojej broni niezaładowanej, gdy masz chwilę spokoju.'),
(12, 'Używaj komunikacji głosowej z drużyną, aby efektywnie wymieniać się informacjami o pozycji wroga i strategii.'),
(13, 'Użyj umiejętności, zanim wyjdziesz zza osłony. Może to zmusić wroga do zmiany pozycji i dać ci przewagę.'),
(14, 'Zmieniaj częstotliwość ataków, aby zmylić przeciwnika. Nie rób tego samego ruchu w każdej rundzie.'),
(15, 'Stosuj agresywną obronę, gdy broniący jesteś w sytuacji 1v2 lub 1v3. Trudniej jest walczyć z wrogiem, gdy nie oczekuje agresywnego podejścia.'),
(16, 'Grając w defensywie, zabezpiecz wszystkie wejścia i korytarze. Unikaj pozostawiania jednej strony otwartej.'),
(17, 'Nie strzelaj za szybko po włączeniu umiejętności. Często lepiej poczekać chwilę, aby wykorzystać pełen potencjał umiejętności.'),
(18, 'Staraj się przewidywać ruchy wroga, szczególnie jeśli masz dostęp do jego pozycji lub słyszysz jego kroki.'),
(19, 'Bądź cierpliwy i poczekaj na idealny moment do ataku. Czasami najlepsze akcje to te, które są wykonane w odpowiednim czasie.'),
(20, 'Warto inwestować w różne bronie. Nie ograniczaj się do jednej, ponieważ różne sytuacje mogą wymagać różnych rodzajów broni.'),
(21, 'Kiedy masz broń snajperską, trzymaj się w bezpiecznej odległości, aby uniknąć niepotrzebnych starć w zwarciu.'),
(22, 'Bądź przygotowany na zmiany w strategii przeciwnika. Jeśli wiesz, że zmienili podejście, dostosuj swoje działania.'),
(23, 'Zachowaj ostrożność, gdy widzisz, że przeciwnik ma więcej niż jednego członka drużyny w jednym miejscu. Może to sugerować przygotowaną pułapkę.'),
(24, 'Staraj się wykorzystywać dostępne zasoby w grze, takie jak umiejętności i pułapki, do zaskoczenia wroga.'),
(25, 'Dbaj o dobrą komunikację z drużyną. Jeśli ktoś dostanie się do punktu, zawsze informuj o jego pozycji, aby zyskać przewagę.'),
(26, 'Zmieniaj swój sposób gry w zależności od sytuacji. Czasem lepiej jest stać w jednym miejscu, innym razem warto się przemieszczać.'),
(27, 'Korzyści płynące z używania \"wallbangs\" (strzelania przez ściany) mogą być ogromne, szczególnie gdy wiesz, gdzie przeciwnik się schował.'),
(28, 'Zawsze bierz pod uwagę, że wrogowie mogą być gotowi do kontrataku. Przygotuj plan ucieczki, gdy sytuacja będzie tego wymagała.'),
(29, 'Używaj shifta, gdy przemieszczasz się w kierunku flanki wroga. To może dać ci przewagę poprzez nieoczekiwane starcia.'),
(30, 'Po zabiciu przez przeciwnika nie zawsze bądź pewny, że reszta drużyny jest w zasięgu wzroku. Sprawdź i poinformuj ilu jest tam pozostałych wrogów.'),
(31, 'Kiedy jesteś w sytuacji, w której nie możesz wyjść na otwartą przestrzeń to używaj wąskich przejść do obrony.'),
(32, 'Pamiętaj o poprawnym zarządzaniu ekonomią drużyny. Kupowanie zbyt drobnych rzeczy w każdej rundzie może prowadzić do braków w przyszłości.'),
(33, 'Nie bój się używać umiejętności do zabezpieczenia punktu, gdy widzisz, że przeciwnik nadchodzi. Zaskoczenie to jeden z kluczy do sukcesu.'),
(34, 'Bądź czujny podczas całego meczu, gdyż wrogowie mogą przygotowywać pułapki.'),
(35, 'Używaj smokeów i innych umiejętności, aby blokować widoczność wrogów, szczególnie podczas obrony lub przy atakowaniu punktu.'),
(36, 'Zawsze sprawdzaj site, zanim zdecydujesz się na atak lub obronę. Bezpieczeństwo przed zaplantowaniem jest kluczowe.'),
(37, 'Jeśli masz przewagę liczebną na ataku, bądź agresywny i nie pozwól wrogowi na żadną przestrzeń do obrony.'),
(38, 'Pamiętaj o obszarach bocznych, które często są wykorzystywane do flankowania. Nie zapominaj o takich miejscach.'),
(39, 'Zawsze bądź świadomy, czy twoja drużyna posiada jakiekolwiek umiejętności wykrywania przeciwników. To pomoże w opracowywaniu lepszych strategii.'),
(40, 'Zmieniaj swoje podejście w zależności od mapy i sytuacji. Agenci mogą wymagać różnej strategii w różnych warunkach.');

-- --------------------------------------------------------

--
-- Stand-in structure for view `tipscount`
-- (See below for the actual view)
--
CREATE TABLE `tipscount` (
`Tips` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `userinfo`
-- (See below for the actual view)
--
CREATE TABLE `userinfo` (
`USERNAME` varchar(50)
,`ADDITIONAL_INFO` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `userpluscount`
-- (See below for the actual view)
--
CREATE TABLE `userpluscount` (
`UsersPLus` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `userrolecount`
-- (See below for the actual view)
--
CREATE TABLE `userrolecount` (
`ROLE_NAME` varchar(225)
,`UserCount` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `REG_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
  `ROLEID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `USERNAME`, `PASSWORD`, `REG_DATE`, `ROLEID`) VALUES
(9, 'admin', '$2y$10$hoGWLeH2o8NStsdNiQIY/uULn9yKD87AHekhz3AlmMY9YUFs6OSJy', '2024-11-19 12:53:49', 1),
(10, 'userp', '$2y$10$QUcbhJfI6WSxAJRElivtfOayKzSkb0Gq4.mtmR663S/xUaUE5wEpi', '2024-11-19 12:54:14', 3),
(11, 'user', '$2y$10$2TjhvboJ.O0E2uWTprwoB.7pbu9Gm9ZZJLgSYsiLlLGX9tdJMBTTi', '2024-11-19 12:54:28', 3),
(13, '123', '$2y$10$.pWls8dDODTVoXnr7TO8V.jX8ngPZMv9gheGBVg8hPCJ09kbzRO7C', '2024-11-19 18:37:58', 3),
(19, 'DNL1', '$2y$10$r2GS2Em/H9Dwz2nU9eXOx.D6YaDvCNEzOBW7XVjfM52W390M6Ysxm', '2024-11-20 14:22:15', 3),
(20, 'DNL2', '$2y$10$BfLja3OgNknYvYTkBQyD0uivkiHd5/ucdtnxVnBwrNLIpccbxFiNm', '2024-11-20 14:22:20', 2),
(21, 'DNL3', '$2y$10$Th6YHk4cZZ6dTHHMSuPN9.x7WIRfIZjn4JwZkdzCxFZaYQenPWiFK', '2024-11-20 14:22:25', 2),
(22, 'DNL4', '$2y$10$oPw5ZpT92.hQo92JoaxvHOnEZyRfVgEoY5DlRwynonaheDHF6nNmm', '2024-11-20 14:22:29', 2),
(23, 'DNL5', '$2y$10$iwZljXB6O3Ili807Rk7dQuAm6he5TMzW.vh9ynJzZ.dI7c/cuGPDu', '2024-11-20 14:22:35', 2),
(24, 'DNL6', '$2y$10$Ri7hRucz6an6FBtyxyPjGegdi5MtADrDdO8GAh89bdl2pXllUJenm', '2024-11-20 14:22:39', 2),
(25, 'DNL7', '$2y$10$TSVdoRuWNgsaTJDYezs5M.opfHUAmJ8Z4cqhW23LAFQm0tlCFVcuq', '2024-11-20 14:22:42', 2),
(28, 'DNL8', '$2y$10$Vj7JIUpjsyd5qeAcvsezTOB4BlR1GhdtDizYQ/qEfx5IRWBo4tria', '2024-11-20 14:23:29', 2),
(29, 'DNL9', '$2y$10$K3G0PBZbJJoWqInwjrYPveygE7w/kF4ohvx3c/LUmxzHq4AfDPTS6', '2024-11-20 14:23:34', 2),
(30, 'DNL10', '$2y$10$jRQEGHemFCtcrS.wNYS5k.hMD39qTD7XQeEq0S7iRiTNzH.DO5v5q', '2024-11-20 14:23:54', 2),
(31, 'DNL11', '$2y$10$Xrve1Oo.Qzx2i7r4H252JuxJlV0iWmINADS2QRBmYpWnTDCcAiQz.', '2024-11-20 14:24:07', 2),
(32, 'DNL12', '$2y$10$doKCDGV4RxC7yalfXWgpWO4B7M1AC5qLk2DE7BC2VOGK5HSkYs5wC', '2024-11-20 14:24:10', 2),
(33, 'DNL13', '$2y$10$mLxgGAl5.RGaky1ObHsMKObEvZf7JvPki1QgUdR9VhWuoGiTXB9V.', '2024-11-20 14:24:19', 2),
(34, 'DNL14', '$2y$10$u10LgCzUYQF8uIyledl05ed8wlk.twB5Y6pJHlUIcaq4Pbn2jScDS', '2024-11-20 14:24:30', 2),
(35, 'DNL15', '$2y$10$08gasTflD.J0CQYmaXAto.i2IDUexj.oFrBElXyPyS10m6ceya2Tq', '2024-11-20 14:24:33', 2),
(36, 'DNL16', '$2y$10$9WZTZ4ccORSXFvSsPRKyF.Ay0ZXbUNIUVbaqn..xEIrmLfCBIaUPO', '2024-11-20 14:24:36', 2),
(37, 'DNL17', '$2y$10$yXMGNB5DN8DtMXw2gERnWOuQ2G4Q30Jl6BIyPp13XzDGhwQSY2j7C', '2024-11-20 14:24:38', 2),
(38, 'DNL18', '$2y$10$bWsMPkZWm9UlpolqbsjMLueOCBea2UVYPs2WzqeWDOcX95D26apB2', '2024-11-20 14:24:58', 2),
(39, 'DNL19', '$2y$10$rVXqG2YSE.LqnxiyH824BuZNcAV0rtVw5zJ1k5PKtTSsxKxZZTnya', '2024-11-20 14:25:13', 2),
(40, 'DNL20', '$2y$10$Bx7DmoCUreTuV6/0nB8ZEeptqULxtx59nJZqQpCLSL4pDZ.p4X8JC', '2024-11-20 14:25:17', 2),
(41, 'DNL21', '$2y$10$6JoJrQwZbKJ5Q/2fUNKP.uc51qUHKRF/Y/Vl/3JGf9raZ8hMDGQWG', '2024-11-20 14:25:22', 2),
(42, 'DNL22', '$2y$10$aaFxbsg6o6Czl.888.l9UOBH56XLd0.FuqZJFnMnZ6cqCZy4b/WbK', '2024-11-20 14:25:25', 2),
(44, 'DNL25', '$2y$10$gIDVztADgSskrCB7lE9rOub1VFhej3qtbk7zyBqloqqZKsF.yXe7i', '2024-11-20 14:25:47', 2),
(45, 'DNL23', '$2y$10$njEMMtvpFrcTK5JuJzdaxOPO9KqhjJ5/NOU3QN/U5g607lA0sRYNW', '2024-11-20 14:26:06', 2),
(46, 'DNL24', '$2y$10$3k3.C.0LEXhUSxEmqoP1weuFTnDVPqlQsRZiVR0u1UsrX4bVfc95i', '2024-11-20 14:26:10', 2),
(47, 'DNL26', '$2y$10$DEz0qmr5xPUZAObO4k2an.WKe2M4k1EjdMTHkl6dBWOBlwEUwnHRK', '2024-11-27 10:06:04', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `USER_ID` int(11) NOT NULL,
  `ADDITIONAL_INFO` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`USER_ID`, `ADDITIONAL_INFO`) VALUES
(10, 'userp@mail.com'),
(11, '123@gmail.com'),
(12, 'kaperzagloba22@gmail.com'),
(13, 'kaperzagloba22@gmail.com'),
(19, 'losowygmail@gmail.com'),
(47, 'losowygmail@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_ranks`
--

CREATE TABLE `user_ranks` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `RANK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_ranks`
--

INSERT INTO `user_ranks` (`ID`, `USER_ID`, `RANK`) VALUES
(1, 9, 1000000),
(4, 18, 24),
(5, 19, 23),
(6, 20, 22),
(7, 21, 21),
(8, 22, 20),
(9, 23, 19),
(10, 24, 18),
(11, 25, 17),
(12, 28, 16),
(13, 29, 15),
(14, 30, 14),
(15, 31, 13),
(16, 32, 12),
(17, 33, 11),
(18, 34, 10),
(19, 35, 9),
(20, 36, 8),
(21, 37, 7),
(22, 38, 6),
(23, 39, 5),
(24, 40, 4),
(25, 41, 3),
(26, 42, 2),
(27, 45, 1),
(28, 46, 24),
(29, 44, 0),
(0, 47, 0);

-- --------------------------------------------------------

--
-- Table structure for table `visit_counts`
--

CREATE TABLE `visit_counts` (
  `ID` int(11) NOT NULL,
  `USERID` int(11) NOT NULL,
  `last_visit` datetime DEFAULT NULL,
  `visit_count` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visit_counts`
--

INSERT INTO `visit_counts` (`ID`, `USERID`, `last_visit`, `visit_count`) VALUES
(1, 9, '2024-11-28 13:09:29', 10000001),
(8, 19, '2024-11-28 11:45:03', 232),
(9, 20, '2024-11-20 16:26:57', 220),
(10, 21, '2024-11-20 16:27:01', 210),
(11, 22, '2024-11-20 16:27:05', 200),
(12, 23, '2024-11-20 16:27:09', 190),
(13, 24, '2024-11-20 16:27:13', 180),
(14, 25, '2024-11-20 16:27:22', 170),
(15, 28, '2024-11-20 16:27:26', 160),
(16, 29, '2024-11-20 16:27:34', 150),
(17, 30, '2024-11-20 16:27:46', 140),
(18, 31, '2024-11-29 13:26:20', 131),
(19, 32, '2024-11-20 16:27:56', 120),
(20, 33, '2024-11-20 16:28:00', 110),
(21, 34, '2024-11-20 16:28:04', 100),
(22, 35, '2024-11-20 16:28:08', 90),
(23, 36, '2024-11-20 16:28:11', 80),
(24, 37, '2024-11-20 16:28:14', 70),
(25, 38, '2024-11-20 16:28:21', 60),
(26, 39, '2024-11-20 16:28:25', 50),
(27, 40, '2024-11-20 16:28:40', 40),
(28, 41, '2024-11-20 16:28:43', 30),
(29, 42, '2024-11-20 16:28:47', 20),
(30, 45, '2024-11-20 16:28:52', 10),
(31, 46, '2024-11-27 10:15:32', 241),
(32, 44, '2024-11-20 16:28:59', 1),
(33, 47, '2024-11-27 11:06:07', 1);

-- --------------------------------------------------------

--
-- Structure for view `administratorcount`
--
DROP TABLE IF EXISTS `administratorcount`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `administratorcount`  AS SELECT count(`u`.`ID`) AS `Administrator` FROM `users` AS `u` WHERE `u`.`ROLEID` = '1' ;

-- --------------------------------------------------------

--
-- Structure for view `championsabilities`
--
DROP TABLE IF EXISTS `championsabilities`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `championsabilities`  AS SELECT `c`.`NAME` AS `NAME`, `ac`.`NAME` AS `ability_c`, `ae`.`NAME` AS `ability_e`, `aq`.`NAME` AS `ability_q`, `ax`.`NAME` AS `ability_x` FROM ((((`champs` `c` join `ability_c` `ac` on(`c`.`ABILITY_C` = `ac`.`ID`)) join `ability_e` `ae` on(`c`.`ABILITY_E` = `ae`.`ID`)) join `ability_q` `aq` on(`c`.`ABILITY_Q` = `aq`.`ID`)) join `ability_x` `ax` on(`c`.`ABILITY_X` = `ax`.`ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `tipscount`
--
DROP TABLE IF EXISTS `tipscount`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tipscount`  AS SELECT count(`t`.`TIPID`) AS `Tips` FROM `tips` AS `t` WHERE `t`.`DESCRIPTION` is not null ;

-- --------------------------------------------------------

--
-- Structure for view `userinfo`
--
DROP TABLE IF EXISTS `userinfo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userinfo`  AS SELECT `u`.`USERNAME` AS `USERNAME`, `uf`.`ADDITIONAL_INFO` AS `ADDITIONAL_INFO` FROM (`users` `u` join `user_info` `uf` on(`u`.`ID` = `uf`.`USER_ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `userpluscount`
--
DROP TABLE IF EXISTS `userpluscount`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userpluscount`  AS SELECT count(`u`.`ID`) AS `UsersPLus` FROM (`users` `u` join `user_info` `ui` on(`u`.`ID` = `ui`.`USER_ID`)) WHERE `ui`.`ADDITIONAL_INFO` is not null ;

-- --------------------------------------------------------

--
-- Structure for view `userrolecount`
--
DROP TABLE IF EXISTS `userrolecount`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userrolecount`  AS SELECT `r`.`ROLE_NAME` AS `ROLE_NAME`, count(`u`.`ID`) AS `UserCount` FROM (`roles` `r` left join `users` `u` on(`r`.`ROLEID` = `u`.`ROLEID`)) GROUP BY `r`.`ROLE_NAME` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ability_c`
--
ALTER TABLE `ability_c`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`);

--
-- Indexes for table `ability_e`
--
ALTER TABLE `ability_e`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`);

--
-- Indexes for table `ability_q`
--
ALTER TABLE `ability_q`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`);

--
-- Indexes for table `ability_x`
--
ALTER TABLE `ability_x`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`);

--
-- Indexes for table `bronie`
--
ALTER TABLE `bronie`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `champs`
--
ALTER TABLE `champs`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`),
  ADD KEY `ROLE` (`ROLE`),
  ADD KEY `ABILITY_C` (`ABILITY_C`),
  ADD KEY `ABILITY_E` (`ABILITY_E`),
  ADD KEY `ABILITY_Q` (`ABILITY_Q`),
  ADD KEY `ABILITY_X` (`ABILITY_X`);

--
-- Indexes for table `champ_roles`
--
ALTER TABLE `champ_roles`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ROLE_NAME` (`ROLE_NAME`);

--
-- Indexes for table `clips`
--
ALTER TABLE `clips`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `USERID` (`USERID`);

--
-- Indexes for table `crosshairs`
--
ALTER TABLE `crosshairs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `USERID` (`USERID`);

--
-- Indexes for table `profilepics`
--
ALTER TABLE `profilepics`
  ADD PRIMARY KEY (`USERID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ROLEID`),
  ADD UNIQUE KEY `ROLE_NAME` (`ROLE_NAME`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `USERNAME` (`USERNAME`),
  ADD KEY `ROLEID` (`ROLEID`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD UNIQUE KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `visit_counts`
--
ALTER TABLE `visit_counts`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `USERID` (`USERID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ability_c`
--
ALTER TABLE `ability_c`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `ability_e`
--
ALTER TABLE `ability_e`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `ability_q`
--
ALTER TABLE `ability_q`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `ability_x`
--
ALTER TABLE `ability_x`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `bronie`
--
ALTER TABLE `bronie`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `champs`
--
ALTER TABLE `champs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `champ_roles`
--
ALTER TABLE `champ_roles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `clips`
--
ALTER TABLE `clips`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `crosshairs`
--
ALTER TABLE `crosshairs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `ROLEID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `visit_counts`
--
ALTER TABLE `visit_counts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clips`
--
ALTER TABLE `clips`
  ADD CONSTRAINT `clips_ibfk_1` FOREIGN KEY (`USERID`) REFERENCES `users` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `crosshairs`
--
ALTER TABLE `crosshairs`
  ADD CONSTRAINT `crosshairs_ibfk_1` FOREIGN KEY (`USERID`) REFERENCES `users` (`ID`);

--
-- Constraints for table `profilepics`
--
ALTER TABLE `profilepics`
  ADD CONSTRAINT `profilepics_ibfk_1` FOREIGN KEY (`USERID`) REFERENCES `users` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `visit_counts`
--
ALTER TABLE `visit_counts`
  ADD CONSTRAINT `visit_counts_ibfk_1` FOREIGN KEY (`USERID`) REFERENCES `users` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
