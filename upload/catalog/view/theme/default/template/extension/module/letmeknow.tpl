<h3><?php echo $heading_title; ?></h3>


<button type="button" class="btn btn-block button green" id="btnStock" data-toggle="modal" data-target="#myModal">  <span>Avise-me quando chegar</span></button>

<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button id= "" type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Avise-me</h4>
					</div>

					<div class="modal-body">
						<div class="row">
							<div class="col-xs-12 text-center">
								<p>
									Você será avisado assim que este produto voltar ao estoque!
								</p>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" name="nome" class="form-control" placeholder="Nome" value="<?php echo $name;?>" />
									<?php if ($error_name) { ?>
									<span class="error"><?php echo $error_name; ?></span>
									<?php } ?>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" name="email" class="form-control" placeholder="E-mail" value="<?php echo $email;?>" />
									<?php if ($error_email) { ?>
									<span class="error"><?php echo $error_email; ?></span>
									<?php } ?>
									
								</div>
							</div>
						</div>
						<div class="right">
							<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
							<input type="submit" id="button_letmeknow" value="Enviar" class="btn button"/>
						</div>
					</div>
				</div>
				<script>

					$('#button_letmeknow').on('click', function() {
						$.ajax({
							url: 'index.php?route=extension/module/letmeknow/add',
							type: 'post',
							dataType: 'json',
							data: {
								name: $("[name='nome']").val(),
								email: $("[name='email']").val(),
								product_id : $("[name='product_id']").val(),
							},
							beforeSend: function() {
								// $('#button-review').button('loading');
							},
							complete: function() {
								alert("teste");
								// $('#button-review').button('reset');
							},
							success: function(json) {
								alert("teste");
								// $('.alert-success, .alert-danger').remove();

								// if (json['error']) {
								// 	$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
								// }

								// if (json['success']) {
								// 	$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

								// 	$('input[name=\'name\']').val('');
								// 	$('textarea[name=\'text\']').val('');
								// 	$('input[name=\'rating\']:checked').prop('checked', false);
								// }
							}
						});
					});

				</script>
			</div>
		</div>
	</div>
</div>