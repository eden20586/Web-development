<?php
	//Input posted data.
	$id = $_POST["id"];
	
	//Create connection to the database.
	$host="localhost:3336"; // Host name  
	$dbusername="root"; //username   
	$dbpassword=""; //username password   
	$dbname="customize_cars"; //db name      
	// Connect to server and select database.   
	$con = mysqli_connect($host,$dbusername,$dbpassword,$dbname);
  	
	//SQL query - user Details   
	$query = "DELETE FROM customers WHERE (id = $id);";
	
	$query_two = "SELECT *
				  FROM customers
				  WHERE id = '$id';";
	//Run SQL query
	$results_two = mysqli_query($con, $query_two) or die ("cannot get client data ".mysqli_error($con));				
	$results = mysqli_query($con, $query) or die ("cannot get client data ".mysqli_error($con));				
	if($results_two->num_rows > 0) 
	{      
		//Open HTML table
		echo '<h1>Results customization cars to customer : </h1> <br />';
		echo '<h2> Your details has deleted in successful from the system. </h2>';
		echo '<h2> The details are : </h2> <br />';
		echo '<table border=1>';
		echo '<font size=5>';
		
		//Go through the query result set and extract data from it.
		while ($row = mysqli_fetch_array($results_two))
		{		
			echo '<tr>';
			echo '<td> Id: '.$row['id'].'</td>';
			echo '<td> Age: '.$row['age'].'</td>';
			echo '<td> Status: '.$row['status'].'</td>';
			echo '<td> Max budget :' .$row['max_budget'].'</td>';
			echo '<td> Position in work :' .$row['position_in_work'].'</td>';
			echo '<td> Living area :' .$row['living_area'].'</td>';
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