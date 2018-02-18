<?php
	ob_start();
	session_start();
	require_once 'dbconnect.php';
	// if session is not set this will redirect to login page
	if( !isset($_SESSION['user']) ) {
		header("Location: index.php");
		exit;
	}
	// select logged-in users detail
	$res=mysqli_query($conn, "SELECT * FROM users WHERE userId=".$_SESSION['user']);
	$userRow=mysqli_fetch_array($res, MYSQLI_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<nav class="navbar navbar-inverse">
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
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="index.php">Home</a></li>
	        <li>
	        	<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal2" onclick="showofficelist()">Office List</button>
	        </li>
	        <li>
	        	<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal2" onclick="showofficelist()">Car List</button>
	        </li>
	        <li>
				<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal2" onclick="showofficelist()">Car Locations</button>
	        </li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a class="nav-link" href="#">Hi <?php echo $userRow['userEmail']; ?></a></li>
	        <li><a href="logout.php?logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
	      </ul>
	    </div>
	  </div>
	</nav>	
		
	<hr>
  <!-- Modal -->
	  	<div class="modal fade" id="myModal2" role="dialog">
	    	<div class="modal-dialog">
	   
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title"> List</h4>
		        </div>
		        <div class="modal-body">
		          	<p id="demo"></p>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div>
	    </div>

	    <footer class="bg-info" >
      		<center>copyright by Ying Qi 2018</center>
    	</footer>


    </body>
</html>
<?php ob_end_flush(); ?>