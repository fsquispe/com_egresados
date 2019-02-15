<?php

defined('_JEXEC') or die('Restricted access');
jimport('joomla.application.component.model');

class EgresadosModelRegistro extends JModel {
	function registrarUsuarioEgresado() {
		/*variables del formulario*/
		$codigo = JRequest::getVar('codigo');
		$anyio_ingreso = JRequest::getInt('anyio-ingreso');
		$anyio_egreso = JRequest::getInt('anyio-egreso');
		$semestre = JRequest::getInt('semestre');

		if (($anyio_ingreso >= 1990) && ($anyio_ingreso <= 2012))
			if (($anyio_egreso >= 1990) && ($anyio_egreso <= 2012)) {
				$dif = $anyio_egreso - $anyio_ingreso;
				if (($dif >= 3) && ($dif <= 20))
					if ($semestre > 1) {
						$db =& JFactory::getDBO();
						$query = "SELECT codEgresado FROM #__egresados_tEgresado WHERE codEgresado='{$codigo}';";
						$db->setQuery($query);
						$db->query();
						$result = $db->loadObjectList();

						if (count($result) == 1) {
							$user =& JFactory::getUser();
							$query = "UPDATE #__egresados_tEgresado SET codCuenta={$user->id}, anyoIngreso={$anyio_ingreso}";
							$query .= ", anyoEgreso={$anyio_egreso}, codSemestre={$semestre} WHERE codEgresado={$db->Quote($codigo)};";
							$db->setQuery($query);
							$db->query();

							if (!$db->getErrorNum())
								return true;
							else
								return false;
						} else
							return false;
					} else
						return false;
				else
					return false;
			} else
				return false;
		else
			return false;
	}
}

?>
