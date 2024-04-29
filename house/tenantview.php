<?php
// Database connection details
require_once 'db_connection.php';

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Update Tenant
if (isset($_POST['update'])) {
    $tenant_id = $_POST['tenant_id'];
    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $move_in_date = $_POST['move_in_date'];
    $rent_amount = $_POST['rent_amount'];
    $property_id = $_POST['property_id'];

    $sql = "UPDATE tenants SET name='$name', email='$email', phone='$phone', move_in_date='$move_in_date', rent_amount='$rent_amount', property_id='$property_id' WHERE id='$tenant_id'";

    if ($conn->query($sql) === TRUE) {
        echo "Tenant updated successfully";
    } else {
        echo "Error updating tenant: " . $conn->error;
    }
}

// Delete Tenant
if (isset($_POST['delete'])) {
    $tenant_id = $_POST['tenant_id'];

    $sql = "DELETE FROM tenants WHERE id='$tenant_id'";

    if ($conn->query($sql) === TRUE) {
        echo "Tenant deleted successfully";
    } else {
        echo "Error deleting tenant: " . $conn->error;
    }
}

// Fetch all tenants
$sql = "SELECT * FROM tenants";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Display tenants in a table
    echo "<h2>Tenants Listing</h2>";
    echo "<table border='1'>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Move-in Date</th>
                <th>Rent Amount</th>
                <th>Property ID</th>
                <th>Action</th>
            </tr>";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row['name'] . "</td>";
        echo "<td>" . $row['email'] . "</td>";
        echo "<td>" . $row['phone'] . "</td>";
        echo "<td>" . $row['move_in_date'] . "</td>";
        echo "<td>$" . $row['rent_amount'] . "</td>";
        echo "<td>" . $row['property_id'] . "</td>";
        echo "<td>
                <form action='".$_SERVER['PHP_SELF']."' method='post'>
                    <input type='hidden' name='tenant_id' value='" . $row['id'] . "'>
                    <input type='text' name='name' value='" . $row['name'] . "'>
                    <input type='text' name='email' value='" . $row['email'] . "'>
                    <input type='text' name='phone' value='" . $row['phone'] . "'>
                    <input type='text' name='move_in_date' value='" . $row['move_in_date'] . "'>
                    <input type='text' name='rent_amount' value='" . $row['rent_amount'] . "'>
                    <input type='text' name='property_id' value='" . $row['property_id'] . "'>
                    <input type='submit' name='update' value='Update'>
                    <input type='submit' name='delete' value='Delete' onclick='return confirm(\"Are you sure?\");'>
                </form>
              </td>";
        echo "</tr>";
    }

    echo "</table>";
} else {
    echo "No tenants found";
}

// Close database connection
$conn->close();
?>
