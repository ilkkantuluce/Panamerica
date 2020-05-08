<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="shortcut icon" href="../home-img/iconlogo.ico" />
</head>
<style>
		body {
            background-image: url('../home-img/background.png');
            background-repeat: no-repeat;
            background-position: bottom;
          }
        
        @media screen and (max-width: 1200px) {
            body {
                background: rgb(238, 156, 56);
                background: linear-gradient(0deg, rgba(238, 156, 56, 1) 0%, rgba(203, 69, 34, 1) 48%, rgba(116, 40, 42, 1) 100%);
            }
        }
        @media screen and (min-width: 1490px) {
            body {
                background: rgb(238, 156, 56);
                background: linear-gradient(0deg, rgba(238, 156, 56, 1) 0%, rgba(203, 69, 34, 1) 48%, rgba(116, 40, 42, 1) 100%);
            }
        }
</style>
<div class="text-center">
<?php

$title = "Guestbook Admin login";
$errors = '';
$is_success = false;

include 'config.php';

if(!empty($_POST['ok']))
{
	if($_POST['password'] != '')
	{
		if($hash_pass == hash("sha256",$_POST['password'],false))
		{
			setcookie("pass",$hash_pass);
 			$is_success = true;
		}
		else
		{
			$errors =   '<p style="color:white !important">Wrong password!</p>'; 
		}
	}
	else
	{
		$errors = 'Enter password!';
	}
}

include 'tpl/header.tpl';
include 'tpl/login.tpl';
include 'tpl/footer.tpl';

?>
</div>