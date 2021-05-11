<?php
	function putMySQlToData($mysqldata) {
		$data = "";
		$data = substr($mysqldata, 8,2)."/".substr($mysqldata, 5,2)."/".substr($mysqldata, 0,4);
		return $data;
	}

	function putDataToMySQl($data) {
		$mysqldata = "";
		$mysqldata = substr($data, 6,4)."-".substr($data, 3,2)."-".substr($data, 0,2);
		return $mysqldata;
	}

	function getMesporEscrito($data) {
		$mes = "";
		$data = substr($data, 5,2);//mês de uma data de visualização
		if ($data == "01") {
			$mes = "Janeiro";
		} else if ($data == "02") {
			$mes = "Fevereiro";
		} else if ($data == "03") {
			$mes = "Março";
		} else if ($data == "04") {
			$mes = "Abril";
		} else if ($data == "05") {
			$mes = "Maio";
		} else if ($data == "06") {
			$mes = "Julho";
		} else if ($data == "07") {
			$mes = "Junho";
		} else if ($data == "08") {
			$mes = "Agosto";
		} else if ($data == "09") {
			$mes = "Setembro";
		} else if ($data == "10") {
			$mes = "Outubro";
		} else if ($data == "11") {
			$mes = "Novembro";
		} else if ($data == "12") {
			$mes = "Dezembro";
		} 
		return $mes;
	}

	function getMesPY($mes) {
		if ($mes == "01") {
			$mes = "Janeiro";
		} else if ($mes == "02") {
			$mes = "Fevereiro";
		} else if ($mes == "03") {
			$mes = "Março";
		} else if ($mes == "04") {
			$mes = "Abril";
		} else if ($mes == "05") {
			$mes = "Maio";
		} else if ($mes == "06") {
			$mes = "Julho";
		} else if ($mes == "07") {
			$mes = "Junho";
		} else if ($mes == "08") {
			$mes = "Agosto";
		} else if ($mes == "09") {
			$mes = "Setembro";
		} else if ($mes == "10") {
			$mes = "Outubro";
		} else if ($mes == "11") {
			$mes = "Novembro";
		} else if ($mes == "12") {
			$mes = "Dezembro";
		} 
		return $mes;
	}

	function getPorcentagem($menor, $maior) {
		$aumento = $maior - $menor;
		$percentual = $aumento/$maior;
		$percentual = $percentual * 100;

		return number_format((float)$percentual, 2, '.', '');
	}

	function putMoneda($valor, $tipo) {
		if ($tipo == "U$") {
			$moeda = "U$ ".number_format($valor, 2, ',', '.');
		} else if ($tipo == "R$") {
			$moeda = "R$ ".number_format($valor, 2, ',', '.');
		} else if ($tipo == "G$") {
			$moeda = "G$ ".number_format($valor, 0, '', '.');
		}

		return $moeda;
	}

	function hex2rgba($color, $opacity = false) {
 
		$default = 'rgb(0,0,0)';
	 
		//Return default if no color provided
		if(empty($color)) {
			return $default; 
		}
	 
		//Sanitize $color if "#" is provided 
		if ($color[0] == '#' ) {
			$color = substr( $color, 1 );
		}
	
		//Check if color has 6 or 3 characters and get values
		if (strlen($color) == 6) {
			$hex = array( $color[0] . $color[1], $color[2] . $color[3], $color[4] . $color[5] );
		} elseif ( strlen( $color ) == 3 ) {
			$hex = array( $color[0] . $color[0], $color[1] . $color[1], $color[2] . $color[2] );
		} else {
			return $default;
		}
	
		//Convert hexadec to rgb
		$rgb =  array_map('hexdec', $hex);
	
		//Check if opacity is set(rgba or rgb)
		if($opacity){
			if(abs($opacity) > 1) {
				$opacity = 1.0;
			}
			$output = 'rgba('.implode(",",$rgb).','.$opacity.')';
		} else {
			$output = 'rgb('.implode(",",$rgb).')';
		}
	
		//Return rgb(a) color string
		return $output;
	}
?>