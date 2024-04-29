<?php
// Database connection details
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "house_rental";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get form data using POST method
$address = $_POST['address'];
$rent = $_POST['rent'];
$bedrooms = $_POST['bedrooms'];
$bathrooms = $_POST['bathrooms'];
$description = $_POST['description'];

// Prepare SQL statement to insert data into properties table
$sql = "INSERT INTO properties (address, rent, bedrooms, bathrooms, description)
        VALUES ('$address', '$rent', '$bedrooms', '$bathrooms', '$description')";

// Execute SQL statement
if ($conn->query($sql) === TRUE) {
    echo "New property added successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Close database connection
$conn->close();
?>
