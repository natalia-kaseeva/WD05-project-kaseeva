<?php 


require "config.php";
require "db.php";
require ROOT . "libs/functions.php";
session_start();

/* ..........................................

РОУТЕР

............................................. */
$uri =  $_SERVER["REQUEST_URI"];
$uri = rtrim($uri, "/"); 
$uri = filter_var($uri, FILTER_SANITIZE_URL);
$uri = substr($uri, 1);
$uri = explode('?', $uri);

switch ( $uri[0] ) {
	case '':
		require ROOT . "modules/main/index.php";
		break;

	// ::::::::::::::::::: USERS :::::::::::::::::::

	case 'login':
		require ROOT . "modules/login/login.php";
		break;

	case 'registration':
		include ROOT . "modules/login/registration.php";
		break;

	case 'logout':
		include ROOT . "modules/login/logout.php";
		break;

	case 'lost-password':
		include ROOT . "modules/login/lost-password.php";
		break;

	case 'set-new-password':
		include ROOT . "modules/login/set-new-password.php";
		break;

	case 'profile':
		include ROOT . "modules/profile/index.php";
		break;

	case 'profile-edit':
		include ROOT . "modules/profile/edit.php";
		break;

	case 'blog':
            include(ROOT . 'modules/blog/index.php');
        break;

    case 'blog/post-new':
            include(ROOT . 'modules/blog/post-new.php');
        break;

     case 'blog/post-edit':
            include(ROOT . 'modules/blog/post-edit.php');
        break;

    case 'blog/post-delete':
        include(ROOT . 'modules/blog/post-delete.php');
    break;

    case 'blog/post':
            include(ROOT . 'modules/blog/post.php');
        break;

    case 'blog/post':
            include(ROOT . 'modules/blog/post.php');
        break;

    case 'blog/categories':
        include(ROOT . 'modules/categories/all.php');
    break;

    case 'blog/category-new':
        include(ROOT . 'modules/categories/new.php');
    break;

    case 'blog/category-edit':
        include(ROOT . 'modules/categories/edit.php');
    break;
    
    case 'blog/category-delete':
        include(ROOT . 'modules/categories/delete.php');
    break;

	case 'contacts':
	    include(ROOT . 'modules/contacts/index.php');
	break;

	case 'contacts-edit':
	    include(ROOT . 'modules/contacts/edit.php');
	break;
	
	case 'contacts-messages':
	    include(ROOT . 'modules/contacts/messages.php');
	break;

	case 'message-delete':
	    include(ROOT . 'modules/contacts/message-delete.php');
	break;

	case 'about':
		include "modules/about/index.php";
		break;

	case 'edit-text':
		include "modules/about/edit-text.php";
		break;

	case 'edit-skills':
		include "modules/about/edit-skills.php";
		break;

	case 'edit-jobs':
		include "modules/about/edit-jobs.php";
		break;

	case 'edit-delete-jobs':
		include ROOT . "modules/about/edit-delete-jobs.php";
		break;

	case 'portfolio':
		require ROOT . "modules/portfolio/index.php";
		break;

	case 'portfolio/work-new':
		require ROOT . "modules/portfolio/work-new.php";
		break;

	case 'portfolio/work-edit':
		require ROOT . "modules/portfolio/work-edit.php";
		break;

	case 'portfolio/work-delete':
		require ROOT . "modules/portfolio/work-delete.php";
		break;
		
	case 'portfolio/work':
		require ROOT . "modules/portfolio/work.php";
		break;

	default:
		echo "Main page / 404";
		break;
}


 ?>