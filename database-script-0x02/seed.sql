-- Insert Users
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('11111111-1111-1111-1111-111111111111', 'Brian', 'Mutiso', 'brian.mutiso@gmail.com', 'hashed_brian_pw', '0712345678', 'host'),
('22222222-2222-2222-2222-222222222222', 'Esther', 'Wangari', 'esther.wangari@yahoo.com', 'hashed_esther_pw', '0723456789', 'guest'),
('33333333-3333-3333-3333-333333333333', 'Samuel', 'Omondi', 'samuel.omondi@admin.co.ke', 'hashed_samuel_pw', '0734567890', 'admin');

-- Insert Properties
INSERT INTO property (property_id, host_id, name, description, location, pricepernight)
VALUES
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', 'Westlands Apartment', 'Modern 2-bedroom apartment near Sarit Centre.', 'Westlands, Nairobi', 8500.00),
('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '11111111-1111-1111-1111-111111111111', 'Diani Beach Bungalow', 'Beachfront 3-bedroom bungalow with private pool.', 'Diani, Mombasa', 15000.00);

-- Insert Bookings
INSERT INTO booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', '2025-08-10', '2025-08-13', 25500.00, 'confirmed'),
('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '22222222-2222-2222-2222-222222222222', '2025-12-20', '2025-12-27', 105000.00, 'pending');

-- Insert Payments
INSERT INTO payment (payment_id, booking_id, amount, payment_method)
VALUES
('ccccccc1-cccc-cccc-cccc-ccccccccccc1', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 25500.00, 'mpesa'),
('ccccccc2-cccc-cccc-cccc-ccccccccccc2', 'bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 105000.00, 'credit_card');

-- Insert Reviews
INSERT INTO review (review_id, property_id, user_id, rating, comment)
VALUES
('ddddddd1-dddd-dddd-dddd-ddddddddddd1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', 4, 'Excellent apartment and convenient location. Minor plumbing issue.'),
('ddddddd2-dddd-dddd-dddd-ddddddddddd2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '22222222-2222-2222-2222-222222222222', 5, 'Spectacular beach house! Worth every shilling.');

-- Insert Messages
INSERT INTO message (message_id, sender_id, recipient_id, message_body)
VALUES
('eeeeeee1-eeee-eeee-eeee-eeeeeeeeeee1', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi Brian, is your Diani property available for Christmas week?'),
('eeeeeee2-eeee-eeee-eeee-eeeeeeeeeee2', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Esther, yes it is available from December 20 to 27.');

