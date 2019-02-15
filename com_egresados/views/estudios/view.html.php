<?php

defined('_JEXEC')or die('Acceso Restringido');
jimport('joomla.application.component.view');

class EgresadosViewEstudios extends JView {
	function display($tpl = null){
		parent::display($tpl);
	}

	function setEstudios($estudios, $egresado, $editable) {
		$item_id = JRequest::getVar('Itemid');
		$hayRegistros = false;
		$tmp = "";
		$barNav = "";
		$egre_tmp = "";

		/*NAVBAR*/
		$barNav .= "<div style=\"height: 28px;\"><ul class=\"navi\">";
		$barNav .= "<li><a class=\"icon-external\" href=\"index.php?option=com_egresados&task=lista&Itemid=$item_id\">".JText::_('VER_LISTA_EGRESADOS')."</a></li>";

		if($editable)
			$barNav .= "<li><a class=\"icon-file\" href=\"index.php?option=com_egresados&task=agregar_estudio&Itemid=$item_id\">".JText::_('AGREGAR_ESTUDIO')."</a></li>";

		$barNav .= "</ul></div>";

		/*DATOS DEL EGRESADO*/
		foreach($egresado as $e) {
		    $egre_tmp .= "<dl>";
			$egre_tmp .= "<dt>".JText::_('Codigo')."</dt><dd><em class=\"box\">".$e->codEgresado."</em></dd>";
			$egre_tmp .= "<dt>".JText::_('Nombres')."</dt><dd><em class=\"box\">".$e->nombres."</em></dd>";
			$egre_tmp .= "<dt>".JText::_('Semestre')."</dt><dd><em class=\"box\">".$e->semestre."</em></dd>";
			$egre_tmp .= "</dl>";
		}

		/*LISTA*/
		if (count($estudios) > 0) {
			$hayRegistros = true;
			$i = 1;
			foreach($estudios as $estudio) {
				$tmp .="<tr>";
				$tmp .= "<td>$i</td>";
				$tmp .= "<td class=\"left\">".$estudio->nombre."</td>";
				$tmp .= "<td>".$estudio->tipo."</td>";
				$tmp .= "<td>".$estudio->pais."</td>";
				$tmp .= "<td>".$estudio->duracion."</td>";
				$tmp .= "<td class=\"anchofijo\">".date('d/m/Y', $estudio->fechaInicio)."</td>";
				$tmp .= "<td class=\"anchofijo\">".date('d/m/Y', $estudio->fechaFin)."</td>";

				if($editable) {
					$tmp .= "<td class=\"anchofijo-icono\"><a title=\"".JText::_('EDITAR')."\" class=\"icon-editar\" href=\"index.php?option=com_egresados&task=editar_estudio&cod_estudio=".$estudio->codEstudio."&Itemid=$item_id\"></a></td>";
					$tmp .= "<td class=\"anchofijo-icono\"><a title=\"".JText::_('ELIMINAR')."\" class=\"icon-eliminar\" style=\"cursor: pointer;\" onclick=\"pregunta('index.php?option=com_egresados&task=eliminar_estudio&cod_estudio=".$estudio->codEstudio."&Itemid=$item_id');\"></td>";
				}

				$tmp .="</tr>";
				$i++;
			}
		}

		/***/
		$this->assign('hayRegistros', $hayRegistros);
		$this->assign('codEgresado',$e->codEgresado);
		$this->assign('item_id', $item_id);
		$this->assign('editable', $editable);
		$this->assignRef('barNav', $barNav);
		$this->assignRef('egresado', $egre_tmp);
		$this->assignRef('estudios', $tmp);
	}
}

?>