-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 06 2019 г., 12:25
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
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `cat_title` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `cat_title`) VALUES
(3, 'Путешествия'),
(8, 'Покупки'),
(9, 'php'),
(15, 'html5'),
(16, 'html');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_520_ci,
  `data_time` datetime DEFAULT NULL,
  `author_id` int(11) UNSIGNED DEFAULT NULL,
  `post_img` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `post_img_small` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `cat` int(11) UNSIGNED DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `text`, `data_time`, `author_id`, `post_img`, `post_img_small`, `cat`, `update_time`) VALUES
(14, 'Что я делал в долине', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias, enim illo ipsum amet ad necessitatibus tempore suscipit fuga magni officiis iste atque optio, harum veniam, assumenda placeat quaerat. Adipisci voluptate harum maiores, nobis, eveniet architecto dolorem autem magni veniam fugiat nulla quos officiis, omnis exercitationem optio quisquam voluptatem nihil illum quas, repellat. Omnis possimus cupiditate, maiores deleniti assumenda laudantium ducimus repudiandae, provident soluta pariatur id error. Quod veniam accusantium esse quasi fugiat reiciendis beatae itaque omnis repellendus illum dolor id expedita aperiam, debitis voluptatibus placeat quos adipisci quidem ut assumenda explicabo! Fugit quasi reprehenderit est, incidunt quae maxime cum eveniet!', '2019-01-30 21:01:19', 10, '851876831.jpg', '320-851876831.jpg', NULL, NULL),
(15, 'Как я ходил в поход этим летом', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias, enim illo ipsum amet ad necessitatibus tempore suscipit fuga magni officiis iste atque optio, harum veniam, assumenda placeat quaerat. Adipisci voluptate harum maiores, nobis, eveniet architecto dolorem autem magni veniam fugiat nulla quos officiis, omnis exercitationem optio quisquam voluptatem nihil illum quas, repellat. Omnis possimus cupiditate, maiores deleniti assumenda laudantium ducimus repudiandae, provident soluta pariatur id error. Quod veniam accusantium esse quasi fugiat reiciendis beatae itaque omnis repellendus illum dolor id expedita aperiam, debitis voluptatibus placeat quos adipisci quidem ut assumenda explicabo! Fugit quasi reprehenderit est, incidunt quae maxime cum eveniet!', '2019-01-30 21:04:11', 10, '195608520.jpg', '320-195608520.jpg', NULL, NULL),
(16, 'Поездка в New York пример длинного названия поста', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias, enim illo ipsum amet ad necessitatibus tempore suscipit fuga magni officiis iste atque optio, harum veniam, assumenda placeat quaerat. Adipisci voluptate harum maiores, nobis, eveniet architecto dolorem autem magni veniam fugiat nulla quos officiis, omnis exercitationem optio quisquam voluptatem nihil illum quas, repellat. Omnis possimus cupiditate, maiores deleniti assumenda laudantium ducimus repudiandae, provident soluta pariatur id error. Quod veniam accusantium esse quasi fugiat reiciendis beatae itaque omnis repellendus illum dolor id expedita aperiam, debitis voluptatibus placeat quos adipisci quidem ut assumenda explicabo! Fugit quasi reprehenderit est, incidunt quae maxime cum eveniet!', '2019-01-30 21:05:17', 10, '170202636.jpg', '320-170202636.jpg', NULL, NULL),
(17, 'Поездка в New York пример длинного названия поста', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias, enim illo ipsum amet ad necessitatibus tempore suscipit fuga magni officiis iste atque optio, harum veniam, assumenda placeat quaerat. Adipisci voluptate harum maiores, nobis, eveniet architecto dolorem autem magni veniam fugiat nulla quos officiis, omnis exercitationem optio quisquam voluptatem nihil illum quas, repellat. Omnis possimus cupiditate, maiores deleniti assumenda laudantium ducimus repudiandae, provident soluta pariatur id error. Quod veniam accusantium esse quasi fugiat reiciendis beatae itaque omnis repellendus illum dolor id expedita aperiam, debitis voluptatibus placeat quos adipisci quidem ut assumenda explicabo! Fugit quasi reprehenderit est, incidunt quae maxime cum eveniet!', '2019-01-30 21:05:30', 10, '171026611.jpg', '320-171026611.jpg', NULL, NULL),
(18, 'Что я делал в долине', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias, enim illo ipsum amet ad necessitatibus tempore suscipit fuga magni officiis iste atque optio, harum veniam, assumenda placeat quaerat. Adipisci voluptate harum maiores, nobis, eveniet architecto dolorem autem magni veniam fugiat nulla quos officiis, omnis exercitationem optio quisquam voluptatem nihil illum quas, repellat. Omnis possimus cupiditate, maiores deleniti assumenda laudantium ducimus repudiandae, provident soluta pariatur id error. Quod veniam accusantium esse quasi fugiat reiciendis beatae itaque omnis repellendus illum dolor id expedita aperiam, debitis voluptatibus placeat quos adipisci quidem ut assumenda explicabo! Fugit quasi reprehenderit est, incidunt quae maxime cum eveniet!', '2019-01-30 21:06:16', 10, '840341186.jpg', '320-840341186.jpg', NULL, NULL),
(19, 'Как я ходил в поход этим летом', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias, enim illo ipsum amet ad necessitatibus tempore suscipit fuga magni officiis iste atque optio, harum veniam, assumenda placeat quaerat. Adipisci voluptate harum maiores, nobis, eveniet architecto dolorem autem magni veniam fugiat nulla quos officiis, omnis exercitationem optio quisquam voluptatem nihil illum quas, repellat. Omnis possimus cupiditate, maiores deleniti assumenda laudantium ducimus repudiandae, provident soluta pariatur id error. Quod veniam accusantium esse quasi fugiat reiciendis beatae itaque omnis repellendus illum dolor id expedita aperiam, debitis voluptatibus placeat quos adipisci quidem ut assumenda explicabo! Fugit quasi reprehenderit est, incidunt quae maxime cum eveniet!', '2019-01-30 21:06:47', 10, '497402954.jpg', '320-497402954.jpg', NULL, NULL),
(20, 'Поездка в New York пример длинного названия поста', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias, enim illo ipsum amet ad necessitatibus tempore suscipit fuga magni officiis iste atque optio, harum veniam, assumenda placeat quaerat. Adipisci voluptate harum maiores, nobis, eveniet architecto dolorem autem magni veniam fugiat nulla quos officiis, omnis exercitationem optio quisquam voluptatem nihil illum quas, repellat. Omnis possimus cupiditate, maiores deleniti assumenda laudantium ducimus repudiandae, provident soluta pariatur id error. Quod veniam accusantium esse quasi fugiat reiciendis beatae itaque omnis repellendus illum dolor id expedita aperiam, debitis voluptatibus placeat quos adipisci quidem ut assumenda explicabo! Fugit quasi reprehenderit est, incidunt quae maxime cum eveniet!', '2019-01-30 21:07:09', 10, '904830932.jpg', '320-904830932.jpg', NULL, NULL),
(22, 'Поездка в New York пример длинного названия поста', '<p>ffhtytrerwrwr</p>\r\n', '2019-01-31 13:14:40', 10, NULL, NULL, 9, '2019-02-06 11:44:03'),
(37, 'Lorem ipsum dolor sit amet.', '<h2 style=\"font-style:italic\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quasi sit culpa nostrum, iste, repellat quae corrupti qui et ea eos asperiores! Excepturi a, quidem, minus eius nisi odio pariatur tempore aliquam deserunt mollitia rem perspiciatis porro molestias omnis laudantium eos, ad. Libero provident asperiores, qui corporis cumque assumenda officiis numquam.</h2>\r\n', '2019-02-06 12:17:58', 10, '990853881.jpg', '320-990853881.jpg', 8, '2019-02-06 12:18:32');

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
  `city` varchar(191) NOT NULL,
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
(10, 'nat@gmail.com', '$2y$10$8ALjeIBDitX6j3FsVDE8sujlYe/Kyn6WOwukRfXx1PCiV6u8EKmCC', 'admin', 'Natalia', 'Kaseeva', 'Moscow', 'Russia', '686146683.jpg', '48-686146683.jpg', NULL, NULL),
(11, 'nat@yandex.ru', '$2y$10$qowNnz1tbT0gVzRpouDdoe2v7s9GymxNaVxIvHonBF9a/Jnjz3iQO', 'user', 'Emelian', 'Kasakov', 'Kazan', 'Russia', '6987362.jpg', '48-6987362.jpg', 'GSiOocIfv1xtHae', 0),
(16, 'nat@yandex.com', '$2y$10$RBDs.lo6zycJwnRuGGkSZuAb7dWlX.wnVzWjxDli/YRTE1fHd3TO6', 'user', NULL, NULL, '', '', NULL, NULL, NULL, NULL),
(17, 'nat@gmail.ru', '$2y$10$f0kaes/KqBrxxCwSCGi6V.3f4pXXdF9rt41IH6YKIpeYspflvHDYG', 'user', NULL, NULL, '', '', NULL, NULL, NULL, NULL),
(19, 'nat1@gmail.ru', '$2y$10$H0.Uvx3JzhYT7tbEwWmubuwR5TjdntVwlL3iAl2AoOdBFbWliDuEC', 'user', 'Natalia2', 'Kaseeva2', 'Moscow', '', NULL, NULL, NULL, NULL),
(20, 'nat3333@yandex.ru', '$2y$10$GC9pZYfZJsyjJibruItWb.JlI/xJSnlj/AS2jHc2ixmwnLRbzL5rG', 'admin', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL),
(23, 'nat@mail.ru', '$2y$10$Z2HZv0H8gDXLpZeqLGQy7uyyjpv.E5xxdlRDqK7bRXqvwPs/dIGh.', 'user', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_posts_author` (`author_id`);

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
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
