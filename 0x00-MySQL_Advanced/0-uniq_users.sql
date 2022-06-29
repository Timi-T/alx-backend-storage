-- Sql script to create a table

-- Create a table of users
CREATE TABLE IF NOT EXISTS users(
    id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    email varchar(255) NOT NULL UNIQUE,
    name varchar(255)
);
