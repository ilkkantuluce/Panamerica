<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="shortcut icon" href="../home-img/iconlogo.ico" />
</head>
<div class="text-center">
<?php 

if($is_admin)
{

	if($is_delete)
	{
	
		echo '<div class="msg">Message is deleted.</div>';
	
	}
	else
	{
	
	?>
	<div class="text-center">

		<div class="msg">Are you sure you want to delete message: <?php echo $message; ?></div>
		<form action="?id=<?php echo $id_to_delete; ?>" method="POST">
		<input type = "submit" class="btn btn-success mt-2" name = "ok" value = "Yes"/>
		<a href="../index.php"><input type = "button" class="btn btn-danger mt-2"  value = "No"/></a>
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