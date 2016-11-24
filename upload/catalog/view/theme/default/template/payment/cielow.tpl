<?php if ($layout) { ?>
	<link href="catalog/view/javascript/jquery/cielow/skeleton/normalize.css" rel="stylesheet" type="text/css" />
	<link href="catalog/view/javascript/jquery/cielow/skeleton/skeleton.css" rel="stylesheet" type="text/css" />
	<div id="responsivo">
	  <?php if ($ambiente) { ?>
	  <div class="alert-warning" id="attention"><?php echo $error_nao_producao; ?></div>
	  <?php } ?>
	  <h3><?php echo $text_informacoes; ?></h3>
	  <form onkeypress="return event.keyCode != 13" id="payment">
		<div class="row-form">
		  <?php $i=1; foreach($bandeiras  as $bandeira => $parcelamento) { ?>
		  <div class="two columns value">
			<input type="radio" name="bandeira" id="input-bandeira" value="<?php echo $bandeira; ?>" <?php echo ($i == 1) ? 'checked' : ''; ?> />
			<img alt="<?php echo strtoupper($bandeira); ?>" title="<?php echo strtoupper($bandeira); ?>" src="<?php echo HTTPS_SERVER . 'image/cielow/' . strtolower($bandeira) . '.png'; ?>" border="0" />
		  </div>
		  <?php $i++; } ?>
		</div>
		<div class="row-form">
		  <div class="six columns value">
			<label class="" for="input-parcelas"><strong><?php echo $entry_parcelas; ?></strong></label>
			<select name="parcelas" id="input-parcelas" class="u-full-width">
			</select>
		  </div>
		  <div class="six columns value">
			<label for="input-cartao"><?php echo $entry_cartao; ?><span id='bandeiraEscolhida'></span>:</label>
			<input type="text" name="cartao" value="" placeholder="" id="input-cartao" maxlength="19" autocomplete="cc-number" class="u-full-width" />
		  </div>
		</div>
		<div class="row-form">
		  <div class="four columns value">
			<label class="" for="input-mes"><strong><?php echo $entry_validade; ?></strong></label>
			<select name="mes" id="input-mes" class="u-full-width">
			  <option value=""><?php echo $text_mes; ?></option>
			  <?php foreach ($meses as $mes) { ?>
			  <option value="<?php echo $mes['value']; ?>"><?php echo $mes['text']; ?></option>
			  <?php } ?>  
			</select>
		  </div>
		  <div class="four columns value">
			<label class="" for="input-mes">&nbsp;</label>
			<select name="ano" id="input-ano" class="u-full-width">
			  <option value=""><?php echo $text_ano; ?></option>
			  <?php foreach ($anos as $ano) { ?>
			  <option value="<?php echo $ano['value']; ?>"><?php echo $ano['text']; ?></option>
			  <?php } ?>
			</select>
		  </div>
		  <div class="four columns value">
			<label class="u-full-width" for="input-codigo"><strong><?php echo $entry_codigo; ?></strong></label>
			<input type="text" name="codigo" value="" placeholder="" id="input-codigo" maxlength="4" autocomplete="off" class="u-full-width" />
		  </div>
		</div>
		<input class="button-primary" value="<?php echo $button_pagar; ?>" id="button-confirm" data-loading-text="<?php echo $text_carregando; ?>" type="button">
	  </form>
	  <div class="alert alert-warning" id="warning"></div>
	</div>
<?php } else { ?>
	<?php if ($ambiente) { ?>
	<div class="alert alert-danger" id="attention" role="alert"><?php echo $error_nao_producao; ?></div>
	<?php } ?>
	<form class="form-horizontal" onkeypress="return event.keyCode != 13">
	  <fieldset id="payment">
		<legend><i class="fa fa-credit-card"></i> <strong><?php echo $text_informacoes; ?></strong></legend>
		<div class="row">
		  <div class="col-sm-12">
			<div class="form-group">
			  <?php $i=1; foreach($bandeiras  as $bandeira => $parcelamento) { ?>
			  <div class="col-xs-6 col-sm-2">
				<input type="radio" name="bandeira" id="input-bandeira" value="<?php echo $bandeira; ?>" <?php echo ($i == 1) ? 'checked' : ''; ?> />
				<img alt="<?php echo strtoupper($bandeira); ?>" title="<?php echo strtoupper($bandeira); ?>" src="<?php echo HTTPS_SERVER . 'image/cielow/' . strtolower($bandeira) . '.png'; ?>" border="0" />
				<span class="badge"><?php echo $parcelamento; ?>x</span>
			  </div>
			  <?php $i++; } ?>
			</div>
		  </div>
		</div>
		<div class="row">
		  <div class="col-sm-12">
			<div class="form-group">
			  <div class="col-sm-4">
				<label class="control-label" for="input-parcelas"><strong><?php echo $entry_parcelas; ?></strong></label>
				<select name="parcelas" class="form-control">
				</select>
			  </div>
			</div>
		  </div>
		</div>
		<div class="row">
		  <div class="col-sm-12">
			<div class="form-group">
			  <div class="col-sm-3">
				<label class="control-label" for="input-cartao"><strong><?php echo $entry_cartao; ?><span id='bandeiraEscolhida'></span>:</strong></label>
				<input type="text" name="cartao" value="" placeholder="" id="input-cartao" maxlength="19" autocomplete="cc-number" class="form-control" />
			  </div>
			  <div class="col-xs-6 col-sm-3">
				<label class="control-label" for="input-mes"><strong><?php echo $entry_validade; ?></strong></label>
				<select name="mes" class="form-control">
				  <option value=""><?php echo $text_mes; ?></option>
				  <?php foreach ($meses as $mes) { ?>
				  <option value="<?php echo $mes['value']; ?>"><?php echo $mes['text']; ?></option>
				  <?php } ?>  
				</select>
			  </div>
			  <div class="col-xs-6 col-sm-3">
				<label class="control-label" for="input-ano">&nbsp;</label>
				<select name="ano" class="form-control">
				  <option value=""><?php echo $text_ano; ?></option>
				  <?php foreach ($anos as $ano) { ?>
				  <option value="<?php echo $ano['value']; ?>"><?php echo $ano['text']; ?></option>
				  <?php } ?>  
				</select>
			  </div>
			  <div class="col-sm-3">
				<label class="control-label" for="input-codigo"><strong><?php echo $entry_codigo; ?></strong> <span data-toggle="popover" data-placement="top" data-trigger="hover" data-content="<?php echo $help_codigo; ?>"><i class="fa fa-question-circle"></i></span></label>
				<input type="text" name="codigo" value="" placeholder="" id="input-codigo" maxlength="4" autocomplete="off" class="form-control" />
			  </div>
			</div>
		  </div>
		</div>
	</fieldset>
  </form>
  <div class="alert alert-danger" id="warning" role="alert"></div>
  <div class="buttons">
	<div class="pull-right">
	  <input type="button" value="<?php echo $button_pagar; ?>" id="button-confirm" data-loading-text="<?php echo $text_carregando; ?>" class="btn btn-primary" />
	</div>
  </div>
<script type="text/javascript"><!--
$(function() {
  $('[data-toggle="popover"]').popover();
})
//--></script>
<?php } ?>
<link href="catalog/view/javascript/jquery/cielow/loading/css/jquery.loading.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/cielow/loading/js/jquery.loading.min.js"></script>
<script type="text/javascript"><!--
$('#warning').hide();

