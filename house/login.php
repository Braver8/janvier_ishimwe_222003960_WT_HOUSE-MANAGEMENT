<?php
// Establish database connection
require_once 'db_connection.php';

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve form data
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $usernameOrEmail = $_POST["username_or_email"];
    $password = $_POST["password"];

    // Prepare SQL statement to fetch user data based on username or email
    $sql = "SELECT * FROM users WHERE username = ? OR email = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $usernameOrEmail, $usernameOrEmail);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 1) {
        // User found, verify password
        $user = $result->fetch_assoc();
        if (password_verify($password, $user["password"])) {
            // Password is correct, set session and redirect to home page
            session_start();
            $_SESSION["username"] = $user["username"];
            header("Location: home.html");
            exit();
        } else {
            // Incorrect password
            echo "Incorrect username/email or password.";
        }
    } else {
        // User not found
        echo "User not found.";
    }
}

// Close database connection
$conn->close();
?>
