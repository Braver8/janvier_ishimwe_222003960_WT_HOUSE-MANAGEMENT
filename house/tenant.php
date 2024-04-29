<?php
// Database connection details
require_once 'db_connection.php';
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get form data using POST method
$name = $_POST['name'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$move_in_date = $_POST['move_in_date'];
$rent_amount = $_POST['rent_amount'];
$property_id = $_POST['property_id'];

// Prepare SQL statement to insert data into tenants table
$sql = "INSERT INTO tenants (name, email, phone, move_in_date, rent_amount, property_id)
        VALUES ('$name', '$email', '$phone', '$move_in_date', '$rent_amount', '$property_id')";

// Execute SQL statement
if ($conn->query($sql) === TRUE) {
    echo "New tenant added successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Close database connection
$conn->close();
?>
