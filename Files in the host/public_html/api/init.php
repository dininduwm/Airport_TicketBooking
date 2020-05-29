<?php

$host = "localhost";
$user_name = "id13877990_admin_dbms";
$user_password = "(Nj|E!2tTEM4Tml1";
$db_name = "id13877990_ticketbooking";

$con = mysqli_connect($host, $user_name, $user_password, $db_name);

if ($con) {
	echo "Connection Success...";
} else {
	echo "Connection Faild...";
}


?>