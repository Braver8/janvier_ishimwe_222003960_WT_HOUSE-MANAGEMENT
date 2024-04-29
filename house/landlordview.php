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

// Update Landlord
if (isset($_POST['update'])) {
    $landlord_id = $_POST['landlord_id'];
    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $address = $_POST['address'];

    $sql = "UPDATE landlords SET name='$name', email='$email', phone='$phone', address='$address' WHERE id='$landlord_id'";

    if ($conn->query($sql) === TRUE) {
        echo "Landlord updated successfully";
    } else {
        echo "Error updating landlord: " . $conn->error;
    }
}

// Delete Landlord
if (isset($_POST['delete'])) {
    $landlord_id = $_POST['landlord_id'];

    $sql = "DELETE FROM landlords WHERE id='$landlord_id'";

    if ($conn->query($sql) === TRUE) {
        echo "Landlord deleted successfully";
    } else {
        echo "Error deleting landlord: " . $conn->error;
    }
}

// Fetch all landlords
$sql = "SELECT * FROM landlords";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Display landlords in a table
    echo "<h2>Landlords Listing</h2>";
    echo "<table border='1'>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Action</th>
            </tr>";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row['name'] . "</td>";
        echo "<td>" . $row['email'] . "</td>";
        echo "<td>" . $row['phone'] . "</td>";
        echo "<td>" . $row['address'] . "</td>";
        echo "<td>
                <form action='".$_SERVER['PHP_SELF']."' method='post'>
                    <input type='hidden' name='landlord_id' value='" . $row['id'] . "'>
                    <input type='text' name='name' value='" . $row['name'] . "'>
                    <input type='text' name='email' value='" . $row['email'] . "'>
                    <input type='text' name='phone' value='" . $row['phone'] . "'>
                    <input type='text' name='address' value='" . $row['address'] . "'>
                    <input type='submit' name='update' value='Update'>
                    <input type='submit' name='delete' value='Delete' onclick='return confirm(\"Are you sure?\");'>
                </form>
              </td>";
        echo "</tr>";
    }

    echo "</table>";
} else {
    echo "No landlords found";
}

// Close database connection
$conn->close();
?>
