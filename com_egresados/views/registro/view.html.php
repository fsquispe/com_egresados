<?php

defined('_JEXEC') or die('Restricted access');
jimport('joomla.application.component.view');

class EgresadosViewRegistro extends JView {
	function display($tpl=null) {
		parent::display();
	}

	function setSemestres($semestres) {
		$item_id = JRequest::getVar('Itemid');
		$tmp = "";
		$barNav = "";

		/*NAVBAR*/
		$barNav .= "<div style=\"height: 28px;\"><ul id=\"navi\">";
		$barNav .= "<li><a class=\"icon-external\" href=\"index.php?option=com_egresados&task=lista&Itemid=$item_id\">".JText::_('VER_LISTA_EGRESADOS')."</a></li>";
		$barNav .= "</ul></div>";

		foreach($semestres as $semestre) {
			$tmp .= "<option name=\"semestre\" value=\"".$semestre->codSemestre."\">".$semestre->nombre."</option>";
		}

		$this->assignRef('barNav', $barNav);
		$this->assign('semestres', $tmp);
	}
}

?>
