<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
		<a href="" data-toggle="tooltip" title="" class="btn btn-default"><i class="fa fa-reply"></i></a>
	  </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div id="progress"></div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-details" data-toggle="tab"><?php echo $tab_details; ?></a></li>
          <li><a href="#tab-xml" data-toggle="tab"><?php echo $tab_xml; ?></a></li>
        </ul>
		<div class="tab-content">
		  <div class="tab-pane active" id="tab-details">
			<div class="row">
			  <div class="col-sm-12">
				<table class="table table-bordered">
				  <tr>
					<td><?php echo $entry_order_id; ?></td>
					<td><a href="<?php echo $view_order; ?>"><?php echo $order_id; ?></a></td>
				  </tr>
				  <tr>
					<td><?php echo $entry_added; ?></td>
					<td><?php echo $added; ?></td>
				  </tr>
				  <tr>
					<td><?php echo $entry_total; ?></td>
					<td><?php echo $total; ?></td>
				  </tr>
				  <tr>
					<td><?php echo $entry_customer; ?></td>
					<td><a href="<?php echo $view_customer; ?>"><?php echo $customer; ?></a></td>
				  </tr>
				  <tr>
					<td><?php echo $entry_cielow_id; ?></td>
					<td><?php echo $cielow_id; ?></td>
				  </tr>
				  <tr>
					<td><?php echo $entry_tid; ?></td>
					<td><?php echo $tid; ?></td>
				  </tr>
				  <tr>
					<td><?php echo $entry_nsu; ?></td>
					<td><?php echo $nsu; ?></td>
				  </tr>
				  <tr>
					<td><?php echo $entry_bandeira; ?></td>
					<td><?php echo $bandeira; ?></td>
				  </tr>
				  <tr>
					<td><?php echo $entry_parcelamento; ?></td>
					<td><?php echo $parcelas; ?>x</td>
				  </tr>
				  <tr>
					<td><?php echo $entry_autorizacao; ?></td>
					<td>
					  <?php echo $data_autorizacao; ?>
					  <?php if ((!$data_captura) && (!empty($dias_capturar)) && (!$data_cancelamento) && (!empty($dias_cancelar))) { ?>
					  <br />
					  <strong><?php echo $dias_capturar; ?></strong><br />
					  <strong><?php echo $dias_cancelar; ?></strong>
					  <?php } ?>
					</td>
				  </tr>
				  <tr>
					<td><?php echo $entry_valor_autorizado; ?></td>
					<td>
					  <?php echo $valor_autorizado; ?>
					  <?php if ((!$data_captura) && (!empty($dias_capturar)) && (!$data_cancelamento) && (!empty($dias_cancelar))) { ?>
					  <br />
					  <button type="button" class="btn btn-success btn-xs" name="button-capture" data-loading-text="<?php echo $text_atualizando; ?>" id="<?php echo $order_id; ?>_<?php echo $cielow_id; ?>"><i class="fa fa-check"></i> <?php echo $button_capturar; ?></button> 
					  <button type="button" class="btn btn-danger btn-xs" name="button-cancel" data-loading-text="<?php echo $text_atualizando; ?>" id="<?php echo $order_id; ?>_<?php echo $cielow_id; ?>"><i class="fa fa-trash-o"></i> <?php echo $button_cancelar; ?></button>
					  <?php } ?>
					</td>
				  </tr>
				  <?php if ($data_captura) { ?>
				  <tr>
					<td><?php echo $entry_captura; ?></td>
					<td>
					  <?php echo $data_captura; ?><br />
					  <?php if ((!$data_cancelamento) && (!empty($dias_cancelar))) { ?>
					  <strong><?php echo $dias_cancelar; ?></strong>
					  <?php } ?>
					</td>
				  </tr>
				  <tr>
					<td><?php echo $entry_valor_capturado; ?></td>
					<td>
					  <?php echo $valor_capturado; ?> 
					  <?php if ((!$data_cancelamento) && (!empty($dias_cancelar))) { ?>
					  <button type="button" class="btn btn-danger btn-xs" name="button-cancel" data-loading-text="<?php echo $text_atualizando; ?>" id="<?php echo $order_id; ?>_<?php echo $cielow_id; ?>"><i class="fa fa-trash-o"></i> <?php echo $button_cancelar; ?></button>
					  <?php } ?>
					</td>
				  </tr>
				  <?php } ?>
				  <?php if ($data_cancelamento) { ?>
				  <tr>
					<td><?php echo $entry_cancelamento; ?></td>
					<td><?php echo $data_cancelamento; ?></td>
				  </tr>
				  <tr>
					<td><?php echo $entry_valor_cancelado; ?></td>
					<td><?php echo $valor_cancelado; ?></td>
				  </tr>
				  <?php } ?>
				  <tr>
					<td><?php echo $entry_status; ?></td>
					<td><strong><?php echo $status; ?></strong></td>
				  </tr>
				  <?php if (!$data_cancelamento) { ?>
				  <?php if ($clearsale) { ?>
				  <tr>
					<td><?php echo $entry_clearsale; ?></td>
					<td>
						<button id="button-clearsale" class="btn btn-warning btn-xs"><i class="fa fa-search"></i> <?php echo $button_consultar; ?></button>
						<script type="text/javascript"><!--
							$(document).delegate('#button-clearsale', 'click', function() {
								var url = "<?php echo $clearsale_url ?>";
								$(this).hide();
								$('#clearsale').show();
								$('#clearsale').attr("src",url);
							});
						//--></script>
						<iframe style="display:none;" id="clearsale" width="280" height="100" frameborder="0" scrolling="no"><p><?php echo $error_iframe ?></p></iframe>
					</td>
				  </tr>
				  <?php } ?>
				  <?php if ($fcontrol) { ?>
				  <tr>
					<td><?php echo $entry_fcontrol; ?></td>
					<td>
						<button id="button-fcontrol" class="btn btn-warning btn-xs"><i class="fa fa-search"></i> <?php echo $button_consultar; ?></button>
						<script type="text/javascript"><!--
							$(document).delegate('#button-fcontrol', 'click', function() {
								var url = "<?php echo $fcontrol_url ?>";
								$(this).hide();
								$('#fcontrol').show();
								$('#fcontrol').attr("src",url);
							});
						//--></script>
						<iframe style="display:none;" id="fcontrol" width="300" height="110" frameborder="0" scrolling="no"><p><?php echo $error_iframe ?></p></iframe>
					</td>
				  </tr>
				  <?php } ?>
				  <?php } ?>
				</table>
			  </div>
			</div>
		  </div>
		  <div class="tab-pane" id="tab-xml">
		    <textarea wrap="off" rows="20" readonly class="form-control"><?php echo $xml; ?></textarea>
		  </div>
		</div>
	  </div>
    </div>
  </div>
