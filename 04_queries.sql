USE restaurant_reviews;

-- 1. Restoran dengan rating rata-rata tertinggi
SELECT r.name, ROUND(AVG(rev.rating),2) AS avg_rating
FROM restaurant r
JOIN review rev ON r.id = rev.restaurant_id
GROUP BY r.id, r.name
ORDER BY avg_rating DESC
LIMIT 1;

-- 2. Jumlah review per restoran
SELECT r.name, COUNT(rev.id) AS total_reviews
FROM restaurant r
LEFT JOIN review rev ON r.id = rev.restaurant_id
GROUP BY r.id, r.name;

-- 3. Review paling baru untuk tiap restoran
SELECT r.name, rev.review_text, rev.review_date, rev.user_name
FROM restaurant r
JOIN review rev ON r.id = rev.restaurant_id
WHERE rev.review_date = (
    SELECT MAX(review_date) FROM review WHERE restaurant_id = r.id
);

-- buat tabel menu
CREATE TABLE menu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT NOT NULL,
    item_name VARCHAR(100),
    price DECIMAL(10,2),
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(id) ON DELETE CASCADE
);

-- 3 menu per restoran (id 2,3,4 masih ada setelah delete id 1)
INSERT INTO menu (restaurant_id, item_name, price) VALUES
(2, 'Salmon Mentai', 85000), (2, 'Sushi Platter', 150000), (2, 'Miso Soup', 25000),
(3, 'Bakmi Spesial', 45000), (3, 'Pangsit Goreng', 30000), (3, 'Es Teh Manis', 12000),
(4, 'Kopi Kenangan Mantan', 28000), (4, 'Avocado Coffee', 35000), (4, 'Roti Sobek', 22000);

-- query restoran + menu + rata-rata rating
SELECT r.name AS restaurant, m.item_name, m.price,
       ROUND(AVG(rev.rating),2) AS avg_rating
FROM restaurant r
LEFT JOIN menu m ON r.id = m.restaurant_id
LEFT JOIN review rev ON r.id = rev.restaurant_id
GROUP BY r.id, r.name, m.id, m.item_name, m.price
ORDER BY r.name, m.item_name;