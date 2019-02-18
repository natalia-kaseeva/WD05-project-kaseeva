-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 18 2019 г., 11:22
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
  `id` int(11) UNSIGNED NOT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `about`
--

INSERT INTO `about` (`id`, `firstname`, `lastname`, `description`, `photo`) VALUES
(1, 'Наталья', 'Касеева', '<p><strong>Я веб разработчик из Москвы!&nbsp;Мне 27 лет.</strong></p>\r\n\r\n<p><em>Занимаюсь разработкой современных сайтов и приложений,&nbsp;мне нравится делать интересные и современные проекты.</em></p>\r\n\r\n<p><em>Этот сайт я сделала&nbsp;в рамках обучения в школе онлайн обучения WebCademy. Чуть позже освежу в нем свой контент. А пока посмотрите, как тут все классно и красиво!</em></p>\r\n\r\n<p><em>Меня привлекает Frontend разработка, это не только моя работа, но и хобби. Также&nbsp; могу решать несложные задачи на Backend,&nbsp;использую современный workflow, работаю с репозиториями git и сборкой проекта на gulp.</em></p>\r\n', '1326070076.jpg');

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
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) UNSIGNED NOT NULL,
  `post_id` int(11) UNSIGNED DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `text` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `text`, `date_time`) VALUES
(1, 37, 10, 'new comment', '2019-02-07 11:58:46'),
(4, 37, 10, 'new2', '2019-02-07 12:01:45'),
(5, 19, 23, 'newnewnew', '2019-02-07 13:09:32'),
(6, 37, 10, 'lorem', '2019-02-07 13:14:15'),
(7, 15, 10, 'new id 15', '2019-02-07 13:15:09'),
(8, 22, 10, 'new comment', '2019-02-07 13:58:33'),
(9, 37, 23, 'new Egor', '2019-02-07 14:02:54');

-- --------------------------------------------------------

--
-- Структура таблицы `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `firstname` varchar(191) DEFAULT NULL,
  `lastname` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` double DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `skype` varchar(191) DEFAULT NULL,
  `vkontakte` varchar(191) DEFAULT NULL,
  `facebook` varchar(191) DEFAULT NULL,
  `github` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `contacts`
--

INSERT INTO `contacts` (`id`, `firstname`, `lastname`, `email`, `phone`, `address`, `skype`, `vkontakte`, `facebook`, `github`, `twitter`) VALUES
(1, 'Наталья', 'Касеева', 'nat.kaseeva@gmail.com', 75555555555, 'Россия, Москва', '', 'https://vk.com/id27679449', 'https://www.facebook.com/natalia.kaseeva.5', 'https://github.com/natalia-kaseeva', '');

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) UNSIGNED NOT NULL,
  `period` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `jobs`
--

INSERT INTO `jobs` (`id`, `period`, `title`, `description`) VALUES
(7, 'июнь 2013 - август 2016', 'Специалист по безопасности полетов', 'Участие в разработке автоматизированной системы управления безопасностью полетов и предотвращения авиационных происшествий '),
(9, 'ноябрь 2018 - март 2019', 'Студент', 'Обучение в школе онлайн обучения WebCademy');

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `message_file_name_original` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `message_file` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `message`, `date_time`, `message_file_name_original`, `message_file`) VALUES
(21, 'Natalia', 'nat@gmail.ru', 'Hello!', '2019-02-12 10:19:28', 'PDO-PHP.docx', '153516890.docx'),
(22, 'Egor', 'nat@mail.ru', 'Hi', '2019-02-12 10:19:58', NULL, NULL),
(23, 'Egor', 'nat@mail.ru', 'Hi!', '2019-02-12 10:20:40', '320-170202636.jpg', '787489849.jpg');

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
  `cat` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
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
(22, 'Поездка в New York пример длинного названия поста', '<p>ffhtytrerwrwr</p>\r\n', '2019-01-31 13:14:40', 10, NULL, NULL, '9', '2019-02-06 11:44:03'),
(37, 'Lorem ipsum dolor sit amet.', '<h2 style=\"font-style:italic\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quasi sit culpa nostrum, iste, repellat quae corrupti qui et ea eos asperiores! Excepturi a, quidem, minus eius nisi odio pariatur tempore aliquam deserunt mollitia rem perspiciatis porro molestias omnis laudantium eos, ad. Libero provident asperiores, qui corporis cumque assumenda officiis numquam.</h2>\r\n', '2019-02-06 12:17:58', 10, '990853881.jpg', '320-990853881.jpg', '8', '2019-02-06 12:18:32'),
(51, 'Как я ходил в поход этим летом', '<p>mmmm</p>\r\n', '2019-02-16 17:08:24', 10, NULL, NULL, '8', '2019-02-16 17:08:30');

-- --------------------------------------------------------

--
-- Структура таблицы `skills`
--

