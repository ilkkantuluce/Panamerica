<h1 class="text-center mt-4 mb-2" style="color: #E9D02D; text-shadow: 2px -3px 2px #000000;">Admin Login</h1>
<div class="msg"> </div>
<?php
if($errors != '')
{
	echo '<div class="error">'.$errors.'</div>';
}
if($is_success)
{
	echo '<div class="msg" style="color:white;">Success! Click on home to continue<br/> </div>';
}
else { ?>
<form action="?" method="POST">
<div class="container">
	<div class="row">
	<div class="col-md-4">
	</div>
	<div class="col-md-4">
	
 
	<input type="password" class="form-control" name="password" placeholder="Password" required/>
	<input type="submit" class="btn btn-success mt-2" name="ok" value="Enter"/>
 
	</div>
	<div class="col-md-3">
	</div>
	</div>
	</div>

</form>
<?php } ?>
<div class="msg"><a style="color:white !important;" href="guestbook.php">Home</a></div>