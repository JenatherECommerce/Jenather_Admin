<?php
include('dbconnection.php');

if (isset($_POST['add_product'])) {

    $product_img = trim($_POST['product_img']);
    $product_quantity = trim($_POST['product_quantity']);
    $product_brand = trim($_POST['product_brand']);
    $body_config = trim($_POST['body_config']);
    $product_name = trim($_POST['product_name']);
    $product_price = trim($_POST['product_price']);
    $product_info = trim($_POST['product_info']);

    $insertQuery = 'INSERT INTO products (product_img, product_quantity, product_brand, body_config, product_name, product_price, product_info)
                    VALUES (?, ?, ?, ?, ?, ?, ?)';

    $stmt = $conn->prepare($insertQuery);
    if (!$stmt) {
        die('Prepare failed: ' . htmlspecialchars($conn->error));
    }

    $stmt->bind_param('sisssds', $product_img, $product_quantity, $product_brand, $body_config, $product_name, $product_price, $product_info);

    if ($stmt->execute()) {
        header("Location: Inventory.php");
        exit();
    } else {
        echo 'Error: ' . htmlspecialchars($stmt->error);
    }

    $stmt->close();
    $conn->close();
}
?>
