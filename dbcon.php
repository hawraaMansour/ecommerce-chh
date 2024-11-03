<?php

$servername = "localhost";
$username = "root";
$password = "";  // Add your MySQL root password here if you have set one.
$dbname = "grocery";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
} else {
  
}
?>

