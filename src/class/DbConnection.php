<?php

namespace App;

class DbConnection
{
    /**
     * Соединение с базой данных
     *
     * @param string $host
     * @param int $port
     * @param string $dbname
     * @param string $username
     * @param string $passwd
     * @return \PDO
     */
    public static function make(
        $host = '127.0.0.1',
        $port = 5432,
        $dbname = 'test',
        $username = 'test',
        $passwd = '123'
    ): \PDO {
            $dsn = "pgsql:host=$host;port=$port;dbname=$dbname";
            return new \PDO($dsn, $username, $passwd);
    }
}
