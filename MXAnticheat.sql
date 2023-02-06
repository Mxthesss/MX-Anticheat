CREATE TABLE IF NOT EXISTS `mxanticheatbans` (
  `name` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `steamid` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `ip` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `license` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `token` varchar(130) COLLATE utf8mb4_bin DEFAULT NULL,
  `token2` varchar(95) COLLATE utf8mb4_bin NOT NULL,
  `token3` varchar(95) COLLATE utf8mb4_bin NOT NULL,
  `token4` varchar(95) COLLATE utf8mb4_bin NOT NULL,
  `token5` varchar(95) COLLATE utf8mb4_bin NOT NULL,
  `token6` varchar(95) COLLATE utf8mb4_bin NOT NULL,
  `token7` varchar(95) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`steamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;