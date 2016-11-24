<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-cielow" input type="hidden" id="save_stay" name="save_stay" value="1" data-toggle="tooltip" title="<?php echo $button_save_stay; ?>" class="btn btn-success"><i class="fa fa-save"></i></button>
        <button type="submit" form="form-cielow" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
	  </div>
      <h1><?php echo $heading_title; ?></h1> <span class="badge"><?php echo $versao; ?></span>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-cielow" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-geral" data-toggle="tab"><?php echo $tab_geral; ?></a></li>
            <li><a href="#tab-api" data-toggle="tab"><?php echo $tab_api; ?></a></li>
            <li><a href="#tab-parcelamentos" data-toggle="tab"><?php echo $tab_parcelamentos; ?></a></li>
            <li><a href="#tab-situacoes-pedido" data-toggle="tab"><?php echo $tab_situacoes_pedido; ?></a></li>
            <li><a href="#tab-finalizacao" data-toggle="tab"><?php echo $tab_finalizacao; ?></a></li>
            <li><a href="#tab-campos" data-toggle="tab"><?php echo $tab_campos; ?></a></li>
            <li><a href="#tab-clearsale" data-toggle="tab"><?php echo $tab_clearsale; ?></a></li>
            <li><a href="#tab-fcontrol" data-toggle="tab"><?php echo $tab_fcontrol; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-geral">
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-total"><span data-toggle="tooltip" title="<?php echo $help_total; ?>"><?php echo $entry_total; ?></span></label>
				<div class="col-sm-10">
				  <input type="text" name="cielow_total" value="<?php echo $cielow_total; ?>" placeholder="<?php echo $entry_total; ?>" id="input-total" class="form-control" />
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
				<div class="col-sm-10">
				  <select name="cielow_geo_zone_id" id="input-geo-zone" class="form-control">
					<option value="0"><?php echo $text_all_zones; ?></option>
					<?php foreach ($geo_zones as $geo_zone) { ?>
					<?php if ($geo_zone['geo_zone_id'] == $cielow_geo_zone_id) { ?>
					<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
				<div class="col-sm-10">
				  <select name="cielow_status" id="input-status" class="form-control">
					<?php if ($cielow_status) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					<?php } ?>
				  </select>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="cielow_sort_order" value="<?php echo $cielow_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
				</div>
			  </div>
			</div>
			<div class="tab-pane" id="tab-api">
			  <div class="form-group required">
				<label class="col-sm-2 control-label" for="input-credenciamento"><span data-toggle="tooltip" title="<?php echo $help_credenciamento; ?>"><?php echo $entry_credenciamento; ?></span></label>
				<div class="col-sm-10">
				  <input type="text" name="cielow_credenciamento" value="<?php echo $cielow_credenciamento; ?>" placeholder="<?php echo $entry_credenciamento; ?>" id="input-credenciamento" class="form-control" />
				  <?php if ($error_credenciamento) { ?>
				  <div class="text-danger"><?php echo $error_credenciamento; ?></div>
				  <?php } ?>
				</div>
			  </div>
			  <div class="form-group required">
				<label class="col-sm-2 control-label" for="input-chave"><span data-toggle="tooltip" title="<?php echo $help_chave; ?>"><?php echo $entry_chave; ?></span></label>
				<div class="col-sm-10">
				  <input type="text" name="cielow_chave" value="<?php echo $cielow_chave; ?>" placeholder="<?php echo $entry_chave; ?>" id="input-cheve" class="form-control" />
				  <?php if ($error_chave) { ?>
				  <div class="text-danger"><?php echo $error_chave; ?></div>
				  <?php } ?>
				</div>
			  </div>
			  <div class="form-group required">
				<label class="col-sm-2 control-label" for="input-soft-descriptor"><span data-toggle="tooltip" title="<?php echo $help_soft_descriptor; ?>"><?php echo $entry_soft_descriptor; ?></span></label>
				<div class="col-sm-10">
				  <input type="text" name="cielow_soft_descriptor" value="<?php echo $cielow_soft_descriptor; ?>" placeholder="<?php echo $entry_soft_descriptor; ?>" id="input-soft-descriptor" class="form-control" />
				  <?php if ($error_soft_descriptor) { ?>
				  <div class="text-danger"><?php echo $error_soft_descriptor; ?></div>
				  <?php } ?>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-ambiente"><span data-toggle="tooltip" title="<?php echo $help_ambiente; ?>"><?php echo $entry_ambiente; ?></span></label>
				<div class="col-sm-10">
				  <select name="cielow_ambiente" id="input-ambiente" class="form-control">
					<?php if ($cielow_ambiente) { ?>
					<option value="1" selected="selected"><?php echo $text_yes; ?></option>
					<option value="0"><?php echo $text_no; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_yes; ?></option>
					<option value="0" selected="selected"><?php echo $text_no; ?></option>
					<?php } ?>
				  </select>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-captura"><span data-toggle="tooltip" title="<?php echo $help_captura; ?>"><?php echo $entry_captura; ?></span></label>
				<div class="col-sm-10">
				  <select name="cielow_captura" id="input-captura" class="form-control">
					<?php if ($cielow_captura) { ?>
					<option value="1" selected="selected"><?php echo $text_manual; ?></option>
					<option value="0"><?php echo $text_automatica; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_manual; ?></option>
					<option value="0" selected="selected"><?php echo $text_automatica; ?></option>
					<?php } ?>
				  </select>
				</div>
			  </div>
			</div>
			<div class="tab-pane" id="tab-parcelamentos">
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-calculo"><span data-toggle="tooltip" title="<?php echo $help_calculo; ?>"><?php echo $entry_calculo; ?></span></label>
				<div class="col-sm-2">
				  <select name="cielow_calculo" id="input-calculo" class="form-control">
					<?php if ($cielow_calculo) { ?>
					<option value="1" selected="selected"><?php echo $text_simples; ?></option>
					<option value="0"><?php echo $text_composto; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_simples; ?></option>
					<option value="0" selected="selected"><?php echo $text_composto; ?></option>
					<?php } ?>
				  </select>
				</div>
			  </div>
			  <div class="form-group required">
				<label class="col-sm-2 control-label" for="input-minimo"><span data-toggle="tooltip" title="<?php echo $help_minimo; ?>"><?php echo $entry_minimo; ?></span></label>
				<div class="col-sm-2">
				  <input type="text" name="cielow_minimo" value="<?php echo $cielow_minimo; ?>" placeholder="<?php echo $entry_minimo; ?>" id="input-minimo" class="form-control" />
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-visa"><span data-toggle="tooltip" title="<?php echo $help_visa; ?>"><?php echo $entry_visa; ?></span></label>
				<div class="col-sm-2">
				  <label><?php echo $text_ativar; ?></label>
				  <select name="cielow_visa" id="input-visa" class="form-control">
					<?php if ($cielow_visa) { ?>
					<option value="1" selected="selected"><?php echo $text_yes; ?></option>
					<option value="0"><?php echo $text_no; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_yes; ?></option>
					<option value="0" selected="selected"><?php echo $text_no; ?></option>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-2">
				  <label><?php echo $text_parcelas; ?></label>
				  <select name="cielow_visa_parcelas" class="form-control">
					<?php foreach ($parcelas as $parcela) { ?>
					<?php if ($parcela == $cielow_visa_parcelas) { ?>
					<option value="<?php echo $parcela; ?>" selected="selected"><?php echo $parcela; ?></option>
					<?php } else { ?>
					<option value="<?php echo $parcela; ?>"><?php echo $parcela; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-2">
				  <label><?php echo $text_sem_juros; ?></label>
				  <select name="cielow_visa_sem_juros" class="form-control">
					<?php foreach ($parcelas as $parcela) { ?>
					<?php if ($parcela == $cielow_visa_sem_juros) { ?>
					<option value="<?php echo $parcela; ?>" selected="selected"><?php echo $parcela; ?></option>
					<?php } else { ?>
					<option value="<?php echo $parcela; ?>"><?php echo $parcela; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-2">
				  <label><?php echo $text_juros; ?></label>
				  <input type="text" name="cielow_visa_juros" value="<?php echo $cielow_visa_juros; ?>" placeholder="" id="input-visa-taxa-juros" class="form-control" />
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-mastercard"><span data-toggle="tooltip" title="<?php echo $help_mastercard; ?>"><?php echo $entry_mastercard; ?></span></label>
				<div class="col-sm-2">
				  <label><?php echo $text_ativar; ?></label>
				  <select name="cielow_mastercard" id="input-mastercard" class="form-control">
					<?php if ($cielow_mastercard) { ?>
					<option value="1" selected="selected"><?php echo $text_yes; ?></option>
					<option value="0"><?php echo $text_no; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_yes; ?></option>
					<option value="0" selected="selected"><?php echo $text_no; ?></option>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-2">
				  <label><?php echo $text_parcelas; ?></label>
				  <select name="cielow_mastercard_parcelas" class="form-control">
					<?php foreach ($parcelas as $parcela) { ?>
					<?php if ($parcela == $cielow_mastercard_parcelas) { ?>
					<option value="<?php echo $parcela; ?>" selected="selected"><?php echo $parcela; ?></option>
					<?php } else { ?>
					<option value="<?php echo $parcela; ?>"><?php echo $parcela; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-2">
				  <label><?php echo $text_sem_juros; ?></label>
				  <select name="cielow_mastercard_sem_juros" class="form-control">
					<?php foreach ($parcelas as $parcela) { ?>
					<?php if ($parcela == $cielow_mastercard_sem_juros) { ?>
					<option value="<?php echo $parcela; ?>" selected="selected"><?php echo $parcela; ?></option>
					<?php } else { ?>
					<option value="<?php echo $parcela; ?>"><?php echo $parcela; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-2">
				  <label><?php echo $text_juros; ?></label>
				  <input type="text" name="cielow_mastercard_juros" value="<?php echo $cielow_mastercard_juros; ?>" placeholder="" id="input-mastercard-taxa-juros" class="form-control" />
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-diners"><span data-toggle="tooltip" title="<?php echo $help_diners; ?>"><?php echo $entry_diners; ?></span></label>
				<div class="col-sm-2">
				  <label><?php echo $text_ativar; ?></label>
				  <select name="cielow_diners" id="input-diners" class="form-control">
					<?php if ($cielow_diners) { ?>
					<option value="1" selected="selected"><?php echo $text_yes; ?></option>
					<option value="0"><?php echo $text_no; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_yes; ?></option>
					<option value="0" selected="selected"><?php echo $text_no; ?></option>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-2">
				  <label><?php echo $text_parcelas; ?></label>
				  <select name="cielow_diners_parcelas" class="form-control">
					<?php foreach ($parcelas as $parcela) { ?>
					<?php if ($parcela == $cielow_diners_parcelas) { ?>
					<option value="<?php echo $parcela; ?>" selected="selected"><?php echo $parcela; ?></option>
					<?php } else { ?>
					<option value="<?php echo $parcela; ?>"><?php echo $parcela; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-2">
				  <label><?php echo $text_sem_juros; ?></label>
				  <select name="cielow_diners_sem_juros" class="form-control">
					<?php foreach ($parcelas as $parcela) { ?>
					<?php if ($parcela == $cielow_diners_sem_juros) { ?>
					<option value="<?php echo $parcela; ?>" selected="selected"><?php echo $parcela; ?></option>
					<?php } else { ?>
					<option value="<?php echo $parcela; ?>"><?php echo $parcela; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-2">
				  <label><?php echo $text_juros; ?></label>
				  <input type="text" name="cielow_diners_juros" value="<?php echo $cielow_diners_juros; ?>" placeholder="" id="input-diners-taxa-juros" class="form-control" />
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-discover"><span data-toggle="tooltip" title="<?php echo $help_discover; ?>"><?php echo $entry_discover; ?></span></label>
				<div class="col-sm-2">
				  <label><?php echo $text_ativar; ?></label>
				  <select name="cielow_discover" id="input-discover" class="form-control">
					<?php if ($cielow_discover) { ?>
					<option value="1" selected="selected"><?php echo $text_yes; ?></option>
					<option value="0"><?php echo $text_no; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_yes; ?></option>
					<option value="0" selected="selected"><?php echo $text_no; ?></option>
					<?php } ?>
				  </select>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-elo"><span data-toggle="tooltip" title="<?php echo $help_elo; ?>"><?php echo $entry_elo; ?></span></label>
				<div class="col-sm-2">
				  <label><?php echo $text_ativar; ?></label>
				  <select name="cielow_elo" id="input-elo" class="form-control">
					<?php if ($cielow_elo) { ?>
					<option value="1" selected="selected"><?php echo $text_yes; ?></option>
					<option value="0"><?php echo $text_no; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_yes; ?></option>
					<option value="0" selected="selected"><?php echo $text_no; ?></option>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-2">
				  <label><?php echo $text_parcelas; ?></label>
				  <select name="cielow_elo_parcelas" class="form-control">
					<?php foreach ($parcelas as $parcela) { ?>
					<?php if ($parcela == $cielow_elo_parcelas) { ?>
					<option value="<?php echo $parcela; ?>" selected="selected"><?php echo $parcela; ?></option>
					<?php } else { ?>
					<option value="<?php echo $parcela; ?>"><?php echo $parcela; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-2">
				  <label><?php echo $text_sem_juros; ?></label>
				  <select name="cielow_elo_sem_juros" class="form-control">
					<?php foreach ($parcelas as $parcela) { ?>
					<?php if ($parcela == $cielow_elo_sem_juros) { ?>
					<option value="<?php echo $parcela; ?>" selected="selected"><?php echo $parcela; ?></option>
					<?php } else { ?>
					<option value="<?php echo $parcela; ?>"><?php echo $parcela; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-2">
				  <label><?php echo $text_juros; ?></label>
				  <input type="text" name="cielow_elo_juros" value="<?php echo $cielow_elo_juros; ?>" placeholder="" id="input-elo-taxa-juros" class="form-control" />
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-amex"><span data-toggle="tooltip" title="<?php echo $help_amex; ?>"><?php echo $entry_amex; ?></span></label>
				<div class="col-sm-2">
				  <label><?php echo $text_ativar; ?></label>
				  <select name="cielow_amex" id="input-amex" class="form-control">
					<?php if ($cielow_amex) { ?>
					<option value="1" selected="selected"><?php echo $text_yes; ?></option>
					<option value="0"><?php echo $text_no; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_yes; ?></option>
					<option value="0" selected="selected"><?php echo $text_no; ?></option>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-2">
				  <label><?php echo $text_parcelas; ?></label>
				  <select name="cielow_amex_parcelas" class="form-control">
					<?php foreach ($parcelas as $parcela) { ?>
					<?php if ($parcela == $cielow_amex_parcelas) { ?>
					<option value="<?php echo $parcela; ?>" selected="selected"><?php echo $parcela; ?></option>
					<?php } else { ?>
					<option value="<?php echo $parcela; ?>"><?php echo $parcela; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-2">
				  <label><?php echo $text_sem_juros; ?></label>
				  <select name="cielow_amex_sem_juros" class="form-control">
					<?php foreach ($parcelas as $parcela) { ?>
					<?php if ($parcela == $cielow_amex_sem_juros) { ?>
					<option value="<?php echo $parcela; ?>" selected="selected"><?php echo $parcela; ?></option>
					<?php } else { ?>
					<option value="<?php echo $parcela; ?>"><?php echo $parcela; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-2">
				  <label><?php echo $text_juros; ?></label>
				  <input type="text" name="cielow_amex_juros" value="<?php echo $cielow_amex_juros; ?>" placeholder="" id="input-amex-taxa-juros" class="form-control" />
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-jcb"><span data-toggle="tooltip" title="<?php echo $help_jcb; ?>"><?php echo $entry_jcb; ?></span></label>
				<div class="col-sm-2">
				  <label><?php echo $text_ativar; ?></label>
				  <select name="cielow_jcb" id="input-jcb" class="form-control">
					<?php if ($cielow_jcb) { ?>
					<option value="1" selected="selected"><?php echo $text_yes; ?></option>
					<option value="0"><?php echo $text_no; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_yes; ?></option>
					<option value="0" selected="selected"><?php echo $text_no; ?></option>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-2">
				  <label><?php echo $text_parcelas; ?></label>
				  <select name="cielow_jcb_parcelas" class="form-control">
					<?php foreach ($parcelas as $parcela) { ?>
					<?php if ($parcela == $cielow_jcb_parcelas) { ?>
					<option value="<?php echo $parcela; ?>" selected="selected"><?php echo $parcela; ?></option>
					<?php } else { ?>
					<option value="<?php echo $parcela; ?>"><?php echo $parcela; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-2">
				  <label><?php echo $text_sem_juros; ?></label>
				  <select name="cielow_jcb_sem_juros" class="form-control">
					<?php foreach ($parcelas as $parcela) { ?>
					<?php if ($parcela == $cielow_jcb_sem_juros) { ?>
					<option value="<?php echo $parcela; ?>" selected="selected"><?php echo $parcela; ?></option>
					<?php } else { ?>
					<option value="<?php echo $parcela; ?>"><?php echo $parcela; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-2">
				  <label><?php echo $text_juros; ?></label>
				  <input type="text" name="cielow_jcb_juros" value="<?php echo $cielow_jcb_juros; ?>" placeholder="" id="input-jcb-taxa-juros" class="form-control" />
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-aura"><span data-toggle="tooltip" title="<?php echo $help_aura; ?>"><?php echo $entry_aura; ?></span></label>
				<div class="col-sm-2">
				  <label><?php echo $text_ativar; ?></label>
				  <select name="cielow_aura" id="input-aura" class="form-control">
					<?php if ($cielow_aura) { ?>
					<option value="1" selected="selected"><?php echo $text_yes; ?></option>
					<option value="0"><?php echo $text_no; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_yes; ?></option>
					<option value="0" selected="selected"><?php echo $text_no; ?></option>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-2">
				  <label><?php echo $text_parcelas; ?></label>
				  <select name="cielow_aura_parcelas" class="form-control">
					<?php foreach ($parcelas as $parcela) { ?>
					<?php if ($parcela == $cielow_aura_parcelas) { ?>
					<option value="<?php echo $parcela; ?>" selected="selected"><?php echo $parcela; ?></option>
					<?php } else { ?>
					<option value="<?php echo $parcela; ?>"><?php echo $parcela; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-2">
				  <label><?php echo $text_sem_juros; ?></label>
				  <select name="cielow_aura_sem_juros" class="form-control">
					<?php foreach ($parcelas as $parcela) { ?>
					<?php if ($parcela == $cielow_aura_sem_juros) { ?>
					<option value="<?php echo $parcela; ?>" selected="selected"><?php echo $parcela; ?></option>
					<?php } else { ?>
					<option value="<?php echo $parcela; ?>"><?php echo $parcela; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-2">
				  <label><?php echo $text_juros; ?></label>
				  <input type="text" name="cielow_aura_juros" value="<?php echo $cielow_aura_juros; ?>" placeholder="" id="input-aura-taxa-juros" class="form-control" />
				</div>
			  </div>
			</div>
			<div class="tab-pane" id="tab-situacoes-pedido">
			  <div class="form-group">
				<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_situacao_pendente; ?>"><?php echo $entry_situacao_pendente; ?></span></label>
				<div class="col-sm-10">
				  <select name="cielow_situacao_pendente_id" class="form-control">
					<?php foreach ($order_statuses as $order_status) { ?>
					<?php if ($order_status['order_status_id'] == $cielow_situacao_pendente_id) { ?>
					<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_situacao_autorizada; ?>"><?php echo $entry_situacao_autorizada; ?></span></label>
				<div class="col-sm-10">
				  <select name="cielow_situacao_autorizada_id" class="form-control">
					<?php foreach ($order_statuses as $order_status) { ?>
					<?php if ($order_status['order_status_id'] == $cielow_situacao_autorizada_id) { ?>
					<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_situacao_nao_autorizada; ?>"><?php echo $entry_situacao_nao_autorizada; ?></span></label>
				<div class="col-sm-10">
				  <select name="cielow_situacao_nao_autorizada_id" class="form-control">
					<?php foreach ($order_statuses as $order_status) { ?>
					<?php if ($order_status['order_status_id'] == $cielow_situacao_nao_autorizada_id) { ?>
					<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_situacao_capturada; ?>"><?php echo $entry_situacao_capturada; ?></span></label>
				<div class="col-sm-10">
				  <select name="cielow_situacao_capturada_id" class="form-control">
					<?php foreach ($order_statuses as $order_status) { ?>
					<?php if ($order_status['order_status_id'] == $cielow_situacao_capturada_id) { ?>
					<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_situacao_cancelada; ?>"><?php echo $entry_situacao_cancelada; ?></span></label>
				<div class="col-sm-10">
				  <select name="cielow_situacao_cancelada_id" class="form-control">
					<?php foreach ($order_statuses as $order_status) { ?>
					<?php if ($order_status['order_status_id'] == $cielow_situacao_cancelada_id) { ?>
					<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
			  </div>
			</div>
			<div class="tab-pane" id="tab-finalizacao">
			  <div class="form-group required">
				<label class="col-sm-2 control-label" for="input-titulo"><span data-toggle="tooltip" title="<?php echo $help_titulo; ?>"><?php echo $entry_titulo; ?></span></label>
				<div class="col-sm-10">
				  <input type="text" name="cielow_titulo" value="<?php echo $cielow_titulo; ?>" placeholder="<?php echo $entry_titulo; ?>" id="input-titulo" class="form-control" />
				  <?php if ($error_titulo) { ?>
				  <div class="text-danger"><?php echo $error_titulo; ?></div>
				  <?php } ?>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-image"><span data-toggle="tooltip" title="<?php echo $help_imagem; ?>"><?php echo $entry_imagem; ?></span></label>
				<div class="col-sm-10"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $no_image; ?>" /></a>
				  <input type="hidden" name="cielow_imagem" value="<?php echo $cielow_imagem; ?>" id="input-image" />
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-layout"><span data-toggle="tooltip" title="<?php echo $help_layout; ?>"><?php echo $entry_layout; ?></span></label>
				<div class="col-sm-10">
				  <select name="cielow_layout" id="input-layout" class="form-control">
					<?php if ($cielow_layout) { ?>
					<option value="1" selected="selected"><?php echo $text_skeleton; ?></option>
					<option value="0"><?php echo $text_bootstrap; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_skeleton; ?></option>
					<option value="0" selected="selected"><?php echo $text_bootstrap; ?></option>
					<?php } ?>
				  </select>
				</div>
			  </div>
			</div>
			<div class="tab-pane" id="tab-campos">
			  <div class="form-group required">
				<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_custom_razao_id; ?>"><?php echo $entry_custom_razao_id; ?></span></label>
				<div class="col-sm-4">
				  <label><span data-toggle="tooltip" title="<?php echo $help_campo; ?>"><?php echo $text_campo; ?> <i class="fa fa-question-circle" aria-hidden="true"></i></span></label>
				  <select name="cielow_custom_razao_id" class="form-control">
					<option value=""><?php echo $text_none; ?></option>
					<?php if ($cielow_custom_razao_id == 'N') { ?>
					<option value="N" selected="selected"><?php echo $text_nao_personalizado; ?></option>
					<?php } else { ?>
					<option value="N"><?php echo $text_nao_personalizado; ?></option>
					<?php } ?>
					<?php foreach ($custom_fields as $custom_field) { ?>
					<?php if ($custom_field['location'] == 'account') { ?>
					<?php if ($custom_field['type'] == 'text') { ?>
					<?php if ($custom_field['custom_field_id'] == $cielow_custom_razao_id) { ?>
					<option value="<?php echo $custom_field['custom_field_id']; ?>" selected="selected"><?php echo $custom_field['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></option>
					<?php } ?>
					<?php } ?>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-3">
				  <label><span data-toggle="tooltip" title="<?php echo $help_razao; ?>"><?php echo $text_razao; ?> <i class="fa fa-question-circle" aria-hidden="true"></i></span></label>
				  <input type="text" name="cielow_razao_coluna" value="<?php echo $cielow_razao_coluna; ?>" placeholder="" class="form-control" />
				</div>
			  </div>
			  <div class="form-group required">
				<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_custom_cnpj_id; ?>"><?php echo $entry_custom_cnpj_id; ?></span></label>
				<div class="col-sm-4">
				  <label><span data-toggle="tooltip" title="<?php echo $help_campo; ?>"><?php echo $text_campo; ?> <i class="fa fa-question-circle" aria-hidden="true"></i></span></label>
				  <select name="cielow_custom_cnpj_id" class="form-control">
					<option value=""><?php echo $text_none; ?></option>
					<?php if ($cielow_custom_cnpj_id == 'N') { ?>
					<option value="N" selected="selected"><?php echo $text_nao_personalizado; ?></option>
					<?php } else { ?>
					<option value="N"><?php echo $text_nao_personalizado; ?></option>
					<?php } ?>
					<?php foreach ($custom_fields as $custom_field) { ?>
					<?php if ($custom_field['location'] == 'account') { ?>
					<?php if ($custom_field['type'] == 'text') { ?>
					<?php if ($custom_field['custom_field_id'] == $cielow_custom_cnpj_id) { ?>
					<option value="<?php echo $custom_field['custom_field_id']; ?>" selected="selected"><?php echo $custom_field['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></option>
					<?php } ?>
					<?php } ?>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-3">
				  <label><span data-toggle="tooltip" title="<?php echo $help_cnpj; ?>"><?php echo $text_cnpj; ?> <i class="fa fa-question-circle" aria-hidden="true"></i></span></label>
				  <input type="text" name="cielow_cnpj_coluna" value="<?php echo $cielow_cnpj_coluna; ?>" placeholder="" class="form-control" />
				</div>
			  </div>
			  <div class="form-group required">
				<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_custom_cpf_id; ?>"><?php echo $entry_custom_cpf_id; ?></span></label>
				<div class="col-sm-4">
				  <label><span data-toggle="tooltip" title="<?php echo $help_campo; ?>"><?php echo $text_campo; ?> <i class="fa fa-question-circle" aria-hidden="true"></i></span></label>
				  <select name="cielow_custom_cpf_id" class="form-control">
					<option value=""><?php echo $text_none; ?></option>
					<?php if ($cielow_custom_cpf_id == 'N') { ?>
					<option value="N" selected="selected"><?php echo $text_nao_personalizado; ?></option>
					<?php } else { ?>
					<option value="N"><?php echo $text_nao_personalizado; ?></option>
					<?php } ?>
					<?php foreach ($custom_fields as $custom_field) { ?>
					<?php if ($custom_field['location'] == 'account') { ?>
					<?php if ($custom_field['type'] == 'text') { ?>
					<?php if ($custom_field['custom_field_id'] == $cielow_custom_cpf_id) { ?>
					<option value="<?php echo $custom_field['custom_field_id']; ?>" selected="selected"><?php echo $custom_field['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></option>
					<?php } ?>
					<?php } ?>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-3">
				  <label><span data-toggle="tooltip" title="<?php echo $help_cpf; ?>"><?php echo $text_cpf; ?> <i class="fa fa-question-circle" aria-hidden="true"></i></span></label>
				  <input type="text" name="cielow_cpf_coluna" value="<?php echo $cielow_cpf_coluna; ?>" placeholder="" class="form-control" />
				</div>
			  </div>
			  <div class="form-group required">
				<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_custom_numero_id; ?>"><?php echo $entry_custom_numero_id; ?></span></label>
				<div class="col-sm-4">
				  <label><span data-toggle="tooltip" title="<?php echo $help_campo; ?>"><?php echo $text_campo; ?> <i class="fa fa-question-circle" aria-hidden="true"></i></span></label>
				  <select name="cielow_custom_numero_id" class="form-control">
					<option value=""><?php echo $text_none; ?></option>
					<?php if ($cielow_custom_numero_id == 'N') { ?>
					<option value="N" selected="selected"><?php echo $text_nao_personalizado; ?></option>
					<?php } else { ?>
					<option value="N"><?php echo $text_nao_personalizado; ?></option>
					<?php } ?>
					<?php foreach ($custom_fields as $custom_field) { ?>
					<?php if ($custom_field['location'] == 'address') { ?>
					<?php if ($custom_field['type'] == 'text') { ?>
					<?php if ($custom_field['custom_field_id'] == $cielow_custom_numero_id) { ?>
					<option value="<?php echo $custom_field['custom_field_id']; ?>" selected="selected"><?php echo $custom_field['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></option>
					<?php } ?>
					<?php } ?>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-3">
				  <label><span data-toggle="tooltip" title="<?php echo $help_numero_fatura; ?>"><?php echo $text_numero_fatura; ?> <i class="fa fa-question-circle" aria-hidden="true"></i></span></label>
				  <input type="text" name="cielow_numero_fatura_coluna" value="<?php echo $cielow_numero_fatura_coluna; ?>" placeholder="" class="form-control" />
				</div>
				<div class="col-sm-3">
				  <label><span data-toggle="tooltip" title="<?php echo $help_numero_entrega; ?>"><?php echo $text_numero_entrega; ?> <i class="fa fa-question-circle" aria-hidden="true"></i></span></label>
				  <input type="text" name="cielow_numero_entrega_coluna" value="<?php echo $cielow_numero_entrega_coluna; ?>" placeholder="" class="form-control" />
				</div>
			  </div>
			  <div class="form-group required">
				<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_custom_complemento_id; ?>"><?php echo $entry_custom_complemento_id; ?></span></label>
				<div class="col-sm-4">
				  <label><span data-toggle="tooltip" title="<?php echo $help_campo; ?>"><?php echo $text_campo; ?> <i class="fa fa-question-circle" aria-hidden="true"></i></span></label>
				  <select name="cielow_custom_complemento_id" class="form-control">
					<option value=""><?php echo $text_none; ?></option>
					<?php if ($cielow_custom_complemento_id == 'N') { ?>
					<option value="N" selected="selected"><?php echo $text_nao_personalizado; ?></option>
					<?php } else { ?>
					<option value="N"><?php echo $text_nao_personalizado; ?></option>
					<?php } ?>
					<?php foreach ($custom_fields as $custom_field) { ?>
					<?php if ($custom_field['location'] == 'address') { ?>
					<?php if ($custom_field['type'] == 'text') { ?>
					<?php if ($custom_field['custom_field_id'] == $cielow_custom_complemento_id) { ?>
					<option value="<?php echo $custom_field['custom_field_id']; ?>" selected="selected"><?php echo $custom_field['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></option>
					<?php } ?>
					<?php } ?>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
				<div class="col-sm-3">
				  <label><span data-toggle="tooltip" title="<?php echo $help_complemento_fatura; ?>"><?php echo $text_complemento_fatura; ?> <i class="fa fa-question-circle" aria-hidden="true"></i></span></label>
				  <input type="text" name="cielow_complemento_fatura_coluna" value="<?php echo $cielow_complemento_fatura_coluna; ?>" placeholder="" class="form-control" />
				</div>
				<div class="col-sm-3">
				  <label><span data-toggle="tooltip" title="<?php echo $help_complemento_entrega; ?>"><?php echo $text_complemento_entrega; ?> <i class="fa fa-question-circle" aria-hidden="true"></i></span></label>
				  <input type="text" name="cielow_complemento_entrega_coluna" value="<?php echo $cielow_complemento_entrega_coluna; ?>" placeholder="" class="form-control" />
				</div>
			  </div>
			</div>
			<div class="tab-pane" id="tab-clearsale">
			  <div class="form-group required">
				<label class="col-sm-2 control-label" for="input-clearsale-codigo"><span data-toggle="tooltip" title="<?php echo $help_clearsale_codigo; ?>"><?php echo $entry_clearsale_codigo; ?></span></label>
				<div class="col-sm-10">
				  <input type="text" name="cielow_clearsale_codigo" value="<?php echo $cielow_clearsale_codigo; ?>" placeholder="<?php echo $entry_clearsale_codigo; ?>" id="input-clearsale-codigo" class="form-control" />
				  <?php if ($error_clearsale_codigo) { ?>
				  <div class="text-danger"><?php echo $error_clearsale_codigo; ?></div>
				  <?php } ?>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-clearsale-ambiente"><?php echo $entry_clearsale_ambiente; ?></label>
				<div class="col-sm-10">
				  <select name="cielow_clearsale_ambiente" id="input-clearsale-ambiente" class="form-control">
					<?php if ($cielow_clearsale_ambiente) { ?>
					<option value="1" selected="selected"><?php echo $text_producao; ?></option>
					<option value="0"><?php echo $text_homologacao; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_producao; ?></option>
					<option value="0" selected="selected"><?php echo $text_homologacao; ?></option>
					<?php } ?>
				  </select>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-clearsale-status"><?php echo $entry_status; ?></label>
				<div class="col-sm-10">
				  <select name="cielow_clearsale_status" id="input-clearsale-status" class="form-control">
					<?php if ($cielow_clearsale_status) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					<?php } ?>
				  </select>
				</div>
			  </div>
			</div>
			<div class="tab-pane" id="tab-fcontrol">
			  <div class="form-group required">
				<label class="col-sm-2 control-label" for="input-fcontrol-login"><span data-toggle="tooltip" title="<?php echo $help_fcontrol_login; ?>"><?php echo $entry_fcontrol_login; ?></span></label>
				<div class="col-sm-10">
				  <input type="text" name="cielow_fcontrol_login" value="<?php echo $cielow_fcontrol_login; ?>" placeholder="<?php echo $entry_fcontrol_login; ?>" id="input-fcontrol-login" class="form-control" />
				  <?php if ($error_fcontrol_login) { ?>
				  <div class="text-danger"><?php echo $error_fcontrol_login; ?></div>
				  <?php } ?>
				</div>
			  </div>
			  <div class="form-group required">
				<label class="col-sm-2 control-label" for="input-fcontrol-senha"><span data-toggle="tooltip" title="<?php echo $help_fcontrol_senha; ?>"><?php echo $entry_fcontrol_senha; ?></span></label>
				<div class="col-sm-10">
				  <input type="text" name="cielow_fcontrol_senha" value="<?php echo $cielow_fcontrol_senha; ?>" placeholder="<?php echo $entry_fcontrol_senha; ?>" id="input-fcontrol-senha" class="form-control" />
				  <?php if ($error_fcontrol_senha) { ?>
				  <div class="text-danger"><?php echo $error_fcontrol_senha; ?></div>
				  <?php } ?>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-fcontrol-status"><?php echo $entry_status; ?></label>
				<div class="col-sm-10">
				  <select name="cielow_fcontrol_status" id="input-fcontrol-status" class="form-control">
					<?php if ($cielow_fcontrol_status) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					<?php } ?>
				  </select>
				</div>
			  </div>
			</div>
		  </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>