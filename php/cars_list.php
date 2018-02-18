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
		<div class="row">
		<?php
		// Create connection
		$tabelle = new mysqli($servername, $username, $password, $dbname);
		// Check connection
		if ($tabelle->connect_error) {
		    die("Connection failed: " . $tabelle->connect_error);
		}
		
		$sql = "SELECT carImage, carId, carModel, horsepower,cost FROM cars";
		$result = mysqli_query($tabelle, $sql);

		echo "
			<h1>Cars</h1>
    		<table>
			  <tr>
			  	<th>Car ID</th>
				<th>Image</th>
			    <th>Model</th>
			    <th>HPower</th>
			    <th>Cost</th>
			  </tr>";
				
		while($row = mysqli_fetch_assoc($result)) {

			echo"<tr> 
					<td>". $row["carId"] ."</td>
					<td>
						<img src='". $row["carImage"] ."'>
					</td>
				    <td>". $row["carModel"] ."</td>
				    <td>". $row["horsepower"]." </td>
				    <td>". $row["cost"] ."</td>
				</tr>
				";
			    } 
			echo "</table>";

				// Free result set
				mysqli_free_result($result);
				// Close connection
				mysqli_close($tabelle);
			?> 
			</div>
		</div>

	</body> 