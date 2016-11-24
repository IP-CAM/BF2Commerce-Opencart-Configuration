<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
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
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-order-id"><?php echo $entry_order_id; ?></label>
                <input type="text" name="filter_order_id" value="<?php echo $filter_order_id; ?>" placeholder="<?php echo $entry_order_id; ?>" id="input-order-id" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="input-tid"><?php echo $entry_tid; ?></label>
                <input type="text" name="filter_tid" value="<?php echo $filter_tid; ?>" placeholder="<?php echo $entry_tid; ?>" id="input-tid" class="form-control" />
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-dataPedido"><?php echo $entry_dataPedido; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_dataPedido" value="<?php echo $filter_dataPedido; ?>" placeholder="<?php echo $entry_dataPedido; ?>" data-date-format="YYYY-MM-DD" id="input-dataPedido" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <div class="form-group">
                <label class="control-label" for="input-nsu"><?php echo $entry_nsu; ?></label>
                <input type="text" name="filter_nsu" value="<?php echo $filter_nsu; ?>" placeholder="<?php echo $entry_nsu; ?>" id="input-nsu" class="form-control" />
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-customer"><?php echo $entry_customer; ?></label>
                <input type="text" name="filter_customer" value="<?php echo $filter_customer; ?>" placeholder="<?php echo $entry_customer; ?>" id="input-customer" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
                <select name="filter_status" id="input-status" class="form-control">
                  <option value="*"><?php echo $text_todas; ?></option>
                  <?php if ($filter_status == '4') { ?>
                  <option value="4" selected="selected"><?php echo $text_autorizada; ?></option>
                  <option value="6"><?php echo $text_capturada; ?></option>
				  <option value="8"><?php echo $text_nao_capturada; ?></option>
                  <option value="9"><?php echo $text_cancelada; ?></option>
                  <?php } elseif ($filter_status == '6') { ?>
                  <option value="4"><?php echo $text_autorizada; ?></option>
                  <option value="6" selected="selected"><?php echo $text_capturada; ?></option>
                  <option value="8"><?php echo $text_nao_capturada; ?></option>
                  <option value="9"><?php echo $text_cancelada; ?></option>
                  <?php } elseif ($filter_status == '8') { ?>
                  <option value="4"><?php echo $text_autorizada; ?></option>
                  <option value="6"><?php echo $text_capturada; ?></option>
                  <option value="8" selected="selected"><?php echo $text_nao_capturada; ?></option>
                  <option value="9"><?php echo $text_cancelada; ?></option>
                  <?php } elseif ($filter_status == '9') { ?>
                  <option value="4"><?php echo $text_autorizada; ?></option>
                  <option value="6"><?php echo $text_capturada; ?></option>
				  <option value="8"><?php echo $text_nao_capturada; ?></option>
                  <option value="9" selected="selected"><?php echo $text_cancelada; ?></option>
                  <?php } else { ?>
                  <option value="4"><?php echo $text_autorizada; ?></option>
                  <option value="6"><?php echo $text_capturada; ?></option>
				  <option value="8"><?php echo $text_nao_capturada; ?></option>
                  <option value="9"><?php echo $text_cancelada; ?></option>
                  <?php } ?>
                </select>
              </div>
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>
        <form method="post" enctype="multipart/form-data" target="_blank" id="form-transactions">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-right">
				    <?php if ($sort == 'oc.order_id') { ?>
                    <a href="<?php echo $sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_order_id; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_order; ?>"><?php echo $column_order_id; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-center">
				    <?php if ($sort == 'oc.dataPedido') { ?>
                    <a href="<?php echo $sort_dataPedido; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_dataPedido; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_dataPedido; ?>"><?php echo $column_dataPedido; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-left">
				    <?php if ($sort == 'customer') { ?>
                    <a href="<?php echo $sort_customer; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_customer; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_customer; ?>"><?php echo $column_customer; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-right"><?php echo $column_parcelas; ?></td>
                  <td class="text-center"><?php echo $column_tid; ?></td>
                  <td class="text-center"><?php echo $column_nsu; ?></td>
                  <td class="text-center">
				    <?php if ($sort == 'oc.status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                    <?php } ?>
				  </td>
                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($transactions) { ?>
                <?php foreach ($transactions as $transaction) { ?>
                <tr>
                  <td class="text-right"><a href="<?php echo $transaction['view_order']; ?>"><?php echo $transaction['order_id']; ?></a></td>
                  <td class="text-center"><?php echo $transaction['dataPedido']; ?></td>
                  <td class="text-left"><?php echo $transaction['customer']; ?></td>
				  <td class="text-right"><?php echo $transaction['parcelas']; ?>x <?php echo $transaction['bandeira']; ?></td>
                  <td class="text-center"><?php echo $transaction['tid']; ?></td>
                  <td class="text-center"><?php echo $transaction['nsu']; ?></td>
                  <td class="text-center"><?php echo $transaction['status']; ?></td>
                  <td class="text-right"><a href="<?php echo $transaction['view_transaction']; ?>" data-toggle="tooltip" title="<?php echo $button_info; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="7"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	url = 'index.php?route=sale/cielow_search&token=<?php echo $token; ?>';

	var filter_order_id = $('input[name=\'filter_order_id\']').val();

	if (filter_order_id) {
		url += '&filter_order_id=' + encodeURIComponent(filter_order_id);
	}

	var filter_dataPedido = $('input[name=\'filter_dataPedido\']').val();

	if (filter_dataPedido) {
		url += '&filter_dataPedido=' + encodeURIComponent(filter_dataPedido);
	}

	var filter_customer = $('input[name=\'filter_customer\']').val();

	if (filter_customer) {
		url += '&filter_customer=' + encodeURIComponent(filter_customer);
	}

	var filter_tid = $('input[name=\'filter_tid\']').val();

	if (filter_tid) {
		url += '&filter_tid=' + encodeURIComponent(filter_tid);
	}

	var filter_nsu = $('input[name=\'filter_nsu\']').val();

	if (filter_nsu) {
		url += '&filter_nsu=' + encodeURIComponent(filter_nsu);
	}

	var filter_status = $('select[name=\'filter_status\']').val();

	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status);
	}

	location = url;
});

$('input[name=\'filter_customer\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=sale/customer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['customer_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter_customer\']').val(item['label']);
	}
});

$('.date').datetimepicker({
	pickTime: false
});
//--></script>
</div>
<?php echo $footer; ?>