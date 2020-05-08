<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="shortcut icon" href="../home-img/iconlogo.ico" />
</head>
<div class="text-center">
<?php 

if($is_admin)
{

	if($is_edit)
	{
	
		echo '<div class="msg">Message is edited.</div>';
	
	}
	else
	{
	
	?>
	<div style="padding-left:40px; padding-right:40px;">
		<div class="msg">Message id: <?php echo $id_to_edit; ?></div>
		<form action="?id=<?php echo $id_to_edit; ?>" method="POST">
		<textarea name="message" cols="50" rows="4" class="form-control" maxlength="450" required placeholder="Type your message here"><?php echo $message; ?></textarea>
		<input type = "submit" class="btn btn-success mt-2" name = "ok" value = "Save"/>
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
<div class = "msg"><a href = "../">Home</div>
</div>