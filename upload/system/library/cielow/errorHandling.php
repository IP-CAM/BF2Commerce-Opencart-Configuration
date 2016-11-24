<?php
$logFile = DIR_LOGS . "cielow_error.log";

function VerificaErro($vmPost, $vmResposta) {
	$error_msg = null;

	try {
		if(stripos($vmResposta, "SSL certificate problem") !== false) {
			throw new Exception("CERTIFICADO INVÁLIDO - O certificado da transação não foi aprovado", "099");
		}

		$objResposta = simplexml_load_string($vmResposta, null, LIBXML_NOERROR);
		if($objResposta == null) {
			throw new Exception("HTTP READ TIMEOUT - O limite de tempo da transação foi estourado", "099");
		}
	}
	catch (Exception $ex) {
		$error_msg = "Código do erro: " . $ex->getCode() . "\n";
		$error_msg .= "Mensagem: " . $ex->getMessage() . "\n";

		echo $error_msg;

		$error_msg .= "XML de envio: " . "\n" . $vmPost;

		trigger_error($error_msg, E_USER_ERROR);

		return true;
	}

	if($objResposta->getName() == "erro") {
		$error_msg = "Código do erro: " . $objResposta->codigo . "\n";
		$error_msg .= "Mensagem: " . utf8_decode($objResposta->mensagem) . "\n";

		echo $error_msg;

		$error_msg .= "XML de envio: " . "\n" . $vmPost;

		trigger_error($error_msg, E_USER_ERROR);
	}
}

function Handler($eNum, $eMsg, $file, $line, $eVars) {
	$logFile = DIR_LOGS . "cielow_error.log";
	$e       = "";
	$Data    = date("d-m-Y H:i:s (T)");

	$errortype = array(
			E_ERROR 			=> 'ERROR',
			E_WARNING			=> 'WARNING',
			E_PARSE				=> 'PARSING ERROR',
			E_NOTICE			=> 'RUNTIME NOTICE',
			E_CORE_ERROR		=> 'CORE ERROR',
			E_CORE_WARNING      => 'CORE WARNING',
			E_COMPILE_ERROR     => 'COMPILE ERROR',
			E_COMPILE_WARNING   => 'COMPILE WARNING',
			E_USER_ERROR        => 'ERRO NA TRANSACAO',
			E_USER_WARNING      => 'USER WARNING',
			E_USER_NOTICE       => 'USER NOTICE',
			E_STRICT            => 'RUNTIME NOTICE',
			E_RECOVERABLE_ERROR	=> 'CATCHABLE FATAL ERROR'
			);

	$e .= "Erro: " . $eNum . " " . $errortype[$eNum] . "\n";
	$e .= "Registrado em: " . $Data . "\n";
	$e .= "No arquivo: " . $file . " (Linha: " . $line .")\n";
	$e .= "Com a mensagem: " . "\n" . $eMsg . "\n\n";

	error_log($e, 3, $logFile);

	exit();
}

$olderror = set_error_handler("Handler");
ini_set('error_log', $logFile);
ini_set('log_errors', 'On');
ini_set('display_errors', 'On');
ini_set("date.timezone", "America/Sao_Paulo");