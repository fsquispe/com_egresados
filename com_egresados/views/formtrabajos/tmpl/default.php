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
	<? echo "<li><a class=\"icon-external\" href=\"index.php?option=com_egresados&task=ver_trabajos&cod_egresado=".$this->codEgresado."&Itemid=".$this->itemId."\">".JText::_('VOLVER')."</a></li>"; ?>
	</ul>
</div>

<div class="info"><?php if($this->esEditable) echo JText::_('DESCRIPCION_EDITAR_TRABAJO'); else echo JText::_('DESCRIPCION_AGREGAR_TRABAJO'); ?></div>
<div class="joomla">
	<div class="user">
		<form action="index.php" method="post" id="josForm" name="josForm" class="form-validate">
		<fieldset>
			<legend><?php if($this->esEditable) echo JText::_('EDITAR_TRABAJO'); else echo JText::_('AGREGAR_TRABAJO'); ?></legend>
			<div>
				<label class="label-left" id="nombreEmpresaMsg" for="nombreEmpresa">
					<?php echo JText::_( 'EMPRESA' ); ?>:
				</label>
				<input style="width: 250px;" type="text" name="nombreEmpresa" id="nombreEmpresa" value="<? echo $this->trabajo->nombreEmpresa; ?>" maxlength="45" /> *
			</div>
			<div>
				<label class="label-left" id="puestoMsg" for="puesto">
					<?php echo JText::_( 'PUESTO' ); ?>:
				</label>
				<input style="width: 250px;" type="text" name="puesto" id="puesto" value="<? echo $this->trabajo->puesto; ?>" maxlength="45" /> *
			</div>
			<div>
				<label class="label-left" id="rubroMsg" for="rubro">
					<?php echo JText::_( 'RUBRO' ); ?>:
				</label>
				<input style="width: 250px;" type="text" name="rubro" id="rubro" value="<? echo $this->trabajo->rubro; ?>" maxlength="35" /> *
			</div>
			<div>
				<label class="label-left" id="responsabilidadesMsg" for="responsabilidades">
					<?php echo JText::_( 'RESPONSABILIDADES' ); ?>:
				</label>
				<input style="width: 250px;" type="text" name="responsabilidades" id="responsabilidades" value="<? echo $this->trabajo->responsabilidades; ?>" maxlength="45" /> *
			</div>
			<div>
				<label class="label-left" id="paisMsg" for="pais">
					<?php echo JText::_( 'PAIS' ); ?>:
				</label>
				<select name="pais" id="pais"/> *
					<?
						foreach($this->paises as $pais) {
							if(($this->trabajo->codPais == $pais->codPais) && ($this->esEditable))
								echo "<option selected name=\"pais\" value=\"".$pais->codPais."\">".$pais->nombre."</option>";
							else
							    echo "<option name=\"pais\" value=\"".$pais->codPais."\">".$pais->nombre."</option>";
						}
					?>
				</select>
			</div>
			<div>
				<label class="label-left" id="fechaInicioMsg" for="fechaInicio">
					<?php echo JText::_( 'FECHA_INICIO' ); ?>:
				</label>
				<input style="width: 80px;" type="text" style="cursor: pointer;" onclick="return showCalendar('fechaInicio', '%d/%m/%Y');" readonly="readonly" name="fechaInicio" id="fechaInicio" value="<? if($this->esEditable) echo date('d/m/Y', $this->trabajo->fechaInicio); ?>" maxlength="10" /> *
			</div>
			<div>
				<label class="label-left" id="fechaFinMsg" for="fechaFin">
					<?php echo JText::_( 'FECHA_FIN' ); ?>:
				</label>
				<input style="width: 80px;" type="text" style="cursor: pointer;" onclick="return showCalendar('fechaFin', '%d/%m/%Y');" readonly="readonly" name="fechaFin" id="fechaFin" value="<? if($this->esEditable) echo date('d/m/Y', $this->trabajo->fechaFin); ?>" maxlength="10" /> *
			</div>
			<div>
				<div class="alert"><?php echo JText::_( 'TODOS_CAMPOS_REQUERIDOS' ); ?></div>
			</div>
			<div>
				<button class="button validate" type="submit"><?php if($this->esEditable) echo JText::_('GUARDAR'); else echo JText::_('AGREGAR'); ?></button>
			</div>
		</fieldset>
		<input type="hidden" name="task" value="<? if($this->esEditable) echo "editar_trabajo_save"; else echo "agregar_trabajo_save"; ?>" />
		<input type="hidden" name="option" value="com_egresados" />
		<? if($this->esEditable) echo "<input type=\"hidden\" name=\"codTrabajo\" value=\"".$this->trabajo->codTrabajo."\" />" ?>
		<? if($this->esEditable) echo "<input type=\"hidden\" name=\"codEgresado\" value=\"".$this->trabajo->codEgresado."\" />" ?>
		<input type="hidden" name="Itemid" value="<? echo $this->itemId; ?>" />
		<?php echo JHTML::_( 'form.token' ); ?>
		</form>
	</div>
</div>
