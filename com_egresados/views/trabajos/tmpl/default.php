<?php
defined('_JEXEC') or die('Acceso Restringido');
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

<div style="height: 28px;">
	<ul class="navi">
		<?
			echo "<li><a class=\"icon-external\" href=\"index.php?option=com_egresados&task=lista&Itemid=$this->itemId\">".JText::_('VER_LISTA_EGRESADOS')."</a></li>";
			if ($this->esEditable) echo "<li><a class=\"icon-file\" href=\"index.php?option=com_egresados&task=agregar_trabajo&Itemid=$this->itemId\">".JText::_('AGREGAR_TRABAJO')."</a></li>";
		?>
	</ul>
</div>

<div class="info"><? echo JText::_('DESCRIPCION_TRABAJOS'); ?></div>

<dl>
	<?
		echo "<dt>".JText::_('CODIGO')."</dt><dd><em class=\"box\">".$this->egresado->codEgresado."</em></dd>";
		echo "<dt>".JText::_('NOMBRES')."</dt><dd><em class=\"box\">".$this->egresado->nombres."</em></dd>";
		echo "<dt>".JText::_('SEMESTRE')."</dt><dd><em class=\"box\">".$this->egresado->semestre."</em></dd>";
	?>
</dl>

<table id="hor-minimalist">
	<tr><thead>
		<td><? echo JText::_('NRO'); ?></td>
		<td><? echo JText::_('EMPRESA'); ?></td>
		<td><? echo JText::_('PUESTO'); ?></td>
		<td><? echo JText::_('RUBRO'); ?></td>
		<td><? echo JText::_('RESPONSABILIDADES'); ?></td>
		<td><? echo JText::_('PAIS'); ?></td>
		<td><? echo JText::_('FECHA_INICIO'); ?></td>
		<td><? echo JText::_('FECHA_FIN'); ?></td>
		<? if ($this->esEditable) echo "<td></td><td></td>"; ?>
	</thead></tr>
<?
	if ($this->existenTrabajos) {
		$i = 1;
		foreach($this->trabajos as $trabajo) {
			echo "<tr>";
			echo "<td>$i</td>";
			echo "<td class=\"left\">$trabajo->nombreEmpresa</td>";
			echo "<td>$trabajo->puesto</td>";
			echo "<td>$trabajo->rubro</td>";
			echo "<td>$trabajo->responsabilidades</td>";
			echo "<td>$trabajo->pais</td>";
			echo "<td class=\"anchofijo\">".date('d/m/Y', $trabajo->fechaInicio)."</td>";
			echo "<td class=\"anchofijo\">".date('d/m/Y', $trabajo->fechaFin)."</td>";

			if($this->esEditable) {
				echo "<td class=\"anchofijo-icono\"><a title=\"".JText::_('EDITAR')."\" class=\"icon-editar\" href=\"index.php?option=com_egresados&task=editar_trabajo&codTrabajo=$trabajo->codTrabajo&Itemid=$this->itemId\"></a></td>";
				echo "<td class=\"anchofijo-icono\"><a title=\"".JText::_('ELIMINAR')."\" class=\"icon-eliminar\" style=\"cursor: pointer;\" onclick=\"pregunta('index.php?option=com_egresados&task=eliminar_trabajo&codTrabajo=$trabajo->codTrabajo&Itemid=$this->itemId');\"></td>";
			}

			echo "</tr>";
			$i++;
		}
		echo "</table>";
	} else {
		echo "</table>";
		echo "<div class=\"alert\">".JText::_('NO_HAY_TRABAJOS')."</div>";
	}
?>
<hr class="dotted" />
<div><ul class="navi">
<?
	echo "<li><a class=\"icon-external\" href=\"index.php?option=com_egresados&task=ver_perfil&cod_egresado=".$this->egresado->codEgresado."&Itemid=".$this->itemId."\">".JText::_('VER_PERFIL')."</a></li>";
	echo "<li><a class=\"icon-external\" href=\"index.php?option=com_egresados&task=ver_estudios&cod_egresado=".$this->egresado->codEgresado."&Itemid=".$this->itemId."\">".JText::_('VER_ESTUDIOS')."</a></li>";
?>
</ul></div>