<?php
// Establish database connection
require_once 'db_connection.php';
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve form data
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $email = $_POST["email"];
    $password = $_POST["password"];

    // Hash the password for security
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    // Prepare SQL statement to insert user data into the database
    $sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sss", $username, $email, $hashedPassword);

    // Execute the prepared statement
    if ($stmt->execute()) {
        echo "Registration successful! Please <a href='login.html'>login</a> to continue.";
    } else {
        echo "Error: " . $stmt->error;
    }
}

// Close database connection
$conn->close();
?>
