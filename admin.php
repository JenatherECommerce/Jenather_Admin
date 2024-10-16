<?php
include('dbconnection.php');

if (isset($_POST['signUp'])) {

    $username = trim($_POST['username']);

    $password = $_POST['password'];
    // Hash the password
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);


    $insertCredentialsQuery = 'INSERT INTO admin (admin_id, Total_income, Total_order, username, password)
                    VALUES (?, null, null, ?, ?)';


    if (!$stmt) {
        die('Prepare failed: ' . htmlspecialchars($conn->error));
    }

    $stmt->bind_param('iiiss', $admin_id, $Total_income, $Total_order, $username, $hashed_password);

    if ($stmt->execute()) {
     
        if ($stmtAddress->execute()) {
            header("Location: Profile.php");
            exit();
        } else {
            echo 'Error inserting address: ' . htmlspecialchars($stmtAddress->error);
        }

        $stmtAddress->close();
    } else {
        echo 'Error inserting customer credentials: ' . htmlspecialchars($stmt->error);
    }

    $stmt->close();
    $conn->close();
}
?>