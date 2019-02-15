<?php

defined('_JEXEC') or die('Restricted access');
jimport('joomla.application.component.view');

class EgresadosViewFormestudios extends JView {
	function display($tpl=null) {
		parent::display();
	}

	function setEditable($valor) {
		if ($valor)
			$this->assign('editable', true);
		else
		    $this->assign('editable', false);
	}

	function setData($estudio) {
		foreach($estudio as $est) {
			$var_codEstudio = $est->codEstudio;
			$var_codEgresado = $est->codAlumnos;
			$var_nombre = $est->nombre;
			$var_codTipoCurso = $est->codTipoCurso;
			$var_codPais = $est->codPais;
			$var_duracion = $est->duracion;
			$var_codTipoMedicion = $est->codTipoMedicion;
			$var_fechaInicio = date('d/m/Y', $est->fechaInicio);
			$var_fechaFin = date('d/m/Y', $est->fechaFin);
		}

		$this->assign('var_codEstudio', $var_codEstudio);
		$this->assign('var_codEgresado', $var_codEgresado);
		$this->assign('var_nombre', $var_nombre);
		$this->assign('var_codTipoCurso', $var_codTipoCurso);
		$this->assign('var_codPais', $var_codPais);
		$this->assign('var_duracion', $var_duracion);
		$this->assign('var_codTipoMedicion', $var_codTipoMedicion);
		$this->assign('var_fechaInicio', $var_fechaInicio);
		$this->assign('var_fechaFin', $var_fechaFin);
	}

	function crearBarNav($codEgresado) {
		$barNav = "";
		$item_id = JRequest::getVar('Itemid');

		$barNav .= "<div style=\"height: 28px;\"><ul id=\"navi\">";
		$barNav .= "<li><a class=\"icon-external\" href=\"index.php?option=com_egresados&task=ver_estudios&cod_egresado=$codEgresado&Itemid=$item_id\">".JText::_('VOLVER')."</a></li>";
		$barNav .= "</ul></div>";

		$this->assignRef('barNav', $barNav);
	}

	function setTiposCurso($tiposCurso) {
		$tmp = "";

		if ($this->editable) {
			$selected = "";

			foreach($tiposCurso as $tipoCurso) {
				if ($this->var_codTipoCurso == $tipoCurso->codTipoCurso) $selected = "selected";
				else $selected = "";
				$tmp .= "<option $selected name=\"tipo_curso\" value=\"".$tipoCurso->codTipoCurso."\">".$tipoCurso->nombre."</option>";
			}
		} else {
			foreach($tiposCurso as $tipoCurso) {
				$tmp .= "<option name=\"tipo_curso\" value=\"".$tipoCurso->codTipoCurso."\">".$tipoCurso->nombre."</option>";
			}
		}

		$this->assignRef('tiposCurso', $tmp);
	}

	function setPaises($paises) {
		$tmp = "";

		if ($this->editable) {
			$selected = "";

			foreach($paises as $pais) {
				if ($this->var_codPais == $pais->codPais) $selected = "selected";
				else $selected = "";
				$tmp .= "<option $selected name=\"pais\" value=\"".$pais->codPais."\">".$pais->nombre."</option>";
			}
		} else {
			foreach($paises as $pais) {
				$tmp .= "<option name=\"pais\" value=\"".$pais->codPais."\">".$pais->nombre."</option>";
			}
		}

		$this->assignRef('paises', $tmp);
	}

	function setTiposMedicion($tiposMedicion) {
		$tmp = "";

		if ($this->editable) {
			$selected = "";

			foreach($tiposMedicion as $tipoMedicion) {
				if ($this->var_codTipoMedicion == $tipoMedicion->codTipoMedicion) $selected = "selected";
				else $selected = "";
				$tmp .= "<option $selected name=\"tipo_medicion\" value=\"".$tipoMedicion->codTipoMedicion."\">".$tipoMedicion->nombre."</option>";
			}
		} else {
			foreach($tiposMedicion as $tipoMedicion) {
				$tmp .= "<option name=\"tipo_medicion\" value=\"".$tipoMedicion->codTipoMedicion."\">".$tipoMedicion->nombre."</option>";
			}
		}

		$this->assignRef('tiposMedicion', $tmp);
	}
}

?>