CREATE TABLE `skills` (
  `id` int(11) UNSIGNED NOT NULL,
  `html` int(11) UNSIGNED DEFAULT NULL,
  `css` int(11) UNSIGNED DEFAULT NULL,
  `js` int(11) UNSIGNED DEFAULT NULL,
  `jquery` int(11) UNSIGNED DEFAULT NULL,
  `php` int(11) UNSIGNED DEFAULT NULL,
  `mysql` int(11) UNSIGNED DEFAULT NULL,
  `git` int(11) UNSIGNED DEFAULT NULL,
  `gulp` int(11) UNSIGNED DEFAULT NULL,
  `npm` int(11) UNSIGNED DEFAULT NULL,
  `yarn` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `skills`
--

INSERT INTO `skills` (`id`, `html`, `css`, `js`, `jquery`, `php`, `mysql`, `git`, `gulp`, `npm`, `yarn`) VALUES
(1, 90, 80, 60, 70, 50, 50, 70, 70, 80, 20);

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
(23, 'nat@mail.ru', '$2y$10$Z2HZv0H8gDXLpZeqLGQy7uyyjpv.E5xxdlRDqK7bRXqvwPs/dIGh.', 'user', 'Egor', 'Kasakov', '', '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `works`
--

CREATE TABLE `works` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_520_ci,
  `result` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `technologies` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `project` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `github` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `author_id` int(11) UNSIGNED DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `work_img` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `work_img_small` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `works`
--

INSERT INTO `works` (`id`, `title`, `text`, `result`, `technologies`, `project`, `github`, `author_id`, `date_time`, `work_img`, `work_img_small`, `update_time`) VALUES
(8, 'Верстка и frontend Интернет магазина', '<p>Сделана верстка и фронтэнд для интернет магазина мебели. Сверстано более 50-ти страниц. Сделаны все эффекты и интерактив. В работе использованы препроцессоры pug и less. Интерактив написан на JavaScript. Весь проект протестирован на своместимость, начиная с IE9. Для старых браузеров использован подход Graceful Degradation.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Время работы над проектом:</strong> 6 недель</p>\r\n\r\n<p><strong>Страниц сверстано:</strong> 52 страницы</p>\r\n\r\n<p><strong>Бюджет проекта:</strong> до 60 000 рублей</p>\r\n', '<p>Проект сделан в срок. Заказчик доволен. Сайт запущен, работает и уже радует покупками посетителей и владельцев бизнеса.</p>\r\n', '<ul>\r\n	<li>HTML5, CSS3.</li>\r\n	<li>JavaScript, jQuery.</li>\r\n	<li>LESS, PUG, Gulp, npm, bower.</li>\r\n</ul>\r\n', 'http://magnum-store.ru', 'https://github.com/pozitive/magnumstore/', 10, '2019-02-16 17:11:56', '656072998.jpg', '320-656072998.jpg', '2019-02-16 17:12:38'),
(12, 'Личная страница веб-разработчика', '<p>Выполнена верстка для личной страницы веб-разработчика. Сделаны все эффекты и интерактив.</p>\r\n', '', '<ul>\r\n	<li>HTML5, CSS3,</li>\r\n	<li>JavaScript, jQuery.</li>\r\n</ul>\r\n', 'http://nataliakas.zzz.com.ua/', '', 10, '2019-02-18 11:07:04', '461148071.jpg', '320-461148071.jpg', NULL),
(13, 'Личная страница веб-разработчика  ', '<p>Выполнена верстка для личной страницы веб-разработчика. Сделаны все эффекты и интерактив.</p>\r\n', '', '<ul>\r\n	<li>HTML5, CSS3,</li>\r\n	<li>JavaScript, jQuery.</li>\r\n</ul>\r\n', 'http://nataliakas.zzz.com.ua/', '', 10, '2019-02-18 11:12:41', '508279418.jpg', '320-508279418.jpg', NULL),
(14, 'Личная страница веб-разработчика  ', '<p>&nbsp;</p>\r\n\r\n<p>Выполнена верстка для личной страницы веб-разработчика. Сделаны все эффекты и интерактив.</p>\r\n', '', '<ul>\r\n	<li>HTML5, CSS3,</li>\r\n	<li>JavaScript, jQuery.</li>\r\n</ul>\r\n', 'http://nataliakas.zzz.com.ua/', '', 10, '2019-02-18 11:17:10', '264959716.jpg', '320-264959716.jpg', NULL),
(15, 'Личная страница веб-разработчика  ', '<p>&nbsp;</p>\r\n\r\n<p>Выполнена верстка для личной страницы веб-разработчика. Сделаны все эффекты и интерактив.</p>\r\n', '', '<ul>\r\n	<li>HTML5, CSS3,</li>\r\n	<li>JavaScript, jQuery.</li>\r\n</ul>\r\n', 'http://nataliakas.zzz.com.ua/', '', 10, '2019-02-18 11:18:00', '335299682.jpg', '320-335299682.jpg', '2019-02-18 11:18:13');

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
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_comments_post` (`post_id`),
  ADD KEY `index_foreignkey_comments_user` (`user_id`);

--
-- Индексы таблицы `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_posts_author` (`author_id`);

--
-- Индексы таблицы `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `works`
--
ALTER TABLE `works`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_works_author` (`author_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `about`
--
ALTER TABLE `about`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT для таблицы `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `works`
--
ALTER TABLE `works`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
