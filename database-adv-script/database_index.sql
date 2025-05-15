-- User indexes
CREATE INDEX IF NOT EXISTS idx_user_user_id ON "User"(user_id);
CREATE INDEX IF NOT EXISTS idx_user_email ON "User"(email);

-- Booking indexes
CREATE INDEX IF NOT EXISTS idx_booking_booking_id ON booking(booking_id);
CREATE INDEX IF NOT EXISTS idx_booking_user_id ON booking(user_id);
CREATE INDEX IF NOT EXISTS idx_booking_property_id ON booking(property_id);
CREATE INDEX IF NOT EXISTS idx_booking_start_date ON booking(start_date);
CREATE INDEX IF NOT EXISTS idx_booking_end_date ON booking(end_date);

-- Property indexes
CREATE INDEX IF NOT EXISTS idx_property_property_id ON property(property_id);
CREATE INDEX IF NOT EXISTS idx_property_host_id ON property(host_id);
CREATE INDEX IF NOT EXISTS idx_property_location ON property(location);
CREATE INDEX IF NOT EXISTS idx_property_pricepernight ON property(pricepernight);

