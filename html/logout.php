<?php
session_start();
if(session_destroy()) // Destroying All Sessions {
header("Location: loginpage.php"); // Redirecting To Home Page

?>