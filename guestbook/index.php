<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="shortcut icon" href="../home-img/iconlogo.ico" />
</head>

<body>
<?php

$title = "Guest Book";

include 'config.php';
include 'db_config.php';
include 'admin/auth.php';


$errors = '';
$msg_after_refresh = isset($_POST['message']) ? $_POST['message'] : '';
$posts = 0;
$isadd = (isset($_POST['add']))? true : false;



if($isadd)
{
    if(empty(trim($_POST['message'])))
    {
		$errors = "Enter message!";
    }
    else
    {
		if($_SESSION['captcha'] == $_POST['captcha'])
		{

			$msg_to_save = trim(htmlspecialchars($_POST['message']));
			
			if($is_admin)
			{
				$name_to_save = "Pius Kobler";
			}
			else
			{
				$name_to_save = trim(htmlspecialchars($_POST['name']));
			}
			
			

			$msg_to_save = str_replace(':)','<img src="img/smile.png" width="20" height="20"/>',$msg_to_save);
			$msg_to_save = str_replace(':-)','<img src="img/smile.png" width="20" height="20"/>',$msg_to_save);
			
			

			$STH = $pdo->prepare("INSERT INTO book (msg,date,name) VALUES (:msg,now(),:name);");
			$STH->bindParam(':msg',$msg_to_save);
			$STH->bindParam(':name',$name_to_save);
			$STH->execute();
	
			$msg_after_refresh = '';
		}
		else
		{
			$errors = '<script>alert(`Wrong captcha!`)</script>';
		}
    }
}



if(isset($_POST['refresh']))
{
    $msg_after_refresh = $_POST['message'];
}




$pg = $pdo->query('SELECT COUNT(id) AS total FROM book;');
$posts = $pg->fetch()['total'];
$pages = intval(($posts-1)/10)+1; 



if(isset($_GET['p']))
{
	$page = $_GET['p'];
	if($page < 1 || $page > $pages)
	{
		$page = 1;
	}
}
else
{
	$page = 1;
}

$page_at = $page * 10 - 10;

$rows = $pdo->prepare('SELECT * FROM book ORDER BY id DESC LIMIT :pageat,10 ;');
$rows->bindParam(':pageat',$page_at,PDO::PARAM_INT);
$rows->execute();

$messages = $rows->fetchAll();



if($page > 1)
{
	$prev = '<a href="?p='.($page-1).'">Previous</a> ';
 
}
else
{
	$prev = 'Previous ';
}

if($page < $pages)
{
	$post = ' <a href="?p='.($page+1).'">Next</a>';
}
else
{
	$post = ' Next';
}

$navi_links = $prev.'|'.$post.' (Page: '.$page.')';



$_SESSION['captcha'] = rand(1000,9999);
$captcha = $_SESSION['captcha'];


include 'tpl/header.tpl';
 include 'tpl/index.tpl';
include 'tpl/footer.tpl';
?>
</body>
</html>