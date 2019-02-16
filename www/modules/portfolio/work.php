<?php

$sqlWork = 'SELECT works.id, works.title, works.text, works.result, works.date_time, works.technologies,works.project, works.github, works.work_img, users.username, users.lastname  
	FROM `works` 
	INNER JOIN users ON works.author_id = users.id 
	WHERE works.id = ' . $_GET['id'] . ' LIMIT 1 ';

$work = R::getAll($sqlWork);
$work = $work[0];

$worksId = R::getCol('SELECT id FROM works');

foreach ($worksId as $index => $id) {
	if ( $id == $work['id']) {
		@$nextId = $worksId[$index + 1];
		@$prevId = $worksId[$index - 1];
		break;
	}
}

$title = $work['username'];

// Готовим контент для центральной части
ob_start();
include ROOT . "templates/_parts/_header.tpl";
include ROOT . "templates/portfolio/work.tpl";
$content = ob_get_contents();

// Выводим шаблоны
ob_end_clean();
include ROOT . "templates/_parts/_head.tpl";
include ROOT . "templates/template.tpl";
include ROOT . "templates/_parts/_footer.tpl";
include ROOT . "templates/_parts/_foot.tpl";
?>
