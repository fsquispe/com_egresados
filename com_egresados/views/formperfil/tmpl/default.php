<?php defined('_JEXEC') or die('Restricted access'); ?>
<style>
.navi {
	list-style:none;
	margin:0;
	padding:0;
}
.navi li {
	margin:2px;
	padding:2px;
	float:left;
}
</style>
<? jimport( 'joomla.html.html' ); ?>
<? JHtml::_('behavior.calendar'); ?>

<div style="height: 28px;">
	<ul class="navi">
	<? echo "<li><a class=\"icon-external\" href=\"index.php?option=com_egresados&task=ver_perfil&cod_egresado=$this->codEgresado&Itemid=$this->itemId\">".JText::_('VOLVER')."</a></li>"; ?>
	</ul>
</div>

<div class="info"><?php echo JText::_('DESCRIPCION_EDITAR_PERFIL'); ?></div>
<div class="joomla">
	<div class="user">
		<form action="index.php" method="post" id="josForm" name="josForm" class="form-validate">
		<fieldset>
			<legend><?php echo JText::_('EDITAR_PERFIL'); ?></legend>
			<div>
				<label class="label-left" id="fechaNacimientoMsg" for="fechaNacimiento">
					<?php echo JText::_( 'FECHA_NACIMIENTO' ); ?>:
				</label>
				<input style="width: 80px;" type="text" style="cursor: pointer;" onclick="return showCalendar('fechaNacimiento', '%d/%m/%Y');" readonly="readonly" name="fechaNacimiento" id="fechaNacimiento" value="<? if($this->existeDetalle) echo date('d/m/Y', $this->detalle->fechaNacimiento); ?>" maxlength="10" /> *
			</div>
			<div>
				<label class="label-left" id="lugarNacimientoMsg" for="lugarNacimiento">
					<?php echo JText::_( 'LUGAR_NACIMIENTO' ); ?>:
				</label>
				<input style="width: 200px;" type="text" name="lugarNacimiento" id="lugarNacimiento" value="<? echo $this->detalle->lugarNacimiento ?>" maxlength="40" /> *
			</div>
			<div>
				<label class="label-left" id="paisMsg" for="pais">
					<?php echo JText::_( 'PAIS' ); ?>:
				</label>
				<select name="pais" id="pais"/> *
					<?
						foreach($this->paises as $pais) {
							if(($this->detalle->codPais == $pais->codPais) && ($this->existeDetalle))
								echo "<option selected name=\"pais\" value=\"".$pais->codPais."\">".$pais->nombre."</option>";
							else
							    echo "<option name=\"pais\" value=\"".$pais->codPais."\">".$pais->nombre."</option>";
						}
					?>
				</select>
			</div>
			<div>
				<label class="label-left" id="direccionMsg" for="direccion">
					<?php echo JText::_( 'DIRECCION' ); ?>:
				</label>
				<input style="width: 250px;" type="text" name="direccion" id="direccion" value="<? echo $this->detalle->direccion ?>" maxlength="100" /> *
			</div>
			<div>
				<label class="label-left" id="estadoCivilMsg" for="estadoCivil">
					<?php echo JText::_( 'ESTADO_CIVIL' ); ?>:
				</label>
				<select name="estadoCivil" id="estadoCivil"/> *
					<?
						foreach($this->estadosCiviles as $estCiv) {
							if(($this->detalle->codEstadoCivil == $est->codEstadoCivil) && ($this->existeDetalle))
								echo "<option selected name=\"estadoCivil\" value=\"".$estCiv->codEstadoCivil."\">".$estCiv->nombre."</option>";
							else
							    echo "<option name=\"estadoCivil\" value=\"".$estCiv->codEstadoCivil."\">".$estCiv->nombre."</option>";
						}
					?>
				</select>
			</div>
			<div>
				<label class="label-left" id="telefonoFijoMsg" for="telefonoFijo">
					<?php echo JText::_( 'TELEFONO_FIJO' ); ?>:
				</label>
				<input style="width: 110px;" type="text" name="telefonoFijo" id="telefonoFijo" value="<? echo $this->detalle->telefonoFijo; ?>" maxlength="15" /> *
			</div>
			<div>
				<label class="label-left" id="telefonoMovilMsg" for="telefonoMovil">
					<?php echo JText::_( 'TELEFONO_MOVIL' ); ?>:
				</label>
				<input style="width: 110px;" type="text" name="telefonoMovil" id="telefonoMovil" value="<? echo $this->detalle->telefonoMovil; ?>" maxlength="15" /> *
			</div>
			<div>
				<label class="label-left" id="websiteMsg" for="website">
					<?php echo JText::_( 'WEBSITE' ); ?>:
				</label>
				<input style="width: 320px;" type="text" name="website" id="website" value="<? echo $this->detalle->website; ?>" maxlength="100" /> *
			</div>
			<div>
				<label class="label-left" id="acercaDeEgresadoMsg" for="acercaDeEgresado">
					<?php echo JText::_( 'ACERCA_DE_EGRESADO' ); ?>:
				</label>
				<textarea id="acercaDeEgresado" name="acercaDeEgresado" maxlength="255" rows="5" cols="45"><? echo $this->detalle->acercaDeEgresado; ?></textarea>
			</div>
			<div>
				<div class="alert"><?php echo JText::_( 'TODOS_CAMPOS_REQUERIDOS' ); ?></div>
			</div>
			<div>
				<button class="button validate" type="submit"><? echo JText::_('GUARDAR'); ?></button>
			</div>
			<input type="hidden" name="task" value="editar_perfil_save" />
			<input type="hidden" name="option" value="com_egresados" />
			<input type="hidden" name="codEgresado" value="<? echo $this->codEgresado ?>" />
			<input type="hidden" name="Itemid" value="<? echo $this->itemId ?>" />
			<?php echo JHTML::_( 'form.token' ); ?>
		</fieldset>
		</form>
	</div>
</div>
