<h5><?php echo $heading_title; ?></h5>
<form action="" method="POST" role="form">
  <div class="form-group">
  <input type="text" name="txtname" id="txtname" value="" placeholder="<?php echo $txtName;?>" class="form-control"  />
  <input type="email" name="txtemail" id="txtemail" value="" placeholder="<?php echo $txtEmail;?>" class="form-control"  />
  <button type="submit" class="btn btn-default" onclick="return subscribe();"><?php echo $btnNewsletter; ?></button>  
  </div>   
</form>
<script>
  function subscribe()
  {
    var name = $('#txtname').val();
    if(name != "")
    {
      var emailpattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
      var email = $('#txtemail').val();
      if(email != "")
      {
        if(!emailpattern.test(email))
        {
          alert("<?php echo $txtErrorMailInvalid;?>");
          return false;
        }
        else
        {
          $.ajax({
            url: 'index.php?route=extension/module/newsletters/news',
            type: 'post',
            data: 'name=' + name + '&email=' + email,
            dataType: 'json',
            success: function(json) {
              alert(json.message);
            }
          });
          return false;
        }
      }
      else
      {
        alert("<?php echo $txtErrorMail;?>");
        $(email).focus();
        return false;
      }
    }
    else
    {
      alert("<?php echo $txtErrorName;?>");
      $(name).focus();
      return false;
    }

  }
</script>
