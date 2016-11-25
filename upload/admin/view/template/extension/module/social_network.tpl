<?php echo $header; ?>

<?php echo $column_left; ?>


<div id="content">

  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
	  
        <button type="submit" form="form-social_network" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-social_network" class="form-horizontal">
          
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-addthis"><span data-toggle="tooltip" title="<?php echo $help_id_addthis; ?>"><?php echo $entry_id_addthis; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="addthis" value="<?php echo $addthis; ?>" placeholder="<?php echo $entry_id_addthis; ?>" id="input-addthis" class="form-control" />
              <?php if ($error_addthis) { ?>
              <div class="text-danger"><?php echo $error_addthis; ?></div>
              <?php } ?>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<?php echo $footer; ?>