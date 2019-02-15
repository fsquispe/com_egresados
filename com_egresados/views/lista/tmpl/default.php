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
	width: 60px;
}
#hor-minimalist tbody tr:hover td {
	color: #009;
}
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
<div class="info"><? echo JText::_('DESCRIPCION_LISTA'); ?></div>
<table id="hor-minimalist">
	<tr><thead>
		<td><? echo JText::_('NRO'); ?></td>
		<td><? echo JText::_('CODIGO'); ?></td>
		<td><? echo JText::_('APELLIDOS_Y_NOMBRES'); ?></td>
		<td><? echo JText::_('SEMESTRE'); ?></td>
		<td><? echo JText::_('PERFIL'); ?></td>
		<td><? echo JText::_('ESTUDIOS'); ?></td>
		<td><? echo JText::_('TRABAJOS'); ?></td>
	</thead></tr>
<? echo $this->egresantes; ?>
</table>