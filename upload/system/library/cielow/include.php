<?php
if ($this->config->get('cielow_ambiente') == 1) {
    define('ENDERECO',"https://qasecommerce.cielo.com.br/servicos/ecommwsec.do");
} else {
    define('ENDERECO',"https://ecommerce.cielo.com.br/servicos/ecommwsec.do");
}

define('VERSAO', "1.3.0");

if(!isset($_SESSION["pedidos"])) {
	$_SESSION["pedidos"] = new ArrayObject();
}

function httprequest($paEndereco, $paPost) {
	$sessao_curl = curl_init();

	curl_setopt($sessao_curl, CURLOPT_URL, $paEndereco);
	curl_setopt($sessao_curl, CURLOPT_FAILONERROR, true);
	curl_setopt($sessao_curl, CURLOPT_SSL_VERIFYPEER, true);
	curl_setopt($sessao_curl, CURLOPT_SSL_VERIFYHOST, 2);
	curl_setopt($sessao_curl, CURLOPT_CAINFO, DIR_SYSTEM . "/library/cielow/ssl/VeriSignClass3PublicPrimaryCertificationAuthority-G5.crt");
	curl_setopt($sessao_curl, CURLOPT_SSLVERSION, 4);
	curl_setopt($sessao_curl, CURLOPT_CONNECTTIMEOUT, 10);
	curl_setopt($sessao_curl, CURLOPT_TIMEOUT, 40);
	curl_setopt($sessao_curl, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($sessao_curl, CURLOPT_POST, true);
	curl_setopt($sessao_curl, CURLOPT_POSTFIELDS, $paPost);

	$resultado = curl_exec($sessao_curl);

	curl_close($sessao_curl);

	if ($resultado) {
		return $resultado;
	} else {
		return curl_error($sessao_curl);
	}
}