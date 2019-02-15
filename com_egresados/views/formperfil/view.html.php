<?php

defined('_JEXEC') or die('Restricted access');
jimport('joomla.application.component.view');

class EgresadosViewFormperfil extends JView {
	function display($tpl=null) {
		parent::display();
	}

	function setData($detalle, $paises, $estadosCiviles, $codEgresado) {
		if (count($detalle) > 0)
			$this->assign('existeDetalle', true);
		else
			$this->assign('existeDetalle', false);

		$this->assignRef('detalle', $detalle[0]);
		$this->assignRef('paises', $paises);
		$this->assignRef('estadosCiviles', $estadosCiviles);
		$this->assign('codEgresado', $codEgresado);
		$this->assign('itemId', JRequest::getVar('Itemid'));
	}
}

?>
