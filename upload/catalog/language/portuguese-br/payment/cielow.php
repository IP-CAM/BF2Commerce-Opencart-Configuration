<?php
// Heading
$_['heading_title']       = 'Cupom de pagamento';

// Text
$_['text_basket']         = 'Carrinho de compras';
$_['text_checkout']       = 'Finalizar pedido';
$_['text_success']        = 'Cupom de pagamento';
$_['text_payment']        = 'Seu pedido será enviado assim que o pagamento for confirmado.';
$_['text_informacoes']    = 'Dados para o pagamento';
$_['text_carregando']     = 'Carregando...';
$_['text_autorizando']    = 'Autorizando pagamento...';
$_['text_autorizou']      = 'Pagamento autorizado! Aguarde...';
$_['text_de']             = 'de';
$_['text_total']          = 'no total de ';
$_['text_juros']          = 'ao mês';
$_['text_sem_juros']      = 'sem juros';
$_['text_cartao_credito'] = 'Cartão de Crédito';
$_['text_visa']           = 'Visa';
$_['text_mastercard']     = 'Mastercad';
$_['text_diners']         = 'Diners';
$_['text_discover']       = 'Discover';
$_['text_elo']            = 'Elo';
$_['text_amex']           = 'American Express';
$_['text_jcb']            = 'JCB';
$_['text_aura']           = 'Aura';
$_['text_mes']            = 'Mês';
$_['text_ano']            = 'Ano';
$_['text_autorizado']     = 'Autorizado';
$_['text_capturado']      = 'Capturado';
$_['text_nao_autorizado'] = 'Não autorizado';
$_['text_importante']     = '<h2>IMPORTANTE</h2><br />Seu pagamento foi autorizado com sucesso, entretanto seu pedido ficará sujeito a aprovação da loja, que validará as informações do seu pedido.<br />Caso seu pedido não seja aprovado pela loja, o valor pago será estornado.<br /><br />Qualquer dúvida, entre em contato com nosso atendimento que teremos o prazer de lhe atender.<br /><br /><strong>Obrigado pela preferência.</strong>';

// Button
$_['button_pagar']        = 'Confirmar pagamento';
$_['button_imprimir']     = 'Imprimir comprovante';

// Entry
$_['entry_bandeira']      = 'Bandeira do cartão: ';
$_['entry_parcelas']      = 'Parcelado em: ';
$_['entry_cartao']        = 'Número do seu cartão ';
$_['entry_validade']      = 'Cartão válido até: ';
$_['entry_codigo']        = 'Código de segurança: ';
$_['entry_pedido']        = 'Pedido: ';
$_['entry_data']          = 'Data: ';
$_['entry_tipo']          = 'Pago com: ';
$_['entry_tid']           = 'TID: ';
$_['entry_nsu']           = 'NSU: ';
$_['entry_status']        = 'Status: ';
$_['entry_erro']          = 'Erro: ';
$_['entry_mensagem']      = 'Mensagem: ';

//Help
$_['help_codigo']         = 'Na maioria dos cartões são os 3 dígitos no verso do cartão. No American Express, são os 4 digitos na frente do cartão. No Aura, são os 3 últimos dígitos do número do cartão.';

// Error
$_['error_parcelas']      = 'É necessário selecionar um parcelamento.';
$_['error_cartao']        = 'O número do cartão não é válido.';
$_['error_mes']           = 'Selecione o mês.';
$_['error_ano']           = 'Selecione o ano.';
$_['error_codigo']        = 'O código de segurança não é válido.';
$_['error_nao_autorizou'] = 'Pagamento não autorizado!';
$_['error_nao_producao']  = '<strong>Atenção:</strong><br />Você está no ambiente de teste, por isso, nenhum pagamento será validado.<br />No ambiente de teste, a Cielo autorizarará os pedidos de pagamento que tiverem um valor que não contenha centavos, caso contenha centavos, a Cielo negará.<br />No ambiente de teste, não é recomendado utilizar dados de cartões válidos, por isso, utilize qualquer informação não válida para teste.';
$_['error_preenchimento'] = '<strong>Atenção:</strong><br />Todos os campos são de preenchimento obrigatório.';
$_['error_configuracao']  = '<strong>Atenção:</strong><br />Não foi possível autorizar o seu pagamento por problemas técnicos.<br />Tente novamente mais tarde ou selecione outra forma de pagamento.<br />Em caso de dúvidas, entre em contato com nosso atendimento.';
$_['error_status']        = '<strong>Atenção:</strong><br />Não foi possível obter uma resposta sobre a autorização do seu pagamento.<br />Tente novamente ou selecione outra forma de pagamento.<br />Em caso de dúvidas, entre em contato com nosso atendimento.';
$_['error_autorizacao']   = '<strong>Seu pagamento não foi aprovado.</strong><br />Verifique se você preencheu todos os campos corretamente e se você possui limite disponível para o pagamento do pedido.<br /><strong>Importante:</strong> Se o seu cartão estiver bloqueado ou com alguma restrição, seu pagamento não será autorizado.<br />Para mais informações entre em contato com o banco emissor do seu cartão.<br /><br />Você pode tentar outro cartão ou selecionar outra forma de pagamento.<br />Em caso de dúvidas, entre em contato com nosso atendimento.';