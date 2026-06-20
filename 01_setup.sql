DROP DATABASE IF EXISTS restaurant_reviews;
CREATE DATABASE restaurant_reviews;
USE restaurant_reviews;

CREATE TABLE restaurant (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    street_address VARCHAR(255),
    description TEXT
);

CREATE TABLE review (
    id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT NOT NULL,
    user_name VARCHAR(50),
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date DATE,
    FOREIGN KEY (restaurant_id) 
        REFERENCES restaurant(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);