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
<? echo $this->barNav; ?>
<div class="info"><?php echo JText::_('DESCRIPCION_REGISTRO'); ?></div>
<div class="joomla">
	<div class="user">
		<form action="index.php" method="post" id="josForm" name="josForm" class="form-validate">
		<fieldset>
			<legend><?php echo JText::_('REGISTRO_EGRESADO'); ?></legend>
			<div>
				<label class="label-left" id="codigomsg" for="codigo">
					<?php echo JText::_( 'CODIGO' ); ?>:
				</label>
				<input type="text" name="codigo" id="codigo" value="" maxlength="6" /> *
			</div>
			<div>
				<label class="label-left" id="anyio-ingresomsg" for="anyio-ingreso">
					<?php echo JText::_( 'ANYO_INGRESO' ); ?>:
				</label>
				<input type="text" id="anyio-ingreso" name="anyio-ingreso" value="" maxlength="4" /> *
			</div>
			<div>
				<label class="label-left" id="anyio-egresomsg" for="anyio-egreso">
					<?php echo JText::_( 'ANYO_EGRESO' ); ?>:
				</label>
				<input type="text" id="anyio-egreso" name="anyio-egreso" value="" maxlength="4" /> *
			</div>
			<div>
				<label class="label-left" id="semestremsg" for="semestre">
					<?php echo JText::_( 'SEMESTRE' ); ?>:
				</label>
				<select name="semestre" id="semestre" /> *
					<?php echo $this->semestres; ?>
				</select>
			</div>
			<div>
				<div class="alert"><?php echo JText::_( 'TODOS_CAMPOS_REQUERIDOS' ); ?></div>
			</div>
			<div>
				<button class="button validate" type="submit"><?php echo JText::_('REGISTRAR'); ?></button>
			</div>
		</fieldset>
		<input type="hidden" name="task" value="registro_save" />
		<input type="hidden" name="option" value="com_egresados" />
		<? $item_id = JRequest::getVar('Itemid'); ?>
		<input type="hidden" name="Itemid" value="<? echo $item_id; ?>" />
		<?php echo JHTML::_( 'form.token' ); ?>
		</form>
	</div>
</div>
