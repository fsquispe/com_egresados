<?php

defined('_JEXEC') or die('Restricted access');

$path = JPATH_COMPONENT.DS.'controller.php';

if(file_exists($path)){
	require_once($path);
	$controller = new EgresadosController();
	$controller->execute($task);
	$controller->redirect();
} else {
	die('error en el componente');
}

?>
