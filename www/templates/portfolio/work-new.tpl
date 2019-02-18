<div class="sticky-footer-content">
	<div class="container add-works pl-0 pr-0 pt-80 pb-120">
		<div class="row ml-0 mr-0">
			<div class="col-10 offset-1 pl-0 pr-0">
				<div class="add-works__title">
					<h1 class="title-general mt-0 mb-10">Добавить работу</h1>
				</div>

						<?php	require ROOT . "templates/_parts/_errors.tpl"; ?>
				<form class="add-works__form mt-40" action="<?=HOST?>portfolio/work-new" method="POST" enctype="multipart/form-data" novalidate>
					<div class="add-works__form-item mb-30">
						<label class="label" for="field-work-name">Название</label>
						<input class="input" name="title" id="field-work-name" type="text" placeholder="Введите название работы" value="<?=@$_POST['title']?>" />
					</div>
					<div class="add-works__form-item mb-30">
						<section class="upload-file">
							<h6 class="upload-file__title">Изображение</h6>
							<p class="upload-file__description">Изображение jpg или png, рекомендуемая ширина 945px и больше, высота от 400px и более, вес до 2Мб.</p>
							<input class="input-file" type="file" name="workImg" id="upload-file" data-multiple-caption="{count}" />
							<label class="input-file-mark" for="upload-file">Выбрать файл</label>
							<span>Файл не выбран</span>
						</section>
					</div>
					<div class="add-works__form-item mb-30">
						<label class="label" for="description-work">Содержание</label>
						<p></p>
						<textarea class="textarea" name="text" id="ckEditor1" placeholder="Введите описание"><?=@$_POST['text']?></textarea>
						<?php include_once ROOT . "templates/_parts/_ckEditorConnect.tpl" ?>
					</div>
					<div class="add-works__form-item mb-30">
						<label class="label" for="result-work">Результат</label>
						<p></p>
						<textarea class="textarea" name="result" id="ckEditor2" placeholder="Введите описание"><?=@$_POST['result']?></textarea>
						<?php include_once ROOT . "templates/_parts/_ckEditorConnect.tpl" ?>
					</div>
					<div class="add-works__form-item mb-30">
						<label class="label" for="tech-for-work">Технологии</label>
						<p></p>
						<textarea class="textarea" name="technologies" id="ckEditor3" placeholder="Введите описание"><?=@$_POST['technologies']?></textarea>
						<?php include_once ROOT . "templates/_parts/_ckEditorConnect.tpl" ?>
					</div>
					<div class="row ml-0 mr-0">
						<div class="col-3 no-paddings mr-30">
							<label class="label" for="field-link-project">Ссылка на проект</label>
							<input class="input" name="project" id="field-link-project" type="url" placeholder="Введите ссылку" value="<?=@$_POST['project']?>" />
						</div>
						<div class="col-3 no-paddings">
							<label class="label" for="link-on-github">Ссылка на GitHub</label>
							<input class="input" name="github" id="link-on-github" type="url" placeholder="Введите ссылку" value="<?=@$_POST['github']?>" />
						</div>
					</div>
					<div class="row ml-0 mr-0 mt-30">
						<input class="button button-save mr-20" type="submit" name="add-work" value="Сохранить" />
						<a class="button" href="<?=HOST?>portfolio" name="cancel-add-work">Отмена</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script src="<?=HOST?>libs/ckeditor/ckeditor.js"></script>