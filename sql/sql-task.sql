CREATE TABLE alpinists (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar(255) NOT NULL UNIQUE,
    address varchar (255) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT Now()
);

CREATE TABLE groups (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar(255) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT Now()
);

CREATE TABLE mountains (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar(255) NOT NULL UNIQUE,
    height int NOT NULL,
    location varchar (255) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT Now()
 );

CREATE TABLE ascents (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    mountain_id bigint REFERENCES mountains (id) NOT NULL,
    group_id bigint REFERENCES groups (id) NOT NULL,
    started_at   TIMESTAMPTZ DEFAULT Now(),
    ended_at TIMESTAMPTZ DEFAULT NULL
);

CREATE TABLE group_members (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    alpinist_id bigint REFERENCES alpinists (id) NOT NULL,
    group_id bigint REFERENCES groups (id) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT Now()
);

1) SELECT group_id FROM ascents WHERE mountain_id = 2;
2) INSERT INTO mountains (name, height, location) VALUES ('elbrus', '4000', 'Russia');
3) UPDATE mountains SET height = '4500'   WHERE name = 'everest';
4)SELECT DISTINCT alpinists.name FROM
    (SELECT ascents.group_id, group_members.alpinist_id, started_at, ended_at
        FROM ascents
        JOIN group_members
        ON ascents.group_id = group_members.group_id
        WHERE started_at >= '2021-01-07 18:30:53.873257+03' AND ended_at <= '2021-03-07 18:30:53.886148+03') t1
        JOIN alpinists
        ON t1.alpinist_id = alpinists.id;
5)INSERT INTO group_members (alpinist_id, group_id) VALUES (2, 2);
6)SELECT  alpinists.name, mountain_name, COUNT(*)
    FROM (SELECT alpinist_id, mountains.name AS mountain_name
        FROM (select alpinist_id, mountain_id
             from ascents
             JOIN group_members
             ON group_members.group_id = ascents.group_id) t1
        JOIN mountains
        ON mountains.id = t1.mountain_id) t2
    JOIN alpinists
    ON alpinists.id = t2.alpinist_id
    GROUP BY alpinists.name, mountain_name;
7)SELECT * FROM ascents WHERE started_at >= '2021-01-07 18:30:53.873257+03' AND ended_at <= '2021-03-07 18:30:53.886148+03';
8)INSERT INTO groups (name) VALUES ('newGroup');
  INSERT INTO ascents (mountain_id, group_id, started_at) VALUES (3, 2, '2021-03-07 18:30:53.886148+03' );
9)SELECT mountain_name, COUNT(*)
  FROM (SELECT mountains.name AS mountain_name, group_id
        FROM ascents
                 JOIN mountains
                      ON ascents.mountain_id = mountains.id) t1
           JOIN group_members
                ON t1.group_id = group_members.group_id
  GROUP BY mountain_name;


