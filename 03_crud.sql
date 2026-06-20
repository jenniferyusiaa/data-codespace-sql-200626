USE restaurant_reviews;

-- 1. CREATE
-- tambah restoran baru
INSERT INTO restaurant (name, street_address, description)
VALUES ('Kopi Kenangan HQ', 'Jl. Senopati No.22, Jakarta', 'Kopi susu kekinian');

-- tambah review untuk restoran id 3
INSERT INTO review (restaurant_id, user_name, rating, review_text, review_date)
VALUES (3, 'Hisyam', 5, 'Es teh manisnya juga enak', '2026-06-19');

-- 2. READ
-- semua review untuk restaurant_id = 1
SELECT * FROM review WHERE restaurant_id = 1;

-- semua review rating >=4
SELECT * FROM review WHERE rating >= 4;

-- JOIN restoran dengan reviewnya
SELECT r.id, r.name, rev.user_name, rev.rating, rev.review_text, rev.review_date
FROM restaurant r
JOIN review rev ON r.id = rev.restaurant_id
ORDER BY r.id;

-- 3. UPDATE
-- ubah deskripsi restoran id 2
UPDATE restaurant 
SET description = 'Sushi premium dengan pilihan omakase'
WHERE id = 2;

-- ubah rating review id 3 dari 3 menjadi 4
UPDATE review SET rating = 4 WHERE id = 3;

-- 4. DELETE
-- hapus review id 2
DELETE FROM review WHERE id = 2;

-- hapus restoran id 1, reviewnya ikut terhapus karena CASCADE
DELETE FROM restaurant WHERE id = 1;
