USE restaurant_reviews;

-- 3 restoran
INSERT INTO restaurant (name, street_address, description) VALUES
('Warung Padang Sederhana', 'Jl. Sudirman No.45, Jakarta', 'Masakan Padang autentik dengan rendang legendaris'),
('Sushi Tei Plaza Senayan', 'Jl. Asia Afrika No.8, Jakarta', 'Sushi dan sashimi fresh'),
('Bakmi GM Thamrin', 'Jl. M.H. Thamrin No.1, Jakarta', 'Bakmi ayam klasik sejak 1959');

-- 5 review
INSERT INTO review (restaurant_id, user_name, rating, review_text, review_date) VALUES
(1, 'Hisyam', 5, 'Rendangnya juara, pedas pas', '2026-06-10'),
(1, 'Alya', 4, 'Pelayanan cepat, sambal ijo mantap', '2026-06-12'),
(2, 'Rafi', 3, 'Sushi oke tapi mahal', '2026-06-11'),
(2, 'Dina', 5, 'Salmon mentai terbaik di Jakarta', '2026-06-15'),
(3, 'Budi', 4, 'Bakmi pangsit favorit dari kecil', '2026-06-14');