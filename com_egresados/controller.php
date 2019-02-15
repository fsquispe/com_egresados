<?php

defined('_JEXEC') or die('Restricted access');
jimport('joomla.application.component.controller');

class EgresadosController extends JController {
	function display() { /*ESTO SE EJECUTA SI $task NO ESTA DEFINIDO */
		JError::raiseError( 403, JText::_('Access Forbidden') );
		return;
	}

	function registro() {
		$utils = $this->getModel('utils');

		if ($utils->esUsuarioRegistrado() && !$utils->esUsuarioEgresado()) {
			$frm = $this->getView('registro', 'html');
			$frm->setSemestres($utils->getSemestres());
			$frm->display();
		} else {
			if ($utils->esUsuarioEgresado()) {
				$item_id = JRequest::getVar('Itemid');
				$this->setredirect("index.php?option=com_egresados&Itemid=$item_id");
			} else {
				JError::raiseError( 403, JText::_('Access Forbidden') );
				return;
			}
		}
	}

	function registro_save() {
		JRequest::checkToken() or die( 'Token invalido' );
		$utils = $this->getModel('utils');
		$item_id = JRequest::getVar('Itemid');

		if ($utils->esUsuarioRegistrado() && !$utils->esUsuarioEgresado()) {
			$reg = $this->getModel('registro');

			if($reg->registrarUsuarioEgresado())
				$this->setredirect("index.php?option=com_egresados&Itemid=$item_id", 'Usuario egresado registrado correctamente.');
			else
				$this->setredirect("index.php?option=com_egresados&task=registro&Itemid=$item_id", 'Tus datos no son válidos.', 'error');
		} else {
			if ($utils->esUsuarioEgresado()) {
				$this->setredirect("index.php?option=com_egresados&Itemid=$item_id");
			} else {
				JError::raiseError( 403, JText::_('Access Forbidden') );
				return;
			}
		}
	}

	function lista() {
		$utils = $this->getModel('utils');

		if($utils->esUsuarioRegistrado()) {
			$lst = $this->getView('lista', 'html');
			$lst->setEgresantes($utils->getEgresantes(), $utils->esUsuarioEgresado(), $utils->getCodigoUsuarioEgresado());
			$lst->display();
		} else {
			JError::raiseError( 403, JText::_('Access Forbidden') );
			return;
		}
	}

	/*estudios*/
	function ver_estudios() {
		$utils = $this->getModel('utils');
		$codEgresado = JRequest::getVar('cod_egresado');

		if($utils->esUsuarioRegistrado()) {
			if (!$utils->existeEgresado($codEgresado)) { JError::raiseError( 404, JText::_('Not Found') ); return; }

			$lst = $this->getView('estudios', 'html');

			$editable = false;
			if ($utils->getCodigoUsuarioEgresado() == $codEgresado)
				$editable = true;

			$lst->setEstudios($utils->getEstudios($codEgresado),
				$utils->getEgresante($codEgresado),
				$editable);

			$lst->display();
		} else {
			JError::raiseError( 403, JText::_('Access Forbidden') );
			return;
		}
	}

	function eliminar_estudio() {
		$utils = $this->getModel('utils');

		if($utils->esUsuarioEgresado()) {
			$modelEstudios = $this->getModel('estudios');
			$codEgresado = $utils->getCodigoUsuarioEgresado();
			$item_id = JRequest::getVar('Itemid');

			if (!$utils->existeEgresado($codEgresado)) { JError::raiseError( 404, JText::_('Not Found') ); return; }

			if ($modelEstudios->eliminarEstudio(JRequest::getInt('cod_estudio'), $codEgresado)) {
				$this->setredirect("index.php?option=com_egresados&task=ver_estudios&cod_egresado=$codEgresado&Itemid=$item_id", 'Estudio fue eliminado.');
			} else {
				$this->setredirect("index.php?option=com_egresados&task=ver_estudios&cod_egresado=$codEgresado&Itemid=$item_id", 'No se pudo eliminar estudio.', 'error');
			}
		} else {
			JError::raiseError( 403, JText::_('Access Forbidden') );
			return;
		}
	}

