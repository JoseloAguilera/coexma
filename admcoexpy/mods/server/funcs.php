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
?>