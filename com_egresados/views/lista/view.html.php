<?php

defined('_JEXEC') or die('Acceso Restringido');
jimport('joomla.application.component.view');

class EgresadosViewLista extends JView {
	function display($tpl = null){
		parent::display($tpl);
	}

	function setEgresantes($egresantes, $EsEgresado, $codUsuarioEgresado = null) {
		$item_id = JRequest::getVar('Itemid');
		$tmp = "";
		$barNav = "";

		/*NAVBAR*/
		$barNav .= "<div style=\"height: 28px;\"><ul id=\"navi\">";

		if($EsEgresado) {
			$barNav .= "<li><a class=\"icon-external\" href=\"index.php?option=com_egresados&task=ver_perfil&cod_egresado=$codUsuarioEgresado&Itemid=$item_id\">".JText::_('MI_PERFIL')."</a></li>";
			$barNav .= "<li><a class=\"icon-external\" href=\"index.php?option=com_egresados&task=ver_estudios&cod_egresado=$codUsuarioEgresado&Itemid=$item_id\">".JText::_('MIS_ESTUDIOS')."</a></li>";
			$barNav .= "<li><a class=\"icon-external\" href=\"index.php?option=com_egresados&task=ver_trabajos&cod_egresado=$codUsuarioEgresado&Itemid=$item_id\">".JText::_('MIS_TRABAJOS')."</a></li>";
		} else {
			$barNav .= "<li><a class=\"icon-file\" href=\"index.php?option=com_egresados&task=registro&Itemid=$item_id\">".JText::_('REGISTRO_EGRESADO')."</a></li>";
		}

		$barNav .= "</ul></div>";

		if (count($egresantes) == 0) {
			$tmp = "<tr><td>".JText::_('NO_HAY_EGRESANTES')."</td></tr>";
		} else {
			$i = 1;
			foreach($egresantes as $egresante) {
				$tmp .="<tr>";
				$tmp .= "<td>$i</td>";
				$tmp .= "<td>".$egresante->codEgresado."</td>";
				$tmp .= "<td class=\"left\">".$egresante->nombres."</td>";
				$tmp .= "<td>".$egresante->semestre."</td>";
				$tmp .= "<td class=\"anchofijo\"><a class=\"icon-external\" href=\"index.php?option=com_egresados&task=ver_perfil&cod_egresado=$egresante->codEgresado&Itemid=$item_id\">ver</a></td>";
				$tmp .= "<td class=\"anchofijo\"><a class=\"icon-external\" href=\"index.php?option=com_egresados&task=ver_estudios&cod_egresado=$egresante->codEgresado&Itemid=$item_id\">ver</a></td>";
				$tmp .= "<td class=\"anchofijo\"><a class=\"icon-external\" href=\"index.php?option=com_egresados&task=ver_trabajos&cod_egresado=$egresante->codEgresado&Itemid=$item_id\">ver</a></td>";
				$tmp .="</tr>";
				$i++;
			}
		}

		$this->assignRef('barNav', $barNav);
		$this->assignRef('egresantes', $tmp);
	}
}

?>