-- Create a table with enumerated countries

-- Create a table of users
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    email varchar(255) NOT NULL UNIQUE,
    name varchar(255),
    country ENUM("US", "CO", "TN") default(1)
);