	function agregar_estudio() {
		$utils = $this->getModel('utils');

		if($utils->esUsuarioEgresado()) {
			$frm = $this->getView('formestudios', 'html');
			$codEgresado = $utils->getCodigoUsuarioEgresado();

			if (!$utils->existeEgresado($codEgresado)) { JError::raiseError( 404, JText::_('Not Found') ); return; }

			$frm->setEditable(false);
			$frm->crearBarNav($codEgresado);
			$frm->setTiposCurso($utils->getTiposCurso());
			$frm->setPaises($utils->getPaises());
			$frm->setTiposMedicion($utils->getTiposMedicion());
			$frm->display();
		} else {
			JError::raiseError( 403, JText::_('Access Forbidden') );
			return;
		}
	}

	function agregar_estudio_save() {
		JRequest::checkToken() or die( 'Token invalido' );
		$utils = $this->getModel('utils');

		if($utils->esUsuarioEgresado()) {
			$modelEstudios = $this->getModel('estudios');
			$codEgresado = $utils->getCodigoUsuarioEgresado();
			$item_id = JRequest::getVar('Itemid');

			if (!$utils->existeEgresado($codEgresado)) { JError::raiseError( 404, JText::_('Not Found') ); return; }

			if ($modelEstudios->agregarModificarEstudio($codEgresado, false)) {
				$this->setredirect("index.php?option=com_egresados&task=ver_estudios&cod_egresado=$codEgresado&Itemid=$item_id", 'Estudio fue agregado.');
			} else {
				$this->setredirect("index.php?option=com_egresados&task=agregar_estudio&Itemid=$item_id", 'Tus datos no son válidos.', 'error');
			}
		} else {
			JError::raiseError( 403, JText::_('Access Forbidden') );
			return;
		}
	}

	function editar_estudio() {
		$utils = $this->getModel('utils');

		if($utils->esUsuarioEgresado()) {
			$frm = $this->getView('formestudios', 'html');
			$codEgresado = $utils->getCodigoUsuarioEgresado();
			$codEstudio = JRequest::getInt('cod_estudio');

			if (!$utils->existeEgresado($codEgresado)) { JError::raiseError( 404, JText::_('Not Found') ); return; }

			$frm->setEditable(true);
			$frm->setData($utils->getEstudio($codEstudio));
			$frm->crearBarNav($codEgresado);
			$frm->setTiposCurso($utils->getTiposCurso());
			$frm->setPaises($utils->getPaises());
			$frm->setTiposMedicion($utils->getTiposMedicion());
			$frm->display();
		} else {
			JError::raiseError( 403, JText::_('Access Forbidden') );
			return;
		}
	}

	function editar_estudio_save() {
		JRequest::checkToken() or die( 'Token invalido' );
		$utils = $this->getModel('utils');

		if($utils->esUsuarioEgresado()) {
			$modelEstudios = $this->getModel('estudios');
			$codEgresado = $utils->getCodigoUsuarioEgresado();
			$item_id = JRequest::getVar('Itemid');

			if (!$utils->existeEgresado($codEgresado)) { JError::raiseError( 404, JText::_('Not Found') ); return; }

			if ($modelEstudios->agregarModificarEstudio($codEgresado, true)) {
				$this->setredirect("index.php?option=com_egresados&task=ver_estudios&cod_egresado=$codEgresado&Itemid=$item_id", 'Estudio fue editado.');
			} else {
				$this->setredirect("index.php?option=com_egresados&task=agregar_estudio&Itemid=$item_id", 'Tus datos no son válidos.', 'error');
			}
		} else {
			JError::raiseError( 403, JText::_('Access Forbidden') );
			return;
		}
	}

