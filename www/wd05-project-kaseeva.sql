-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 27 2019 г., 17:33
-- Версия сервера: 5.6.41
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `wd05-project-kaseeva`
--

-- --------------------------------------------------------

--
-- Структура таблицы `about`
--

CREATE TABLE `about` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `about`
--

INSERT INTO `about` (`id`, `name`, `description`) VALUES
(1, 'Егор Казаков', 'Я веб-разработчик');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `role` varchar(191) DEFAULT NULL,
  `username` varchar(191) DEFAULT NULL,
  `lastname` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `avatar_small` varchar(191) DEFAULT NULL,
  `recovery_code` varchar(191) DEFAULT NULL,
  `recovery_code_times` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `username`, `lastname`, `city`, `country`, `avatar`, `avatar_small`, `recovery_code`, `recovery_code_times`) VALUES
(10, 'nat@gmail.ru', '$2y$10$8ALjeIBDitX6j3FsVDE8sujlYe/Kyn6WOwukRfXx1PCiV6u8EKmCC', 'admin', 'Natalia', 'Kaseeva', 'Moscow', 'Russia', '686146683.jpg', '48-686146683.jpg', NULL, NULL),
(11, 'nat@yandex.ru', '$2y$10$qowNnz1tbT0gVzRpouDdoe2v7s9GymxNaVxIvHonBF9a/Jnjz3iQO', 'user', 'Emelian', 'Kasakov', 'Kazan', 'Russia', '6987362.jpg', '48-6987362.jpg', 'GSiOocIfv1xtHae', 0),
(12, 'nat1@gmail.ru', '$2y$10$eoa6qDB7ph4eGdWnDlOH0eaXGIYKX5.KpMdXGCxwWW5XWqogp0zHu', 'user', 'Natalia2', 'Kaseeva2', '', '', '515719382.jpg', '48-515719382.jpg', 'Q35GHWgkdwfs2xL', 0),
(15, 'nat@mail.ru', '$2y$10$D48HvcjnN1902YDtJ53kC.bfcpwo.6UEne6cZCsGq7FTNhEw0ac4m', 'user', NULL, NULL, NULL, NULL, NULL, NULL, 'yXZwfqtEmHuixbW', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `about`
--
ALTER TABLE `about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
