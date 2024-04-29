<?php
// Database connection details
require_once 'db_connection.php';
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Update Property
if (isset($_POST['update'])) {
    $property_id = $_POST['property_id'];
    $address = $_POST['address'];
    $rent = $_POST['rent'];
    $bedrooms = $_POST['bedrooms'];
    $bathrooms = $_POST['bathrooms'];
    $description = $_POST['description'];

    $sql = "UPDATE properties SET address='$address', rent='$rent', bedrooms='$bedrooms', bathrooms='$bathrooms', description='$description' WHERE id='$property_id'";

    if ($conn->query($sql) === TRUE) {
        echo "Property updated successfully";
    } else {
        echo "Error updating property: " . $conn->error;
    }
}

// Delete Property
if (isset($_POST['delete'])) {
    $property_id = $_POST['property_id'];

    $sql = "DELETE FROM properties WHERE id='$property_id'";

    if ($conn->query($sql) === TRUE) {
        echo "Property deleted successfully";
    } else {
        echo "Error deleting property: " . $conn->error;
    }
}

// Fetch all properties
$sql = "SELECT * FROM properties";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Display properties in a table
    echo "<h2>Properties Listing</h2>";
    echo "<table border='1'>
            <tr>
                <th>Address</th>
                <th>Rent</th>
                <th>Bedrooms</th>
                <th>Bathrooms</th>
                <th>Description</th>
                <th>Action</th>
            </tr>";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<form action='".$_SERVER['PHP_SELF']."' method='POST'>";
        echo "<td><input type='text' name='address' value='" . $row['address'] . "'></td>";
        echo "<td><input type='text' name='rent' value='" . $row['rent'] . "'></td>";
        echo "<td><input type='text' name='bedrooms' value='" . $row['bedrooms'] . "'></td>";
        echo "<td><input type='text' name='bathrooms' value='" . $row['bathrooms'] . "'></td>";
        echo "<td><input type='text' name='description' value='" . $row['description'] . "'></td>";
        echo "<td>
                <input type='hidden' name='property_id' value='" . $row['id'] . "'>
                <input type='submit' name='update' value='Update'>
                <input type='submit' name='delete' value='Delete' onclick='return confirm(\"Are you sure?\");'>
              </td>";
        echo "</form>";
        echo "</tr>";
    }

    echo "</table>";
} else {
    echo "No properties found";
}

// Close database connection
$conn->close();
?>
