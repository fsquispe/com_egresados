<?php

defined('_JEXEC') or die('Restricted access');
jimport('joomla.application.component.model');

class EgresadosModelUtils extends JModel {
	function getSemestres() {
		$db =& JFactory::getDBO();
		$query = "SELECT * FROM #__egresados_tSemestre ORDER BY nombre;";
		$db->setQuery($query);
		$db->query();
		$result = $db->loadObjectList();
		if($db->getErrorNum()) {
			JError::raiseError( 500 );
		}

		return $result;
	}

	function getPaises() {
		$db =& JFactory::getDBO();
		$query = "SELECT * FROM #__egresados_tPais ORDER BY nombre;";
		$db->setQuery($query);
		$db->query();
		$result = $db->loadObjectList();
		if($db->getErrorNum()) {
			JError::raiseError( 500 );
		}

		return $result;
	}

	function getEstadosCiviles() {
		$db =& JFactory::getDBO();
		$query = "SELECT * FROM #__egresados_tEstadoCivil ORDER BY nombre;";
		$db->setQuery($query);
		$db->query();
		$result = $db->loadObjectList();
		if($db->getErrorNum()) {
			JError::raiseError( 500 );
		}

		return $result;
	}

	function getTiposCurso() {
		$db =& JFactory::getDBO();
		$query = "SELECT * FROM #__egresados_tTipoCurso ORDER BY nombre;";
		$db->setQuery($query);
		$db->query();
		$result = $db->loadObjectList();
		if($db->getErrorNum()) {
			JError::raiseError( 500 );
		}

		return $result;
	}

	function getTiposMedicion() {
		$db =& JFactory::getDBO();
		$query = "SELECT * FROM #__egresados_tTipoMedicion ORDER BY nombre;";
		$db->setQuery($query);
		$db->query();
		$result = $db->loadObjectList();
		if($db->getErrorNum()) {
			JError::raiseError( 500 );
		}

		return $result;
	}

	function getEgresantes() {
		$db =& JFactory::getDBO();
		$query = "SELECT e.codEgresado, CONCAT(e.apellidoPaterno,'-',e.apellidoMaterno,'-',e.nombre) as nombres, s.nombre as semestre FROM ";
		$query .= "#__egresados_tEgresado e INNER JOIN #__egresados_tSemestre s ON e.codSemestre=s.codSemestre ";
		$query .= "WHERE (e.codCuenta > 0) ORDER BY s.nombre;";
		$db->setQuery($query);
		$db->query();
		$result = $db->loadObjectList();
		if($db->getErrorNum()) {
			JError::raiseError( 500 );
		}

		return $result;
	}

	function getEgresante($codEgresado) {
		$db =& JFactory::getDBO();
		$query = "SELECT e.codCuenta, e.codEgresado, CONCAT(e.apellidoPaterno,'-',e.apellidoMaterno,'-',e.nombre) as nombres, s.nombre as semestre FROM ";
		$query .= "#__egresados_tEgresado e INNER JOIN #__egresados_tSemestre s ON e.codSemestre=s.codSemestre ";
		$query .= "WHERE (e.codCuenta > 0) AND (e.codEgresado = {$db->Quote($codEgresado)}) ORDER BY s.nombre;";
		$db->setQuery($query);
		$db->query();
		$result = $db->loadObjectList();
		if($db->getErrorNum()) {
			JError::raiseError( 500 );
		}

		return $result;
	}

	function getTrabajos($codEgresado) {
		$db =& JFactory::getDBO();
		$query = "SELECT t.codTrabajo, t.codEgresado, t.nombreEmpresa, t.puesto, t.rubro, t.responsabilidades, ";
		$query .= "t.codPais, (p.nombre) as pais, fechaInicio, fechaFin FROM #__egresados_tTrabajo t ";
		$query .= "INNER JOIN #__egresados_tPais p ON p.codPais = t.codPais ";
		$query .= "WHERE t.codEgresado = {$db->Quote($codEgresado)};";
		$db->setQuery($query);
		$db->query();
		$result = $db->loadObjectList();
		if($db->getErrorNum()) {
			JError::raiseError( 500 );
		}

		return $result;
	}

	function getTrabajo($codTrabajo) {
		$db =& JFactory::getDBO();
		$query = "SELECT t.codTrabajo, t.codEgresado, t.nombreEmpresa, t.puesto, t.rubro, t.responsabilidades, ";
		$query .= "t.codPais, (p.nombre) as pais, fechaInicio, fechaFin FROM #__egresados_tTrabajo t ";
		$query .= "INNER JOIN #__egresados_tPais p ON p.codPais = t.codPais ";
		$query .= "WHERE t.codTrabajo = {$codTrabajo};";
		$db->setQuery($query);
		$db->query();
		$result = $db->loadObjectList();
		if($db->getErrorNum()) {
			JError::raiseError( 500 );
		}

		return $result;
	}

