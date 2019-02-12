<?php 

$title = "Контакты";

$contacts = R::load('contacts', 1);

if(isset($_POST['newMessage'])) {
	$pattern = '/^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z{2,4}\.])?[a-z]{2,4}$/i';

    if(trim($_POST['name-user']) == '') {
        $errors[] = ['title' => 'Введите имя'];
    }

    if(trim($_POST['email-user']) == '') {
        $errors[] = ['title' => 'Введите email'];
    } else if(!preg_match($pattern, $_POST['email-user'])) {
            $errors[] = ['title' => 'Неверный формат email'];
        }
        
    if(trim($_POST['user-message']) == '') {
        $errors[] = ['title' => 'Введите сообщение'];
    }

    if(isset($_FILES['upload-file']['name']) && $_FILES['upload-file']['tmp_name'] != '') {
        $fileName = $_FILES['upload-file']['name'];
        $fileTmpLoc = $_FILES['upload-file']['tmp_name'];
        $fileType = $_FILES['upload-file']['type'];
        $fileSize = $_FILES['upload-file']['size'];
        $fileErrorMsg = $_FILES['upload-file']['error'];
        $kaboom = explode('.', $fileName);
        $fileExt = end($kaboom);

        $db_file_name = rand(100000000000, 999999999999) . '.' . $fileExt;

        if($fileSize > 4194304) {
            $errors[] = ['title' => 'Размер файла с изображением не должен превышать 4Mb.'];

        } else if(!preg_match("/\.(gif|jpg|jpeg|png|pdf|doc|docx)$/i", $fileName)) {
            $errors[] = ['title' => 'Неверный формат файла.', 'desc' => '<p>Файл изображения должен быть в формате gif, jpg, png, pdf, doc и docx.</p>'];

        } else if($fileErrorMsg == 1) {
            $errors[] = ['title' => 'При загрузке изображения произошла ошибка.'];
        }

    }
    
    if(empty($errors)) {
        $message = R::dispense('messages');
        $message->name = htmlentities($_POST['name-user']);
        $message->email = htmlentities($_POST['email-user']);
        $message->message = htmlentities($_POST['user-message']);
        $message->date_time = R::isoDateTime();

        if(isset($_FILES['upload-file']['name']) && $_FILES['upload-file']['tmp_name'] != '') {
            $fileName = $_FILES['upload-file']['name'];
            $fileTmpLoc = $_FILES['upload-file']['tmp_name'];
            $fileType = $_FILES['upload-file']['type'];
            $fileSize = $_FILES['upload-file']['size'];
            $fileErrorMsg = $_FILES['upload-file']['error'];
            $kaboom = explode('.', $fileName);
            $fileExt = end($kaboom);

            $db_file_name = rand(100000000000, 999999999999) . '.' . $fileExt;

            if($fileSize > 4194304) {
                $errors[] = ['title' => 'Размер файла с изображением не должен превышать 4Mb.'];

            } else if(!preg_match("/\.(gif|jpg|jpeg|png|pdf|doc|docx)$/i", $fileName)) {
                $errors[] = ['title' => 'Неверный формат файла.', 'desc' => '<p>Файл изображения должен быть в формате gif, jpg, png, pdf, doc и docx.</p>'];

            } else if($fileErrorMsg == 1) {
                $errors[] = ['title' => 'При загрузке изображения произошла ошибка.'];
            }

            $filesFolderLocation = ROOT . 'usercontent/upload_files/';
            $uploadfile = $filesFolderLocation . $db_file_name;
            $moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

            if($moveResult != true) {
                $errors[] = ['title' => 'Ошибка сохранения файла.'];
            }

            $message->message_file_name_original = $fileName;
            $message->message_file = $db_file_name;
        }

            R::store($message);
            /*$success[] = ['title' => 'Сообщение было успешно отправлено!'];*/
            header('Location:' . HOST . "contacts?result=messageCreated");
            exit(); 
    }
}

//Подготавливаем конетнт для центральной части
ob_start();
include(ROOT . 'templates/_parts/_header.tpl');
include(ROOT . 'templates/contacts/contacts.tpl');
$content = ob_get_contents();
ob_end_clean();

//Подключаем основные шаблоны
include(ROOT . 'templates/_parts/_head.tpl');
include(ROOT . 'templates/template.tpl');
include(ROOT . 'templates/_parts/_footer.tpl');
include(ROOT . 'templates/_parts/_foot.tpl');

 ?>