<?php

require_once __DIR__ . '/vendor/autoload.php';

use App\DbConnection;
use App\User;

$userData = $_REQUEST['user'];
$pdo = DbConnection::make();
$user = new User($pdo);
$id = $user->getLoginedId($userData);
if ($id) {
    session_start();
    $_SESSION['authorized'][] = ['id' => $id];
    echo json_encode(['status' => 'success']);
} else {
    echo json_encode(['status' => 'error']);
}


