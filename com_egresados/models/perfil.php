<?php

defined('_JEXEC') or die('Restricted access');
jimport('joomla.application.component.model');

class EgresadosModelPerfil extends JModel {
	function editarPerfil() {
		$codEgresado = JRequest::getVar('codEgresado');
		$fechaNacimiento_array = explode("/", substr(JRequest::getVar('fechaNacimiento'), 0, 10));
		if (!$fechaNacimiento = mktime(0,0,0,(int)$fechaNacimiento_array[1],(int)$fechaNacimiento_array[0],(int)$fechaNacimiento_array[2]))
			return false;
		$lugarNacimiento = JRequest::getVar('lugarNacimiento');
		$codPais = JRequest::getInt('pais');
		$direccion = JRequest::getVar('direccion');
		$codEstadoCivil = JRequest::getInt('estadoCivil');
		$telefonoFijo = JRequest::getVar('telefonoFijo');
		$telefonoMovil = JRequest::getVar('telefonoMovil');
		$website = JRequest::getVar('website');
		$acercaDeEgresado = JRequest::getVar('acercaDeEgresado');

		$db =& JFactory::getDBO();
		$query = "SELECT COUNT(*) FROM #__egresados_tDatosAdicionales WHERE codAlumno={$db->Quote($codEgresado)};";
		$db->setQuery($query);
		$db->query();
		$n = (int)$db->loadResult();

		if($n > 0) { /*ya existe perfil*/
			$query = "UPDATE #__egresados_tDatosAdicionales SET fechaNacimiento = $fechaNacimiento, ";
			$query .= "lugarNacimiento = {$db->Quote($lugarNacimiento)}, codPais = $codPais, ";
			$query .= "direccion = {$db->Quote($direccion)}, codEstadoCivil = $codEstadoCivil, ";
			$query .= "telefonoFijo = {$db->Quote($telefonoFijo)}, telefonoMovil = {$db->Quote($telefonoMovil)}, ";
			$query .= "website = {$db->Quote($website)}, acercaDeEgresado = {$db->Quote($acercaDeEgresado)} ";
			$query .= "WHERE codAlumno = {$db->Quote($codEgresado)};";
		} else {
			$query = "INSERT INTO #__egresados_tDatosAdicionales (codAlumno, fechaNacimiento, lugarNacimiento, ";
			$query .= "codPais, direccion, codEstadoCivil, telefonoFijo, telefonoMovil, website, acercaDeEgresado) ";
			$query .= "VALUES ({$db->Quote($codEgresado)}, $fechaNacimiento, {$db->Quote($lugarNacimiento)}, ";
			$query .= "$codPais, {$db->Quote($direccion)}, $codEstadoCivil, {$db->Quote($telefonoFijo)}, ";
			$query .= "{$db->Quote($telefonoMovil)}, {$db->Quote($website)}, {$db->Quote($acercaDeEgresado)});";
		}

		$db->setQuery($query);
		$db->query();
		return (!$db->getErrorNum());
	}
}

?>
