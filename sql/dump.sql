CREATE TABLE users (
    id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    login varchar(255) NOT NULL UNIQUE ,
    password_hash varchar(255) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT Now()
);
INSERT INTO users (login, password_hash) VALUES ('login', '$2y$10$735e8Y7bI5WwKQ.OPYtyg.89q6x8crAThmwUwzRJ.ePep2FBkLmYG'); //pass = 'login'