<?php

defined('_JEXEC') or die('Restricted access');
jimport('joomla.application.component.view');

class EgresadosViewPerfil extends JView {
	function display($tpl=null) {
		parent::display();
	}

	function setData($perfil, $detalle, $editable) {
		$item_id = JRequest::getVar('Itemid');
		$barNav = "";

		/*NAVBAR*/
		$barNav .= "<div style=\"height: 28px;\"><ul class=\"navi\">";
		$barNav .= "<li><a class=\"icon-external\" href=\"index.php?option=com_egresados&task=lista&Itemid=$item_id\">".JText::_('VER_LISTA_EGRESADOS')."</a></li>";

		if($editable)
			$barNav .= "<li><a class=\"icon-editar\" href=\"index.php?option=com_egresados&task=editar_perfil&Itemid=$item_id\">".JText::_('EDITAR_PERFIL')."</a></li>";

		$barNav .= "</ul></div>";

		$this->assign('item_id', $item_id);
		$this->assignRef('perfil', $perfil);
		$this->assignRef('detalle', $detalle);
		$this->assignRef('barNav', $barNav);
	}
}

?>
