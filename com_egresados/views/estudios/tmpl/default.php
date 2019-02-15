<?php
defined('_JEXEC')or die('Acceso Restringido');
?>
<style>
#hor-minimalist {
	font-size: 10px;
	background: #fff;
	border-collapse: collapse;
	text-align: center;
	width: 100%;
}
#hor-minimalist thead {
	border-bottom:4px solid #eee;
	border-left:0.5px solid #eee;
	border-right:0.5px solid #eee;
	font-size:11px;
	font-weight:bold;
	background-color:#D5D5E1;
}
#hor-minimalist th {
	font-size: 14px;
	font-weight: bold;
	color: #039;
	padding: 10px 8px;
	border-bottom: 2px solid #CBDEFA;
}
#hor-minimalist td {
	border-bottom: 1px solid #ccc;
	color: #669;
	padding: 6px 8px;
}
#hor-minimalist td.left {
	text-align: left;
}
#hor-minimalist td.anchofijo {
	width: 70px;
}
#hor-minimalist td.anchofijo-icono {
	width: 16px;
	padding: 0px 0px;
}
#hor-minimalist tbody tr:hover td {
	color: #009;
}
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
  }
  dt {
    float: left;
    clear: left;
    width: 50px;
    text-align: left;
    font-weight: bold;

  }
  dt:after {
    content: ":";
  }
  dd {
    margin: 0 0 0 30px;
  }
</style>
<script> function pregunta(url) { if(confirm("¿Está seguro que queire borrar este item?")) document.location.href=url; } </script>
<? echo $this->barNav; ?>
<div class="info"><? echo JText::_('DESCRIPCION_ESTUDIOS'); ?></div>
<? echo $this->egresado; ?>
<table id="hor-minimalist">
	<tr><thead>
		<td><? echo JText::_('NRO'); ?></td>
		<td><? echo JText::_('NOMBRE'); ?></td>
		<td><? echo JText::_('TIPO'); ?></td>
		<td><? echo JText::_('PAIS'); ?></td>
		<td><? echo JText::_('DURACION'); ?></td>
		<td><? echo JText::_('FECHA_INICIO'); ?></td>
		<td><? echo JText::_('FECHA_FIN'); ?></td>
		<? if ($this->editable) echo "<td></td><td></td>"; ?>
	</thead></tr>
<?
	if ($this->hayRegistros) {
		echo $this->estudios;
		echo "</table>";
	} else {
		echo "</table>";
		?><div class="alert"><? echo JText::_('NO_HAY_ESTUDIOS'); ?></div><?
	}
?>
<hr class="dotted" />
<div><ul class="navi">
<?
	echo "<li><a class=\"icon-external\" href=\"index.php?option=com_egresados&task=ver_perfil&cod_egresado=$this->codEgresado&Itemid=$this->item_id\">".JText::_('VER_PERFIL')."</a></li>";
	echo "<li><a class=\"icon-external\" href=\"index.php?option=com_egresados&task=ver_trabajos&cod_egresado=$this->codEgresado&Itemid=$this->item_id\">".JText::_('VER_TRABAJOS')."</a></li>";
?>
</ul></div>