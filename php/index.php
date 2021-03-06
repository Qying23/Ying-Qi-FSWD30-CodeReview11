<?php
	ob_start();
	session_start();
	require_once 'dbconnect.php';
	// it will never let you open index(login) page if session is set
	if ( isset($_SESSION['user'])!="" ) {
		header("Location: home.php");
		exit;
	}
	$error = false;
	if( isset($_POST['btn-login']) ) {
		// prevent sql injections/ clear user invalid inputs
		$email = trim($_POST['email']);
		$email = strip_tags($email);
		$email = htmlspecialchars($email);

		$pass = trim($_POST['pass']);
		$pass = strip_tags($pass);
		$pass = htmlspecialchars($pass);
		// prevent sql injections / clear user invalid inputs
		if(empty($email)){
			$error = true;
			$emailError = "Please enter your email address.";
		} else if ( !filter_var($email,FILTER_VALIDATE_EMAIL) ) {
			$error = true;
			$emailError = "Please enter valid email address.";
		}
		if(empty($pass)){
			$error = true;
			$passError = "Please enter your password.";
		}
		// if there's no error, continue to login
		if (!$error) {
			$password = hash('sha256', $pass); // password hashing using SHA256
			$res=mysqli_query($conn, "SELECT userId, userName, userPass FROM users WHERE userEmail='$email'");
			$row=mysqli_fetch_array($res, MYSQLI_ASSOC);
			$count = mysqli_num_rows($res); // if uname/pass correct it returns must be 1 row
			//compare the inserted data with database
			if( $count == 1 && $row['userPass']==$password ) {
				$_SESSION['user'] = $row['userId'];
				header("Location: home.php");
			} else {
				$errMSG = "Incorrect Credentials, Try again...";
			}
		}
	}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-info">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="index.php">PHP Car Rental Agency</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="register.php"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="index.php"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>


    <div class="container">
      <div class="row">
        <div class="col-lg-6 col-md-6 col-6 offset-6 log">
        
			<form method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" autocomplete="off">

		    <h2>Sign In.</h2>

		    <hr />

		    <?php
		   		if ( isset($errMSG) ) {
					echo $errMSG; 				//php open and close?
		   		}
		   	?>

		    <input type="email" name="email" class="form-control" placeholder="Your Email" value="<?php echo $email; ?>" maxlength="40" />

			<span class="text-danger"><?php echo $emailError; ?></span>

			<input type="password" name="pass" class="form-control" placeholder="Your Password" maxlength="15" />
			
			<span class="text-danger"><?php echo $passError; ?></span>

			<hr />

			<button class="btn btn-block btn-warning" type="submit" name="btn-login">Sign In</button>

		    <hr />

			<a href="register.php">Sign Up Here...</a>

	    	</form>
			</div>
		</div>
		 
	</div>

</body>
</html>

<?php ob_end_flush(); ?>