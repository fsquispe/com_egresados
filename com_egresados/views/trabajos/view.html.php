<?php

defined('_JEXEC')or die('Acceso Restringido');
jimport('joomla.application.component.view');

class EgresadosViewTrabajos extends JView {
	function display($tpl = null){
		parent::display($tpl);
	}

	function setData($trabajos, $egresado, $codEgresado) {
		if (count($trabajos) > 0)
			$this->assign('existenTrabajos', true);
		else
			$this->assign('existenTrabajos', false);

		if ($egresado[0]->codEgresado == $codEgresado)
			$this->assign('esEditable', true);
		else
			$this->assign('esEditable', false);

		$this->assignRef('trabajos',$trabajos);
		$this->assignRef('egresado', $egresado[0]);
		$this->assign('codEgresado', $codEgresado);
		$this->assign('itemId', JRequest::getVar('Itemid'));
	}
}

?>