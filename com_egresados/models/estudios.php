<?php

defined('_JEXEC') or die('Restricted access');
jimport('joomla.application.component.model');

class EgresadosModelEstudios extends JModel {
	function eliminarEstudio($codEstudio, $codEgresado) {
		$db =& JFactory::getDBO();
		$query = "SELECT COUNT(*) FROM #__egresados_tEstudio WHERE codAlumno='{$codEgresado}' ";
		$query .= "AND codEstudio=$codEstudio;";
		$db->setQuery($query);
		$db->query();
		$count = $db->loadResult();
		if ($count > 0) {
			$query = "DELETE FROM #__egresados_tEstudio WHERE codAlumno='{$codEgresado}' ";
			$query .= "AND codEstudio=$codEstudio;";
			$db->setQuery($query);
			$db->query();

			if ($db->getErrorNum())
				return false;
			else
			    return true;
		} else {
			return false;
		}
	}

	function agregarModificarEstudio($codEgresado, $modificar) {
		$nombre = strtoupper(JRequest::getVar('nombre'));
		if ($nombre == "") return false;

		if ($modificar) { $codEstudio = JRequest::getInt('cod_estudio'); }

		$codTipoCurso = JRequest::getInt('tipo_curso');
		$codPais = JRequest::getInt('pais');

		$duracion = JRequest::getInt('duracion');
		if($duracion <= 0) return false;

		$codTipoMedicion = JRequest::getInt('tipo_medicion');
		$fechaInicio_array = explode("/", substr(JRequest::getVar('fecha_inicio'), 0, 10));
		$fechaFin_array = explode("/", substr(JRequest::getVar('fecha_fin'), 0, 10));

		if ($fechaInicio = mktime(0,0,0,(int)$fechaInicio_array[1],(int)$fechaInicio_array[0],(int)$fechaInicio_array[2]))
			if ($fechaFin = mktime(0,0,0,(int)$fechaFin_array[1],(int)$fechaFin_array[0],(int)$fechaFin_array[2]))
				if ($fechaFin > $fechaInicio) {
					$db =& JFactory::getDBO();
					$query = "";

					if ($modificar) {
						$query = "SELECT COUNT(*) FROM #__egresados_tEstudio WHERE codEstudio={$codEstudio} AND codAlumno={$codEgresado};";
						$db->setQuery($query);
						$db->query();
						$n = (int)$db->loadResult();

						if($n == 1) {
							$query = "UPDATE #__egresados_tEstudio SET nombre={$db->Quote($nombre)}, codTipoCurso={$codTipoCurso}, ";
							$query .= "codPais={$codPais}, duracion={$duracion}, codTipoMedicion={$codTipoMedicion}, ";
							$query .= "fechaInicio={$fechaInicio}, fechaFin={$fechaFin} WHERE codEstudio={$codEstudio};";
							$db->setQuery($query);
							$db->query();

							if ($db->getErrorNum())
								return false;
							else
								return true;
						} else {
							return false;
						}
					} else { /*insertar*/
						$query = "INSERT INTO #__egresados_tEstudio (codAlumno, nombre, codTipoCurso, codPais, duracion, codTipoMedicion, fechaInicio, fechaFin) ";
						$query .= "VALUES ('{$codEgresado}', {$db->Quote($nombre)}, $codTipoCurso, $codPais, $duracion, $codTipoMedicion, $fechaInicio, $fechaFin);";

						$db->setQuery($query);
						$db->query();

						if ($db->getErrorNum())
							return false;
						else
							return true;
					}
				} else
					return false;
			else
				return false;
		else
			return false;
	}
}

?>
