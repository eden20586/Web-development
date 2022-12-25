<?php
	//Input posted data.
	$id = $_POST["Id"];
	$position_in_work = $_POST["Position_in_work"];
	$status = $_POST["status"];
	$age = $_POST["age"];

	//Create connection to the database.
	$host="localhost:3336"; // Host name  
	$dbusername="root"; //username   
	$dbpassword=""; //username password   
	$dbname="customize_cars"; //db name      
	// Connect to server and select database.   
	$con = mysqli_connect($host,$dbusername,$dbpassword,$dbname);
  	
	//SQL query - user Details   
	$query = "SELECT cars_models.model_name , cars_models.price , cars_models.year , cars_models.finish_level , cars_models.Intercity_fuel_consumption , cars_models.urban_fuel_consumption
			  FROM cars_models
			  JOIN customers_and_cars_model ON cars_models.chassis_num = customers_and_cars_model.chassis_num 
			  JOIN customers ON customers.id  
			  WHERE cars_models.price <= customers.max_budget AND customers.position_in_work = '$position_in_work'  AND customers.status = '$status' AND customers.age = '$age' AND customers.id = '$id' ";
	
	//Run SQL query
	$results = mysqli_query($con, $query) or die ("cannot get client data ".mysqli_error($con));				

	if($results->num_rows > 0) 
	{      
		//Open HTML table
		echo '<h1>Results customization cars to customer : </h1> <br />';
		echo '<h2> We recived your request in successful. </h2> <br />';
		echo '<h2> There is a list of cars that customized to you : </h2> <br />';
		echo '<table border=1>';
		echo '<font size=5>';
		
		//Go through the query result set and extract data from it.
		while ($row = mysqli_fetch_array($results))
		{		

				echo '<tr>';
				echo '<td> Car model name :' .$row['model_name'].'</td>';
				echo '<td> Car price: '.$row['price'].'</td>';
				echo '<td> Car year :' .$row['year'].'</td>';
				echo '<td> Finish_level :' .$row['finish_level'].'</td>';
				echo '<td> Intercity_fuel_consumption :' .$row['Intercity_fuel_consumption'].'</td>';
				echo '<td> Urban_fuel_consumption :' .$row['urban_fuel_consumption'].'</td>';
				echo '</tr>';
		
		}
	
		echo '</font>';
		echo '</table>';
		echo '<hr />';
			
	}else
	{  
		echo "ERROR: no list to show";  
		echo '<hr />';
	}  
	
	
	//Close the SQL connection.
	mysqli_close($con);
			
?>