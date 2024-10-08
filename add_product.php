<?php
include('dbconnection.php');

if (isset($_POST['add_product'])) {

    $product_img = trim($_POST['product_img']);
    $product_quantity = trim($_POST['product_quantity']);
    $product_brand = trim($_POST['product_brand']);
    $body_config = trim($_POST['body_config']);
    $product_name = trim($_POST['product_name']);
    
    $product_price = trim($_POST['product_price']);
    $product_price = str_replace(',', '', $product_price); 

    $engine_performances = trim($_POST['engine_performances']);
    $dimensions = trim($_POST['dimensions']);
    $interior_comfort = trim($_POST['interior_comfort']);
    $safety = trim($_POST['safety']);
    $wheel = trim($_POST['wheel']);
    $features = trim($_POST['features']);


    $checkQuery = 'SELECT product_id, product_quantity FROM products WHERE product_name = ? AND product_brand = ? AND body_config = ?';
    
    $stmtCheck = $conn->prepare($checkQuery);
    if (!$stmtCheck) {
        die('Prepare failed (stmtCheck): ' . htmlspecialchars($conn->error));
    }

    $stmtCheck->bind_param('sss', $product_name, $product_brand, $body_config);
    $stmtCheck->execute();
    $stmtCheck->store_result();

    if ($stmtCheck->num_rows > 0) {
        $stmtCheck->bind_result($product_id, $existing_quantity);
        $stmtCheck->fetch();

        $new_quantity = $existing_quantity + $product_quantity;
        $updateProductQuery = 'UPDATE products SET product_quantity = ?, product_price = ? WHERE product_id = ?';
        
        $stmtUpdateProduct = $conn->prepare($updateProductQuery);
        if (!$stmtUpdateProduct) {
            die('Prepare failed (stmtUpdateProduct): ' . htmlspecialchars($conn->error));
        }
        $stmtUpdateProduct->bind_param('idi', $new_quantity, $product_price, $product_id);

        if (!$stmtUpdateProduct->execute()) {
            echo 'Error updating product: ' . htmlspecialchars($stmtUpdateProduct->error);
            $stmtUpdateProduct->close();
            $conn->close();
            exit();
        }

        $checkDescriptionQuery = 'SELECT product_id FROM products_description WHERE product_id = ?';
        $stmtCheckDescription = $conn->prepare($checkDescriptionQuery);
        if (!$stmtCheckDescription) {
            die('Prepare failed (stmtCheckDescription): ' . htmlspecialchars($conn->error));
        }

        $stmtCheckDescription->bind_param('i', $product_id);
        $stmtCheckDescription->execute();
        $stmtCheckDescription->store_result();

        if ($stmtCheckDescription->num_rows > 0) {
         
            $updateDescriptionQuery = 'UPDATE products_description SET engine_performances = ?, dimensions = ?, interior_comfort = ?, safety = ?, wheel = ?, features = ? WHERE product_id = ?';

            $stmtUpdateDescription = $conn->prepare($updateDescriptionQuery);
            if (!$stmtUpdateDescription) {
                die('Prepare failed (stmtUpdateDescription): ' . htmlspecialchars($conn->error));
            }
            $stmtUpdateDescription->bind_param('ssssssi', $engine_performaces, $dimensions, $interior_comfort, $safety, $wheel, $features, $product_id);

            if (!$stmtUpdateDescription->execute()) {
                echo 'Error updating product descriptions: ' . htmlspecialchars($stmtUpdateDescription->error);
            }

            $stmtUpdateDescription->close();
        } else {
        
            $insertDescriptionQuery = 'INSERT INTO products_description (product_id, engine_performances, dimensions, interior_comfort, safety, wheel, features)
                            VALUES (?, ?, ?, ?, ?, ?, ?)';

            $stmtInsertDescription = $conn->prepare($insertDescriptionQuery);
            if (!$stmtInsertDescription) {
                die('Prepare failed (stmtInsertDescription): ' . htmlspecialchars($conn->error));
            }

            $stmtInsertDescription->bind_param('issssss', $product_id, $engine_performances, $dimensions, $interior_comfort, $safety, $wheel, $features);

            if (!$stmtInsertDescription->execute()) {
                echo 'Error inserting into products_descriptions: ' . htmlspecialchars($stmtInsertDescription->error);
            }

            $stmtInsertDescription->close();
        }

        $stmtUpdateProduct->close();
        $stmtCheckDescription->close();

    } else {
   
        $insertProductQuery = 'INSERT INTO products (product_img, product_quantity, product_brand, body_config, product_name, product_price)
                        VALUES (?, ?, ?, ?, ?, ?)';

        $stmtInsertProduct = $conn->prepare($insertProductQuery);
        if (!$stmtInsertProduct) {
            die('Prepare failed (stmtInsertProduct): ' . htmlspecialchars($conn->error));
        }

        $stmtInsertProduct->bind_param('sisssd', $product_img, $product_quantity, $product_brand, $body_config, $product_name, $product_price);

        if (!$stmtInsertProduct->execute()) {
            echo 'Error inserting into products: ' . htmlspecialchars($stmtInsertProduct->error);
            $stmtInsertProduct->close();
            $conn->close();
            exit();
        }

        $lastProductId = $conn->insert_id;


        $insertDescriptionQuery = 'INSERT INTO products_description (product_id, engine_performances, dimensions, interior_comfort, safety, wheel, features)
                        VALUES (?, ?, ?, ?, ?, ?, ?)';

        $stmtInsertDescription = $conn->prepare($insertDescriptionQuery);
        if (!$stmtInsertDescription) {
            die('Prepare failed (stmtInsertDescription): ' . htmlspecialchars($conn->error));
        }

        $stmtInsertDescription->bind_param('issssss', $lastProductId, $engine_performances, $dimensions, $interior_comfort, $safety, $wheel, $features);

        if (!$stmtInsertDescription->execute()) {
            echo 'Error inserting into products_descriptions: ' . htmlspecialchars($stmtInsertDescription->error);
        }

        $stmtInsertProduct->close();
        $stmtInsertDescription->close();
    }

    $stmtCheck->close();
    $conn->close();

    header("Location: Inventory.php");
    exit();
}
?>
