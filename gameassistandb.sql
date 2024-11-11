-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Lis 11, 2024 at 06:44 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

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
-- Struktura tabeli dla tabeli `ability_c`
--

CREATE TABLE `ability_c` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  `SHOWCASE` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ability_e`
--

CREATE TABLE `ability_e` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  `SHOWCASE` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ability_q`
--

CREATE TABLE `ability_q` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  `SHOWCASE` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ability_x`
--

CREATE TABLE `ability_x` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  `SHOWCASE` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `administratorcount`
-- (See below for the actual view)
--
CREATE TABLE `administratorcount` (
`Administrator` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `championsabilities`
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
-- Struktura tabeli dla tabeli `champs`
--

CREATE TABLE `champs` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  `ROLE` int(11) NOT NULL,
  `ABILITY_C` int(11) NOT NULL,
  `ABILITY_E` int(11) NOT NULL,
  `ABILITY_Q` int(11) NOT NULL,
  `ABILITY_X` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `champ_roles`
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
-- Struktura tabeli dla tabeli `global_visit_count`
--

CREATE TABLE `global_visit_count` (
  `total_visits` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `global_visit_count`
--

INSERT INTO `global_visit_count` (`total_visits`) VALUES
(47);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `profilepics`
--

CREATE TABLE `profilepics` (
  `USERID` int(11) NOT NULL,
  `PROFILEPICFILE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profilepics`
--

INSERT INTO `profilepics` (`USERID`, `PROFILEPICFILE`) VALUES
(7, 'uploads/672e59a87fc466.16850363.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `roles`
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
-- Struktura tabeli dla tabeli `tips`
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
-- Zastąpiona struktura widoku `tipscount`
-- (See below for the actual view)
--
CREATE TABLE `tipscount` (
`Tips` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `userinfo`
-- (See below for the actual view)
--
CREATE TABLE `userinfo` (
`USERNAME` varchar(50)
,`ADDITIONAL_INFO` text
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `userpluscount`
-- (See below for the actual view)
--
CREATE TABLE `userpluscount` (
`UsersPLus` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `userrolecount`
-- (See below for the actual view)
--
CREATE TABLE `userrolecount` (
`ROLE_NAME` varchar(225)
,`UserCount` bigint(21)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
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
(7, 'Skyeo', '$2y$10$JkZCxqoA5xau.h6LcSBW2eaKny7lurN7Ew.2cT2LonTv.y0xwmxoS', '2024-11-08 18:34:10', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_info`
--

CREATE TABLE `user_info` (
  `USER_ID` int(11) NOT NULL,
  `ADDITIONAL_INFO` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`USER_ID`, `ADDITIONAL_INFO`) VALUES
