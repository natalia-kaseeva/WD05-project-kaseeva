<div class="content-exp-page">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <h1 class="title-general mt-0 mb-35">Редактировать - Опыт работы</h1>

                <?php if ( isset($_GET['result']) ) { ?>
                <?php include ROOT . "templates/about/_result.tpl" ?>
                <?php } ?>

                <?php foreach ($jobs as $job) { ?>
                <?php include ROOT . "templates/about/_card-job-edit.tpl" ?>
                <?php } ?>
                
                <h3 class="title-3 mt-0 mb-35">Добавить новое место работы</h3>
  
               <?php require(ROOT . 'templates/_parts/_errors.tpl');?>

                <form class="about-me-edit-form" method="POST" action="<?=HOST?>edit-jobs">
                    <label class="label" for="work-period">Период</label>
                    <input class="input" name="period" id="work-period" type="text" placeholder="Введите даты начала и окончания работы" value="<?=@$_POST['period']?>"/>

                    <label class="label" for="name-post">Название должности</label>
                    <input class="input" name="title" id="name-post" type="text" placeholder="Введите название должности" value="<?=@$_POST['title']?>"/>

                    <label class="label" for="text">Описание работы, должностные обязанности, достигнутые результаты</label>
                    <textarea class="textarea" name="description" id="text" placeholder="Напишите интересное краткое содержательное описание"><?=@$_POST['description']?></textarea>

                    <div class="row">
                        <div class="col-auto pr-30">
                            <input class="button button-save" type="submit" name="newJob" value="Добавить" />
                        </div>
                        <div class="col-auto">
                            <a class="button" href="<?=HOST?>about">Отмена</a>
                        </div>
                    </div>                  
                </form>
            </div>
        </div>
    </div>
</div>