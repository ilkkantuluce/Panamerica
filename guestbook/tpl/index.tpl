<div class="mt-2 mb-2">
<?php
if($is_admin) 
{
	echo '<div class="msg text-center mb-2"><h4>Welcome Pius Kobler</h4><a href="logout.php">Logout</a></div>';
}
else
{
	echo '';
}
?>
<?php
if($errors != '') echo '<div class="error">'.$errors.'</div>';
?>

<div class="form-group col-md-6">
<form action="?p=<?php echo $page;?>" method="POST">
	<label for="name" >What's your name?</label>
	<input type="text" class="form-control mb-2" id="name" name="name" required> 
	<label for="message" >What's your story?</label>
	<textarea name="message" id="message" class="form-control mb-1" cols="50" rows="4" maxlength="450" required><?php echo $msg_after_refresh; ?></textarea>
 
	<label for="captcha">Please enter security code:</label>  <b style="font-size:20px;" class="col-form-label"><strike><?php echo $captcha; ?></strike></b>
	<input class="form-control" id="captcha" type="text" name="captcha"  required />
	 
	<input name="reset"  type="reset" class="Stil1 btn btn-danger mt-2" value="Reset">
	<input type="submit" name="add"  class="Stil1 btn btn-success mt-2" value="Submit">
	 


</form>
</div>
<hr>

<?php
foreach ($messages as $row)
{
    echo '<div class="msg"><img src="img/guest1.png" class="mb-2" width="23"  alt="guest"/> <b style="font-size:20px;">'.$row['name'].'</b>  '    ;
	
	if($is_admin)
	{
		echo ' <a href="admin/edit.php?id='.$row['id'].'"><img class="mb-2" src="img/edit.png" width="20"   alt="e"/></a>';
		echo ' <a href="admin/delete.php?id='.$row['id'].'"><img class="mb-2" src="img/delete.png" width="20"   alt="x"/></a>';
	}
	echo '<br/> <p style="margin: 2px !important; padding: 2px !important; font-size:17px;"> '.$row['msg'] ;
	if($row['answer'] != '') echo '<br/><b>Answer:</b> '.$row['answer'] ;
	if($is_admin) echo ' <a href="admin/answer.php?id='.$row['id'].'"><img src="img/answer.png" alt="answer" width="20" /></a>'  ;
	
	echo '</p> <div class="ml-1" style="font-size:14px;">'.$row['date']  ;
	echo '</div> ';
	echo ' </div> <hr>  ' ;
	
}
if($posts == 0)
{
	echo '<div class="msg">No messages yet, be the first!</div>' ;
}
?>
<div class="msg">
<?php echo $navi_links; /* Links of navi */ ?>
</div>
<div class="msg">Pages: <?php echo $pages; ?><br/>Posts: <?php echo $posts; ?></div>


</div>