	/*perfil*/
	function ver_perfil() {
		$utils = $this->getModel('utils');
		$codEgresado = JRequest::getVar('cod_egresado');

		if($utils->esUsuarioRegistrado()) {
			if (!$utils->existeEgresado($codEgresado)) { JError::raiseError( 404, JText::_('Not Found') ); return; }

			$lst = $this->getView('perfil', 'html');

			$editable = false;
			if ($utils->getCodigoUsuarioEgresado() == $codEgresado)
				$editable = true;

			$lst->setData($utils->getPerfil($codEgresado),
				$utils->getPerfilDetalle($codEgresado),
				$editable);

			$lst->display();
		} else {
			JError::raiseError( 403, JText::_('Access Forbidden') );
			return;
		}
	}

	function editar_perfil() {
		$utils = $this->getModel('utils');

		if($utils->esUsuarioEgresado()) {
			$frm = $this->getView('formperfil', 'html');
			$codEgresado = $utils->getCodigoUsuarioEgresado();

			if (!$utils->existeEgresado($codEgresado)) { JError::raiseError( 404, JText::_('Not Found') ); return; }

			$frm->setData($utils->getPerfilDetalle($codEgresado),
				$utils->getPaises(),
				$utils->getEstadosCiviles(),
				$codEgresado);
			$frm->display();
		} else {
			JError::raiseError( 403, JText::_('Access Forbidden') );
			return;
		}
	}

	function editar_perfil_save() {
		JRequest::checkToken() or die( 'Token invalido' );
		$utils = $this->getModel('utils');

		if($utils->esUsuarioEgresado()) {
			$codEgresado = $utils->getCodigoUsuarioEgresado();

			if (!$utils->existeEgresado($codEgresado)) { JError::raiseError( 404, JText::_('Not Found') ); return; }

			if ($codEgresado == JRequest::getVar('codEgresado')) {
				$mdlPerfil = $this->getModel('perfil');
				$itemId = JRequest::getVar('Itemid');

				if ($mdlPerfil->editarPerfil()) {
					$this->setredirect("index.php?option=com_egresados&task=ver_perfil&cod_egresado=$codEgresado&Itemid=$itemId", 'perfil fue editado.');
				} else {
					$this->setredirect("index.php?option=com_egresados&task=editar_perfil&Itemid=$itemId", 'Tus datos no son válidos.', 'error');
				}
			} else {
				JError::raiseError( 403, JText::_('Access Forbidden') );
				return;
			}
		} else {
			JError::raiseError( 403, JText::_('Access Forbidden') );
			return;
		}
	}

	/*trabajos*/
	function ver_trabajos() {
		$utils = $this->getModel('utils');

		if($utils->esUsuarioRegistrado()) {
			$codEgresado = JRequest::getVar('cod_egresado');

			if (!$utils->existeEgresado($codEgresado)) { JError::raiseError( 404, JText::_('Not Found') ); return; }

			$lst = $this->getView('trabajos', 'html');
			$lst->setData(
				$utils->getTrabajos($codEgresado),
				$utils->getEgresante($codEgresado),
				$utils->getCodigoUsuarioEgresado()
				);
			$lst->display();
		} else {
			JError::raiseError( 403, JText::_('Access Forbidden') );
			return;
		}
	}

	function eliminar_trabajo() {
		$utils = $this->getModel('utils');

		if($utils->esUsuarioEgresado()) {
			$codEgresado = $utils->getCodigoUsuarioEgresado();

			if (!$utils->existeEgresado($codEgresado)) { JError::raiseError( 404, JText::_('Not Found') ); return; }

			$itemId = JRequest::getVar('Itemid');
			$mdlTrabajo = $this->getModel('trabajos');

			if ($mdlTrabajo->eliminarTrabajo(JRequest::getInt('codTrabajo'), $codEgresado)) {
				$this->setredirect("index.php?option=com_egresados&task=ver_trabajos&cod_egresado=$codEgresado&Itemid=$itemId", 'Trabajo fue eliminado.');
			} else {
				$this->setredirect("index.php?option=com_egresados&task=ver_trabajos&cod_egresado=$codEgresado&Itemid=$itemId", 'No se pudo eliminar trabajo.', 'error');
			}
		} else {
			JError::raiseError( 403, JText::_('Access Forbidden') );
			return;
		}
	}

