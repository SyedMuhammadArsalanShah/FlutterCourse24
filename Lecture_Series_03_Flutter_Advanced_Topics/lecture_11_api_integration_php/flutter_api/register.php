<?php


$server="localhost";
$username="root";
$password= "";
$database= "api_php";



$conn=mysqli_connect($server,$username,$password,$database);


if (!$conn) {

die(json_encode(["message"=> "connection failed"]));

}


$name=$_POST["name"];
$email=$_POST["email"];
$pass=password_hash($_POST["password"], PASSWORD_DEFAULT);




$sql="INSERT INTO `info`( `Name`, `Email`, `Password`) VALUES ('$name','$email','$pass')";

$res=  mysqli_query($conn,$sql);


if ($res) {


echo json_encode(["message"=> $res?"registered successfully":"error"]);

}

?>