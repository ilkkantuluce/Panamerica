<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="shortcut icon" href="../home-img/iconlogo.ico" />
</head>
<div class="text-center">
<?php 

if($is_admin)
{

	if($is_answered)
	{
	
		echo '<div class="msg">Answer is added.</div>';
	
	}
	else
	{
	
	?>
	<div style="padding-left:40px; padding-right:40px;">
	 
	
 

		<div class="msg">Message id: <?php echo $id_to_answer; ?></div>
		<div class="msg">Message text: <?php echo $message; ?></div>
		<form action="?id=<?php echo $id_to_answer; ?>" method="POST">
		<textarea name="answer" cols="50" rows="4" class="form-control" required maxlength="450" placeholder="Type your answer here"><?php echo $answer; ?></textarea> 
		<input type = "submit" class="btn btn-success mt-2" name = "ok" value = "Answer"/>
		</form>
	 
	 
	</div>
	<?php
	}
}
else
{
?>
<div class="msg">Access denied!</div>
<?php
}
?>
<div class = "msg"><a href = "../index.php">Home</div>
</div>