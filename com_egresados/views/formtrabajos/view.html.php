<?php

defined('_JEXEC') or die('Restricted access');
jimport('joomla.application.component.view');

class EgresadosViewFormtrabajos extends JView {
	function display($tpl=null) {
		parent::display();
	}


	function setData($trabajo, $paises, $codEgresado) {
		if(count($trabajo) > 0)
			$this->assign('esEditable', true);
		else
		    $this->assign('esEditable', false);

		$this->assignRef('trabajo', $trabajo[0]);
		$this->assignRef('paises', $paises);
		$this->assign('codEgresado', $codEgresado);
		$this->assign('itemId', JRequest::getVar('Itemid'));

	}
}

?>
