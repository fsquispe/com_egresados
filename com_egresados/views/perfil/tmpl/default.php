<? defined('_JEXEC') or die('Restricted access'); ?>

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
  dl {
    padding: 0.5em;
	padding-left: 2.5em;
  }
  dt {
    float: left;
    clear: left;
    width: 160px;
    text-align: left;
    font-weight: bold;

  }
  dt:after {
    content: ":";
  }
  dd {
    margin: 0 0 0 110px;
    padding: 0 0 0.5em 0;
  }
</style>
<? echo $this->barNav; ?>
<div class="info"><? echo JText::_('DESCRIPCION_PERFIL'); ?></div>
<h6><? echo JText::_('INFORMACION_BASICA') ?></h6>
<dl>
<? foreach($this->perfil as $item) { ?>
	<dt><? echo JText::_('CODIGO'); ?></dt>
		<dd><? echo $item->codEgresado; ?></dd>
	<dt><? echo JText::_('APELLIDOS'); ?></dt>
		<dd><? echo $item->apellidos; ?></dd>
	<dt><? echo JText::_('NOMBRES'); ?></dt>
		<dd><? echo $item->nombre; ?></dd>
	<dt><? echo JText::_('ANYO_INGRESO'); ?></dt>
		<dd><? echo $item->anyoIngreso; ?></dd>
	<dt><? echo JText::_('ANYO_EGRESO'); ?></dt>
		<dd><? echo $item->anyoEgreso; ?></dd>
	<dt><? echo JText::_('SEMESTRE'); ?></dt>
		<dd><? echo $item->semestre; ?></dd>
<? } ?>
</dl>
<h6><? echo JText::_('INFORMACION_CONTACTO') ?></h6>
<dl>
<? foreach($this->detalle as $det) { ?>
	<dt><? echo JText::_('FECHA_NACIMIENTO'); ?></dt>
		<dd><? echo date('d/m/Y', $det->fechaNacimiento); ?></dd>
	<dt><? echo JText::_('LUGAR_NACIMIENTO'); ?></dt>
		<dd><? echo $det->lugarNacimiento; ?></dd>
	<dt><? echo JText::_('PAIS'); ?></dt>
		<dd><? echo $det->pais; ?></dd>
	<dt><? echo JText::_('DIRECCION'); ?></dt>
		<dd><? echo $det->direccion; ?></dd>
	<dt><? echo JText::_('ESTADO_CIVIL'); ?></dt>
		<dd><? echo $det->estadoCivil; ?></dd>
	<dt><? echo JText::_('TELEFONO_FIJO'); ?></dt>
		<dd><? echo $det->telefonoFijo; ?></dd>
	<dt><? echo JText::_('TELEFONO_MOVIL'); ?></dt>
		<dd><? echo $det->telefonoMovil; ?></dd>
	<dt><? echo JText::_('WEBSITE'); ?></dt>
		<dd><? echo $det->website; ?></dd>
	<dt><? echo JText::_('ACERCA_DE_EGRESADO'); ?></dt>
		<dd><? echo $det->acercaDeEgresado; ?></dd>
<? } ?>
</dl><br />
<hr class="dotted" />
<div><ul class="navi">
<?
	echo "<li><a class=\"icon-external\" href=\"index.php?option=com_egresados&task=ver_estudios&cod_egresado=$item->codEgresado&Itemid=$this->item_id\">".JText::_('VER_ESTUDIOS')."</a></li>";
	echo "<li><a class=\"icon-external\" href=\"index.php?option=com_egresados&task=ver_trabajos&cod_egresado=$item->codEgresado&Itemid=$this->item_id\">".JText::_('VER_TRABAJOS')."</a></li>";
?>
</ul></div>