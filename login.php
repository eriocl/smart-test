<?php

require_once __DIR__ . '/vendor/autoload.php';

use App\DbConnection;
use App\User;

$userData = json_decode(file_get_contents('php://input'), true);
$pdo = DbConnection::make();
$user = new User($pdo);
$id = $user->getLoginedId($userData);
if ($id) {
    session_start();
    $_SESSION['authorized'] = $id;
    echo json_encode(['status' => 'success']);
} else {
    echo json_encode(['status' => 'error']);
}
