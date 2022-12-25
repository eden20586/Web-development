<?php
	//Create connection to the database.
	$host="localhost:3336"; // Host name    
	$dbusername="root"; //username   
	$dbpassword=""; //username password   
	$dbname="customize_cars"; //db name
	// Connect to server and select database.   
	$con = mysqli_connect($host,$dbusername,$dbpassword,$dbname);

	//Input posted data.
	$id = $_POST["id"];
	$car_manufacturer_name = $_POST["car_manufacturer_name"];
	$living_area = $_POST["living_area"];		
	
	//SQL query - user Details   
	$query = "SELECT * 
			  FROM licensed_garages , customers
			  WHERE license_from='$car_manufacturer_name' AND activity_area='$living_area' AND customers.id = '$id' ;";
	
	//Run SQL query
	$results = mysqli_query($con, $query) or die ("cannot get client data ".mysqli_error($con));				

	if($results->num_rows > 0) 
	{      
		//Open HTML table
		echo '<h1>Results customization licensed garages to customer : </h1> <br />';
		echo '<h2> We recived your request in successful. </h2> <br />';
		echo '<h2> There is a list of licensed garages that customized to you with your car : </h2> <br />';
		echo '<table border=1>';
		echo '<font size=5>';
		
		//Go through the query result set and extract data from it.
		while ($row = mysqli_fetch_array($results))
		{		
			echo '<tr>';
			echo '<td> Gargage activity: '.$row['activity_area'].'</td>';
			echo '<td> Garage activity time: '.$row['garage_activity_time'].'</td>';
			echo '<td> Gargage name: '.$row['garage_name‏'].'</td>';
			echo '<td> Garage address: ‏'.$row['garage_address'].'</td>';
			echo '</tr>';

		}
		echo '</font>';
		echo '</table>';
		echo '<hr />';
	}
	else 
	{  
		echo "ERROR: no list to show";  
		echo '<hr />';
	}          
		
	//Close the SQL connection.
	mysqli_close($con);
			
?>