<?php
header('Content-Type: text/xml; charset=UTF-8');
header('Access-Control-Allow-Origin: http://localhost:8080');

function send_response($status, $message) {
    echo '<?xml version="1.0" encoding="UTF-8"?>';
    echo '<registrationValidation><status>' . htmlspecialchars($status, ENT_XML1, 'UTF-8') . '</status>';
    echo '<message>' . htmlspecialchars($message, ENT_XML1, 'UTF-8') . '</message></registrationValidation>';
    exit;
}

$name = trim($_POST['userName'] ?? '');
$email = trim($_POST['userEmail'] ?? '');
$password = $_POST['password'] ?? '';
$confirmPassword = $_POST['confirmPassword'] ?? '';
$terms = $_POST['terms'] ?? '';

if ($name === '' || strlen($name) > 80) send_response('invalid', 'Name is required and must be at most 80 characters.');
if (!filter_var($email, FILTER_VALIDATE_EMAIL) || strlen($email) > 120) send_response('invalid', 'Enter a valid email address.');
if (strlen($password) < 8) send_response('invalid', 'Password must contain at least 8 characters.');
if ($password !== $confirmPassword) send_response('invalid', 'Passwords do not match.');
if ($terms !== 'yes') send_response('invalid', 'Accept the terms to continue.');

send_response('valid', 'Registration accepted.');
?>
