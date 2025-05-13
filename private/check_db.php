<?php
// $servername = "localhost";
// $username = "root";
// $password = "";
// $dbname = "library2";

// $conn = new mysqli($servername, $username, $password, $dbname);

$host = "sql107.infinityfree.com"; // Check if this is correct
$username = "if0_38938772";
$password = "u1mDknqqzHqxcA";
$database = "if0_38938772_library2";

$conn = new mysqli($host, $username, $password, $database);

if ($conn->connect_error) {
    echo "ERROR";
} else {
    echo "OK";
}






?>