$('#input-cartao').on('keyup change', function() {
	$(this).val($(this).val().replace(/[^\d]/,''));
});

$('#input-codigo').on('keyup change', function() {
	$(this).val($(this).val().replace(/[^\d]/,''));
});

$('input[name=\'bandeira\']').on('change', function() {
	$('select[name=\'parcelas\']').html('');
	$('#bandeiraEscolhida').html('');
	$('#bandeiraEscolhida').html(this.value.toUpperCase());
	$.ajax({
		url: 'index.php?route=payment/cielow/parcelas&bandeira=' + this.value,
		dataType: 'json',
		cache: false,
		beforeSend: function() {
			$('body').loading({message: '<?php echo $text_carregando; ?>'});
			$('#button-confirm').button('loading');
			$('input', this).attr('readonly', true);
			$('select', this).attr('readonly', true);
			$('#button-confirm').attr('disabled', 'disabled');
		},
		complete: function() {
			$('#button-confirm').button('reset');
			$('input', this).removeAttr('readonly');
			$('select', this).removeAttr('readonly');
			$('#button-confirm').removeAttr('disabled');
			$('body').loading('stop');
		},
		success: function(json) {		
			html = '';
			
			for (i = 0; i <= json.length-1; i++) {
				if (json[i]['parcela'] == '1') {
					html += '<option value="1">' + json[i]['parcela'] + 'x <?php echo $text_de; ?> ' + json[i]['valor'] + ' <?php echo $text_total; ?> ' + json[i]['total'] + ' (<?php echo $text_sem_juros; ?>)</option>';
				} else if (json[i]['juros'] == '0') {
					html += '<option value="' + json[i]['parcela'] + '">' + json[i]['parcela'] + 'x <?php echo $text_de; ?> ' + json[i]['valor'] + ' <?php echo $text_total; ?> ' + json[i]['total'] + ' (<?php echo $text_sem_juros; ?>)</option>';
				} else {
					html += '<option value="' + json[i]['parcela'] + '">' + json[i]['parcela'] + 'x <?php echo $text_de; ?> ' + json[i]['valor'] + ' <?php echo $text_total; ?> ' + json[i]['total'] + ' (' + json[i]['juros'] + '% <?php echo $text_juros; ?>)</option>';
				}
			}

			$('select[name=\'parcelas\']').html(html);
		}
	});
});

