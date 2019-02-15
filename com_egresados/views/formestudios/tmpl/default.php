<?php defined('_JEXEC') or die('Restricted access'); ?>
<style>
#navi {
	list-style:none;
	margin:0;
	padding:0;
}
#navi li {
	margin:2px;
	padding:2px;
	float:left;
}
</style>
<? jimport( 'joomla.html.html' ); ?>
<? JHtml::_('behavior.calendar'); ?>
<? echo $this->barNav; ?>
<div class="info"><?php if($this->editable) echo JText::_('DESCRIPCION_EDITAR_ESTUDIO'); else echo JText::_('DESCRIPCION_AGREGAR_ESTUDIO'); ?></div>
<div class="joomla">
	<div class="user">
		<form action="index.php" method="post" id="josForm" name="josForm" class="form-validate">
		<fieldset>
			<legend><?php if($this->editable) echo JText::_('EDITAR_ESTUDIO'); else echo JText::_('AGREGAR_ESTUDIO'); ?></legend>
			<div>
				<label class="label-left" id="nombremsg" for="nombre">
					<?php echo JText::_( 'NOMBRE' ); ?>:
				</label>
				<input style="width: 350px;" type="text" name="nombre" id="nombre" value="<? if($this->editable) echo $this->var_nombre; ?>" maxlength="100" /> *
			</div>
			<div>
				<label class="label-left" id="tipo_cursomsg" for="tipo_curso">
					<?php echo JText::_( 'TIPO_CURSO' ); ?>:
				</label>
				<select name="tipo_curso" id="tipo_curso"/> *
					<?php echo $this->tiposCurso; ?>
				</select>
			</div>
			<div>
				<label class="label-left" id="paismsg" for="pais">
					<?php echo JText::_( 'PAIS' ); ?>:
				</label>
				<select name="pais" id="pais"/> *
					<?php echo $this->paises; ?>
				</select>
			</div>
			<div>
				<label class="label-left" id="duracionmsg" for="duracion">
					<?php echo JText::_( 'DURACION' ); ?>:
				</label>
				<input style="width: 50px;" type="text" name="duracion" id="duracion" value="<? if($this->editable) echo $this->var_duracion; ?>" maxlength="4" /> *
			</div>
			<div>
				<label class="label-left" id="tipo_medicionmsg" for="tipo_medicion">
					<?php echo JText::_( 'TIPO_MEDICION' ); ?>:
				</label>
				<select name="tipo_medicion" id="tipo_medicion"/> *
					<?php echo $this->tiposMedicion; ?>
				</select>
			</div>
			<div>
				<label class="label-left" id="fecha_iniciomsg" for="fecha_inicio">
					<?php echo JText::_( 'FECHA_INICIO' ); ?>:
				</label>
				<input style="width: 80px;" type="text" style="cursor: pointer;" onclick="return showCalendar('fecha_inicio', '%d/%m/%Y');" readonly="readonly" name="fecha_inicio" id="fecha_inicio" value="<? if($this->editable) echo $this->var_fechaInicio; ?>" maxlength="10" /> *
			</div>
			<div>
				<label class="label-left" id="fecha_finomsg" for="fecha_fin">
					<?php echo JText::_( 'FECHA_FIN' ); ?>:
				</label>
				<input style="width: 80px;" type="text" style="cursor: pointer;" onclick="return showCalendar('fecha_fin', '%d/%m/%Y');" readonly="readonly" name="fecha_fin" id="fecha_fin" value="<? if($this->editable) echo $this->var_fechaFin; ?>" maxlength="10" /> *
			</div>
			<div>
				<div class="alert"><?php echo JText::_( 'TODOS_CAMPOS_REQUERIDOS' ); ?></div>
			</div>
			<div>
				<button class="button validate" type="submit"><?php if($this->editable) echo JText::_('GUARDAR'); else echo JText::_('AGREGAR'); ?></button>
			</div>
		</fieldset>
		<input type="hidden" name="task" value="<? if($this->editable) echo "editar_estudio_save"; else echo "agregar_estudio_save"; ?>" />
		<input type="hidden" name="option" value="com_egresados" />
		<? if($this->editable) echo "<input type=\"hidden\" name=\"cod_estudio\" value=\"$this->var_codEstudio\" />" ?>
		<? $item_id = JRequest::getVar('Itemid'); ?>
		<input type="hidden" name="Itemid" value="<? echo $item_id; ?>" />
		<?php echo JHTML::_( 'form.token' ); ?>
		</form>
	</div>
</div>