(7, 'kaperzagloba22@gmail.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `visit_counts`
--

CREATE TABLE `visit_counts` (
  `USERID` int(11) NOT NULL,
  `last_visit` datetime DEFAULT NULL,
  `visit_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visit_counts`
--

INSERT INTO `visit_counts` (`USERID`, `last_visit`, `visit_count`) VALUES
(7, '2024-11-08 19:45:34', 1);

-- --------------------------------------------------------

--
-- Struktura widoku `administratorcount`
--
DROP TABLE IF EXISTS `administratorcount`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `administratorcount`  AS SELECT count(`u`.`ID`) AS `Administrator` FROM `gadb_test`.`users` AS `u` WHERE `u`.`ROLEID` = '1' ;

-- --------------------------------------------------------

--
-- Struktura widoku `championsabilities`
--
DROP TABLE IF EXISTS `championsabilities`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `championsabilities`  AS SELECT `c`.`NAME` AS `NAME`, `ac`.`NAME` AS `ability_c`, `ae`.`NAME` AS `ability_e`, `aq`.`NAME` AS `ability_q`, `ax`.`NAME` AS `ability_x` FROM ((((`gadb_test`.`champs` `c` join `gadb_test`.`ability_c` `ac` on(`c`.`ABILITY_C` = `ac`.`ID`)) join `gadb_test`.`ability_e` `ae` on(`c`.`ABILITY_E` = `ae`.`ID`)) join `gadb_test`.`ability_q` `aq` on(`c`.`ABILITY_Q` = `aq`.`ID`)) join `gadb_test`.`ability_x` `ax` on(`c`.`ABILITY_X` = `ax`.`ID`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `tipscount`
--
DROP TABLE IF EXISTS `tipscount`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tipscount`  AS SELECT count(`t`.`TIPID`) AS `Tips` FROM `tips` AS `t` WHERE `t`.`DESCRIPTION` is not null ;

-- --------------------------------------------------------

--
-- Struktura widoku `userinfo`
--
DROP TABLE IF EXISTS `userinfo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userinfo`  AS SELECT `u`.`USERNAME` AS `USERNAME`, `uf`.`ADDITIONAL_INFO` AS `ADDITIONAL_INFO` FROM (`users` `u` join `user_info` `uf` on(`u`.`ID` = `uf`.`USER_ID`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `userpluscount`
--
DROP TABLE IF EXISTS `userpluscount`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userpluscount`  AS SELECT count(`u`.`ID`) AS `UsersPLus` FROM (`users` `u` join `user_info` `ui` on(`u`.`ID` = `ui`.`USER_ID`)) WHERE `ui`.`ADDITIONAL_INFO` is not null ;

-- --------------------------------------------------------

--
-- Struktura widoku `userrolecount`
--
DROP TABLE IF EXISTS `userrolecount`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userrolecount`  AS SELECT `r`.`ROLE_NAME` AS `ROLE_NAME`, count(`u`.`ID`) AS `UserCount` FROM (`roles` `r` left join `users` `u` on(`r`.`ROLEID` = `u`.`ROLEID`)) GROUP BY `r`.`ROLE_NAME` ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `ability_c`
--
ALTER TABLE `ability_c`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`);

--
-- Indeksy dla tabeli `ability_e`
--
ALTER TABLE `ability_e`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`);

--
-- Indeksy dla tabeli `ability_q`
--
ALTER TABLE `ability_q`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`);

--
-- Indeksy dla tabeli `ability_x`
--
ALTER TABLE `ability_x`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`);

--
-- Indeksy dla tabeli `champs`
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
-- Indeksy dla tabeli `champ_roles`
--
ALTER TABLE `champ_roles`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ROLE_NAME` (`ROLE_NAME`);

--
-- Indeksy dla tabeli `profilepics`
--
ALTER TABLE `profilepics`
  ADD PRIMARY KEY (`USERID`);

--
-- Indeksy dla tabeli `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ROLEID`),
  ADD UNIQUE KEY `ROLE_NAME` (`ROLE_NAME`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `USERNAME` (`USERNAME`),
  ADD KEY `ROLEID` (`ROLEID`);

--
-- Indeksy dla tabeli `user_info`
--
ALTER TABLE `user_info`
  ADD UNIQUE KEY `USER_ID` (`USER_ID`);

--
-- Indeksy dla tabeli `visit_counts`
--
ALTER TABLE `visit_counts`
  ADD PRIMARY KEY (`USERID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ability_c`
--
ALTER TABLE `ability_c`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ability_e`
--
ALTER TABLE `ability_e`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ability_q`
--
ALTER TABLE `ability_q`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ability_x`
--
ALTER TABLE `ability_x`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `champs`
--
ALTER TABLE `champs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `champ_roles`
--
ALTER TABLE `champ_roles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `ROLEID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `champs`
--
ALTER TABLE `champs`
  ADD CONSTRAINT `champs_ibfk_1` FOREIGN KEY (`ROLE`) REFERENCES `champ_roles` (`ID`),
  ADD CONSTRAINT `champs_ibfk_2` FOREIGN KEY (`ABILITY_C`) REFERENCES `ability_c` (`ID`),
  ADD CONSTRAINT `champs_ibfk_3` FOREIGN KEY (`ABILITY_E`) REFERENCES `ability_e` (`ID`),
  ADD CONSTRAINT `champs_ibfk_4` FOREIGN KEY (`ABILITY_Q`) REFERENCES `ability_q` (`ID`),
  ADD CONSTRAINT `champs_ibfk_5` FOREIGN KEY (`ABILITY_X`) REFERENCES `ability_x` (`ID`);

--
-- Constraints for table `profilepics`
--
ALTER TABLE `profilepics`
  ADD CONSTRAINT `profilepics_ibfk_1` FOREIGN KEY (`USERID`) REFERENCES `users` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`ROLEID`) REFERENCES `roles` (`ROLEID`);

--
-- Constraints for table `user_info`
--
ALTER TABLE `user_info`
  ADD CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `visit_counts`
--
ALTER TABLE `visit_counts`
  ADD CONSTRAINT `visit_counts_ibfk_1` FOREIGN KEY (`USERID`) REFERENCES `users` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
