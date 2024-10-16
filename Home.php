

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="./styling_folder/admin.css">
</head>
<body>
    <nav>
        <ul>
            <img src="https://res.cloudinary.com/diwwqfwjb/image/upload/v1725281506/Jenather-Ecommerce/nwqfas3que4whtkngexj.png" alt="logo">
            <li><a href="Home.php">Home</a></li>
            <li><a href="Profile.php">Profile</a></li>
            <li><a href="Customers.php">Customer</a></li>
            <li><a href="Inventory.php">Inventory</a></li>
            <li><a href="">Logout</a></li>
        </ul>
    </nav>

    <div class="container">
        <div class="content_1" id="users">
            <h1>Total Users</h1>
            <?php include('count_users.php'); ?> 
            
        </div>
        <div class="content_1"><h1>Income</h1></div>
        <div class="content_1"><h1>Orders</h1></div>
    </div>

    <div class="list_account">
    <?php include('index_1.php'); ?> 
        
    </div>
</body>
</html>
