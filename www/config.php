<?php 

// db SETTINGS
define('DB_HOST', 'localhost');
define('DB_NAME', 'WD05-project-kaseeva');
define('DB_USER', 'root');
define('DB_PASS', '');

// Хост сайта
define('HOST', $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'] . '/');

// Физический путь к корневой директории скрипта
define('ROOT', dirname(__FILE__).'/');

?>