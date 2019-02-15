<?php

defined('_JEXEC') or die('Restricted access');
jimport('joomla.application.component.model');

class EgresadosModelTrabajos extends JModel {
	function eliminarTrabajo($codTrabajo, $codEgresado) {
		$db =& JFactory::getDBO();
		$query = "SELECT COUNT(*) FROM #__egresados_tTrabajo WHERE codEgresado='{$codEgresado}' ";
		$query .= "AND codTrabajo=$codTrabajo;";
		$db->setQuery($query);
		$db->query();
		$count = (int)$db->loadResult();
		if ($count > 0) {
			$query = "DELETE FROM #__egresados_tTrabajo WHERE codEgresado='{$codEgresado}' ";
			$query .= "AND codTrabajo=$codTrabajo;";
			$db->setQuery($query);
			$db->query();

			return (!$db->getErrorNum());
		} else {
			return false;
		}
	}

	function agregarModificarTrabajo($codEgresado) {
		$codTrabajo = JRequest::getInt('codTrabajo');
		$nombreEmpresa = strtoupper(JRequest::getVar('nombreEmpresa'));
		$puesto = strtoupper(JRequest::getVar('puesto'));
		$rubro = strtoupper(JRequest::getVar('rubro'));
		$responsabilidades = strtoupper(JRequest::getVar('responsabilidades'));
		$codPais = JRequest::getInt('pais');
		$fechaInicio_array = explode("/", substr(JRequest::getVar('fechaInicio'), 0, 10));
		if (!$fechaInicio = mktime(0,0,0,(int)$fechaInicio_array[1],(int)$fechaInicio_array[0],(int)$fechaInicio_array[2]))
			return false;
		$fechaFin_array= explode("/", substr(JRequest::getVar('fechaFin'), 0, 10));
		if (!$fechaFin = mktime(0,0,0,(int)$fechaFin_array[1],(int)$fechaFin_array[0],(int)$fechaFin_array[2]))
			return false;

		if($fechaInicio >= $fechaFin) return false;

		$db =& JFactory::getDBO();

		if($codTrabajo > 0) { /*ya existe trabajo (update)*/
			if (JRequest::getVar('codEgresado') == $codEgresado) { /* ;) */
				$query = "UPDATE #__egresados_tTrabajo SET nombreEmpresa = {$db->Quote($nombreEmpresa)}, ";
				$query .= "puesto = {$db->Quote($puesto)}, rubro = {$db->Quote($rubro)}, ";
				$query .= "responsabilidades = {$db->Quote($responsabilidades)}, codPais = {$codPais}, ";
				$query .= "fechaInicio = {$fechaInicio}, fechaFin = {$fechaFin} ";
				$query .= "WHERE codTrabajo = {$codTrabajo} AND codEgresado = {$db->Quote($codEgresado)};";
			} else {
				return false;
			}
		} else {
			$query = "INSERT INTO #__egresados_tTrabajo (codEgresado, nombreEmpresa, puesto, rubro, ";
			$query .= "responsabilidades, codPais, fechaInicio, fechaFin) ";
			$query .= "VALUES ({$db->Quote($codEgresado)}, {$db->Quote($nombreEmpresa)}, {$db->Quote($puesto)}, ";
			$query .= "{$db->Quote($rubro)}, {$db->Quote($responsabilidades)}, {$codPais}, {$fechaInicio}, {$fechaFin});";
		}

		$db->setQuery($query);
		$db->query();
		return (!$db->getErrorNum());
	}
}

?>