	function agregar_trabajo() {
		$utils = $this->getModel('utils');

		if($utils->esUsuarioEgresado()) {
			$frm = $this->getView('formtrabajos', 'html');
			$codEgresado = $utils->getCodigoUsuarioEgresado();

			if (!$utils->existeEgresado($codEgresado)) { JError::raiseError( 404, JText::_('Not Found') ); return; }

			$frm->setData(
					null,
					$utils->getPaises(),
					$codEgresado
				);
			$frm->display();
		} else {
			JError::raiseError( 403, JText::_('Access Forbidden') );
			return;
		}
	}

	function agregar_trabajo_save() {
		JRequest::checkToken() or die( 'Token invalido' );
		$utils = $this->getModel('utils');

		if($utils->esUsuarioEgresado()) {
			$codEgresado = $utils->getCodigoUsuarioEgresado();

			if (!$utils->existeEgresado($codEgresado)) { JError::raiseError( 404, JText::_('Not Found') ); return; }

			$mdlTrabajo = $this->getModel('trabajos');
			$itemId = JRequest::getVar('Itemid');

			if ($mdlTrabajo->agregarModificarTrabajo($codEgresado)) {
				$this->setredirect("index.php?option=com_egresados&task=ver_trabajos&cod_egresado=$codEgresado&Itemid=$itemId", 'trabajo fue agregado.');
			} else {
				$this->setredirect("index.php?option=com_egresados&task=agregar_trabajo&Itemid=$itemId", 'Tus datos no son válidos.', 'error');
			}

		} else {
			JError::raiseError( 403, JText::_('Access Forbidden') );
			return;
		}
	}

	function editar_trabajo() {
		$utils = $this->getModel('utils');

		if($utils->esUsuarioEgresado()) {
			$frm = $this->getView('formtrabajos', 'html');
			$codEgresado = $utils->getCodigoUsuarioEgresado();

			if (!$utils->existeEgresado($codEgresado)) { JError::raiseError( 404, JText::_('Not Found') ); return; }

			$frm->setData(
					$utils->getTrabajo(JRequest::getInt('codTrabajo')),
					$utils->getPaises(),
					$codEgresado
				);
			$frm->display();
		} else {
			JError::raiseError( 403, JText::_('Access Forbidden') );
			return;
		}
	}

	function editar_trabajo_save() {
		JRequest::checkToken() or die( 'Token invalido' );
		$utils = $this->getModel('utils');

		if($utils->esUsuarioEgresado()) {
			$codEgresado = $utils->getCodigoUsuarioEgresado();

			if (!$utils->existeEgresado($codEgresado)) { JError::raiseError( 404, JText::_('Not Found') ); return; }

			$mdlTrabajo = $this->getModel('trabajos');
			$itemId = JRequest::getVar('Itemid');

			if ($mdlTrabajo->agregarModificarTrabajo($codEgresado)) {
				$this->setredirect("index.php?option=com_egresados&task=ver_trabajos&cod_egresado=$codEgresado&Itemid=$itemId", 'trabajo fue editado.');
			} else {
				$codTrabajo = JRequest::getInt('codTrabajo');
				$this->setredirect("index.php?option=com_egresados&task=editar_trabajo&codTrabajo=$codTrabajo&Itemid=$itemId", 'Tus datos no son válidos.', 'error');
			}

		} else {
			JError::raiseError( 403, JText::_('Access Forbidden') );
			return;
		}
	}

}

?>
