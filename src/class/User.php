<?php

namespace App;

class User
{
    /**
     * Установленное соединение с базой данных
     *
     * @var \PDO
     */
    private $pdo;

    /**
     * Конструктор класса
     *
     * @param \PDO $pdo
     * @return void
     */
    public function __construct(\PDO $pdo)
    {
        $this->pdo = $pdo;
    }

/**
* Конструктор класса
*
* @param array $user
* @return int or bool
*/

    public function getLoginedId($user)
    {
        $login = strtolower($user['login']);
        $pass = $user['password'];
        $sql = 'SELECT * FROM users WHERE login = :login';
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['login' => $login]);
        $errors = $stmt->errorInfo();
        if ($errors[1] != null) {
            throw new \Exception("Ошибка получения данных CODE: {$errors[1]} {$errors[2]}");
        }
        $result = $stmt->fetch(\PDO::FETCH_ASSOC);
        if (empty($result)) {
            return false;
        }
        return password_verify($pass, $result['password_hash']) ? $result['id'] : false;
    }
}