$('input:radio[name=\'bandeira\']').each(function() {
	if ($(this).is(':checked'))
		$(this).trigger('change');
});

function validar () {
	var erros = 0;
	var campos = {
			parcelas: '<?php echo $error_parcelas; ?>',
			cartao: '<?php echo $error_cartao; ?>',
			mes: '<?php echo $error_mes; ?>',
			ano: '<?php echo $error_ano; ?>',
			codigo: '<?php echo $error_codigo; ?>'
		};

	$("#payment input[type=\'text\'], #payment input[type=\'radio\']:checked, #payment select").each(function(){
		for(var chave in campos){
			if($(this).attr("name") == chave){
				if($(this).attr("name") == 'cartao'){
					if($.trim($(this).val()).length < 13){
						$(this).toggleClass('alert-danger');
						$(this).after('<div class="text-danger"><i class="fa fa-times"></i> '+campos[chave]+'</div>');
						erros++;
					}else{
						$(this).removeClass('alert-danger');
					}
				}else if($(this).attr("name") == 'codigo'){
					if($('input[name="bandeira"]:checked').val() == 'amex'){
						if($.trim($(this).val()).length !== 4){
							$(this).toggleClass('alert-danger');
							$(this).after('<div class="text-danger"><i class="fa fa-times"></i> '+campos[chave]+'</div>');
							erros++;
						}else{
							$(this).removeClass('alert-danger');
						}
					}else{
						if($.trim($(this).val()).length !== 3){
							$(this).toggleClass('alert-danger');
							$(this).after('<div class="text-danger"><i class="fa fa-times"></i> '+campos[chave]+'</div>');
							erros++;	
						}else{
							$(this).removeClass('alert-danger');
						}
					}
				}else{
					if($.trim($(this).val()).length == 0){
						$(this).toggleClass('alert-danger');
						$(this).after('<div class="text-danger"><i class="fa fa-times"></i> '+campos[chave]+'</div>');
						erros++;
					}else{
						$(this).removeClass('alert-danger');
					}
				}
			}
		}
	});

	if(erros == 0){
		return true;
	}else{
		return false;
	};
};

$('#payment input[type=\'text\'], #payment select').blur(function() {
	$('.text-danger').remove();
	$('#payment input[type=\'text\'], #payment select').removeClass('alert-danger');
	validar();
});

$('#button-confirm').on('click', function() {
	$('#warning').hide();
	$('.text-danger').remove();
	$('#payment input[type=\'text\'], #payment select').removeClass('alert-danger');
	if(validar() == true){
		$.ajax({ 
			url: 'index.php?route=payment/cielow/transacao',
			type: 'post',
			data: $('#payment input[type=\'text\'], #payment input[type=\'radio\']:checked, #payment select'),
			dataType: 'json',
			beforeSend: function() {
				$('body').loading({message: '<?php echo $text_autorizando; ?>'});
				$('#button-confirm').button('loading');
				$('#button-confirm').attr('disabled', 'true');
				$('input', this).attr('readonly', true);
				$('select', this).attr('readonly', true);
			},
			complete: function() {
				$('input', this).removeAttr('readonly');
				$('select', this).removeAttr('readonly');
				$('#button-confirm').removeAttr('disabled');
				$('#button-confirm').button('reset');
				$('select[name="parcelas"]').val('1');
				$('input[name="cartao"]').val('');
				$('select[name="mes"]').val('');
				$('select[name="ano"]').val('');
				$('input[name="codigo"]').val('');
				$('body').loading('stop');
			},
			success: function(json) {
				$('body').loading('stop');
				if(json['error']){
					$('#warning').html(json['error']).show();
					if(json['status']){
						$.ajax({
							url: 'index.php?route=payment/cielow/confirm',
							type: 'post',
							data: 'status=' + json['status'] + '&comment=' + json['comment'],
							beforeSend: function() { 
								$('body').loading({message: '<?php echo $error_nao_autorizou; ?>'});
								$('#button-confirm').attr('disabled', 'true');
							},
							complete: function() { 
								$('#button-confirm').removeAttr('disabled');
								$('body').loading('stop');
							},
							success: function() { }
						});
					}
				}else{
					$.ajax({
						url: 'index.php?route=payment/cielow/confirm',
						type: 'post',
						data: 'status=' + json['status'] + '&comment=' + json['comment'],
						beforeSend: function() {
							$('body').loading({message: '<?php echo $text_autorizou; ?>'});
							$('#button-confirm').attr('disabled', 'true');
						},
						success: function() { location.href = json['redirect'] }
					})
				}
			}
		})
	}
});
//--></script>