<script type="text/javascript"><!--
$('button[name=\'button-cancel\']').on('click', function() {
	var currentId = $('button[name=\'button-cancel\']').attr('id').split('_');
	$.ajax({ 
		url: 'index.php?route=sale/cielow_search/cancel&token=<?php echo $token; ?>&cielow_id=' + currentId[1],
		dataType: 'json',
		beforeSend: function() {
			$('button[name=\'button-cancel\']').button('loading');
			$('#progress').html('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $text_cancelando; ?> <img src="view/image/ajax-loader.gif" alt="" /><button type="button" class="close" data-dismiss="alert">&times;</button></div>');
		},
		complete: function() {
			$('button[name=\'button-cancel\']').button('reset');
			$('.alert alert-danger').remove();
		},
		success: function(json) {
			if (json['error']) {
				alert(json['error']);
			} else {
				$('#progress').html('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['mensagem'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				location.href = location.href;
			}
		}
	});
});

$('button[name=\'button-capture\']').on('click', function() {
	var currentId = $('button[name=\'button-capture\']').attr('id').split('_');
	$.ajax({ 
		url: 'index.php?route=sale/cielow_search/capture&token=<?php echo $token; ?>&cielow_id=' +  currentId[1],
		dataType: 'json',
		beforeSend: function() {
			$('button[name=\'button-capture\']').button('loading');
			$('#progress').html('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $text_capturando; ?> <img src="view/image/ajax-loader.gif" alt="" /><button type="button" class="close" data-dismiss="alert">&times;</button></div>');
		},
		complete: function() {
			$('button[name=\'button-capture\']').button('reset');
			$('.alert alert-danger').remove();
		},
		success: function(json) {
			if (json['error']) {
				alert(json['error']);
			} else {
				$('#progress').html('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['mensagem'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				location.href = location.href;
			}
		}
	});
});
//--></script>
</div>
<?php echo $footer; ?> 