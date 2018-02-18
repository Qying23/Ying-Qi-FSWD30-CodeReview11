<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cr11_Ying_Qi_php_car_rental";
?>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
	<div class="container">
    <p>  
        <a class="btn btn-sm btn-warning"  href="home.php">Home</a>
      </p> 
	</div>
	<div class="container">
    	<div class="row">
		<?php
		// Create connection
		$tabelle = new mysqli($servername, $username, $password, $dbname);
		// Check connection
		if ($tabelle->connect_error) {
		    die("Connection failed: " . $tabelle->connect_error);
		}
		 $sql = "SELECT carId, carImage, carModel, cost, adress, city, zipCode FROM cars LEFT JOIN location ON cars.fk_locationId = location.locationId";
		 
		 $result = mysqli_query($tabelle, $sql);

		        echo "
		          <h1>Cars Location</h1>
		            <table>
		            <tr>
			            <th>Car ID</th>
			            <th>Image</th>
			            <th>Model</th>
						<th>Cost</th>
			            <th>Adress</th>
			            <th>City</th>
			            <th>Zip-Code</th>
		            </tr>";
		        
		        while($row = mysqli_fetch_assoc($result)) {

		        echo"<tr>
						<td>". $row["carId"] ."</td>
						<td>
							<img src='". $row["carImage"] ."'>
						</td>
				        <td>". $row["carModel"] ."</td>
						<td>". $row["cost"] ." €</td>
				        <td>". $row["adress"] ."</td>
				        <td>". $row["city"] ."</td>
				        <td>". $row["zipCode"] ."</td>
		              </tr>
		          ";
		        } 
				echo "</table>";
		    
		        // Free result set
		        mysqli_free_result($result);
		        // Close connection
		        mysqli_close($tabelle);
		      ?> 
	</body>
	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
</html>