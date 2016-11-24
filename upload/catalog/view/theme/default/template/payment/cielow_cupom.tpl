<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row">
    <div id="content" class="col-sm-12">
	  <div class="row">
		<div class="col-sm-4">
		  <div id="cupom" class="panel panel-info">
			<div class="panel-heading"><?php echo $heading_title; ?></div>
			<div class="panel-body">
			<?php echo nl2br($text_cupom); ?>
			</div>
		  </div>
		  <div class="buttons">
			<div class="pull-right">
			  <input type="button" value="<?php echo $button_imprimir; ?>" id="button-print" class="btn btn-primary" />
			</div>
		  </div>
		</div>
		<div class="col-sm-8">
		  <div id="cupom" class="panel panel-info">
			<div class="panel-body">
			<?php echo $text_importante; ?>
			</div>
		  </div>
		</div>
	  </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="catalog/view/javascript/jquery/cielow/js/jquery.printThis.min.js"></script>
<script type="text/javascript"><!--
$('#button-print').on('click', function() {
	$("#cupom").printThis();
});
//--></script>
<?php echo $footer; ?>