	/**/
	function getPerfil($codEgresado) {
		$db =& JFactory::getDBO();
		$query = "SELECT e.codEgresado, e.codCuenta, e.nombre, CONCAT(e.apellidoPaterno,'-',e.apellidoMaterno) as apellidos, e.anyoIngreso, ";
		$query .= "e.anyoEgreso, (s.nombre) as semestre ";
		$query .= "FROM #__egresados_tEgresado e INNER JOIN #__egresados_tSemestre s ON e.codSemestre=s.codSemestre ";
		$query .= "WHERE (e.codCuenta > 0) AND (e.codEgresado = {$db->Quote($codEgresado)});";
		$db->setQuery($query);
		$db->query();
		$result = $db->loadObjectList();
		if($db->getErrorNum()) {
			JError::raiseError( 500 );
		}

		return $result;
	}

	function getPerfilDetalle($codEgresado) {
		$db =& JFactory::getDBO();
		$query = "SELECT d.fechaNacimiento, d.lugarNacimiento, p.codPais, (p.nombre) as pais, d.direccion, c.codEstadoCivil, (c.nombre) as estadoCivil, ";
		$query .= "d.telefonoFijo, d.telefonoMovil, d.website, d.acercaDeEgresado FROM jos_egresados_tDatosAdicionales d ";
		$query .= "INNER JOIN #__egresados_tPais p ON p.codPais = d.codPais ";
		$query .= "INNER JOIN #__egresados_tEstadoCivil c ON c.codEstadoCivil = d.codEstadoCivil ";
		$query .= "WHERE (d.codAlumno = {$db->Quote($codEgresado)});";
		$db->setQuery($query);
		$db->query();
		$result = $db->loadObjectList();
		if($db->getErrorNum()) {
			JError::raiseError( 500 );
		}

		return $result;
	}
	/**/

	function getEstudios($codEgresado) {
		$db =& JFactory::getDBO();
		$query = "SELECT e.codEstudio, e.nombre, t.nombre as tipo, p.nombre as pais, CONCAT(e.duracion,' ', m.nombre) as duracion, e.fechaInicio, e.fechaFin ";
		$query .= "FROM #__egresados_tEstudio e INNER JOIN #__egresados_tTipoCurso t ON e.codTipoCurso = t.codTipoCurso ";
		$query .= "INNER JOIN #__egresados_tTipoMedicion m ON e.codTipoMedicion = m.codTipoMedicion ";
		$query .= "INNER JOIN #__egresados_tPais p ON e.codPais = p.codPais WHERE codAlumno={$db->Quote($codEgresado)};";
		$db->setQuery($query);
		$db->query();
		$result = $db->loadObjectList();
		if($db->getErrorNum()) {
			JError::raiseError( 500 );
		}

		return $result;
	}

	function getEstudio($codEstudio) {
		$db =& JFactory::getDBO();
		$query = "SELECT * FROM #__egresados_tEstudio WHERE codEstudio={$codEstudio};";
		$db->setQuery($query);
		$db->query();
		$result = $db->loadObjectList();
		if($db->getErrorNum()) {
			JError::raiseError( 500 );
		}

		return $result;
	}

	function esUsuarioRegistrado() {
		$user =& JFactory::getUser();
		if ($user->get('guest')) {
			return false;
		} else {
			return true;
		}
	}

	function esUsuarioInvitado() {
		return !$this->esUsuarioRegistrado();
	}

	function esUsuarioEgresado() {
		if ($this->esUsuarioRegistrado()) {
			$user =& JFactory::getUser();
			$db =& JFactory::getDBO();
			$query = "SELECT codCuenta FROM #__egresados_tEgresado WHERE codCuenta=".$user->id.";";
			$db->setQuery($query);
			$db->query();

			if(count($db->loadObjectList()) == 0) {
				return false;
			} else {
				return true;
			}
		} else {
			return false;
		}
	}

	function getCodigoUsuarioEgresado() {
		if ($this->esUsuarioEgresado()) {
			$user =& JFactory::getUser();
			$db =& JFactory::getDBO();
			$query = "SELECT codEgresado FROM #__egresados_tEgresado WHERE codCuenta=".$user->id.";";
			$db->setQuery($query);
			$db->query();
			$result = $db->loadObjectList();

			if($db->getErrorNum()) {
				JError::raiseError( 500 );
			} else {
				$out = "";
				foreach ( $result as $row )
					$out = $row->codEgresado;
				return $out;
			}
		} else {
			return "-1";
		}

	}

	function existeEgresado($codEgresado) {
		$db =& JFactory::getDBO();
		$query = "SELECT COUNT(*) FROM #__egresados_tEgresado WHERE (codEgresado={$db->Quote($codEgresado)}) AND (codCuenta > 0);";
		$db->setQuery($query);
		$db->query();
		$value = $db->loadResult();

		if($db->getErrorNum()) {
			JError::raiseError( 500 );
		} else {
			if ($value == 1)
				return true;
			else
			    return false;
		}
	}
}

?>
