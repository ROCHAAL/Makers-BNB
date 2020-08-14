ALTER TABLE listings ADD COLUMN user_id INTEGER REFERENCES users(id);
ALTER TABLE listings ADD FOREIGN KEY (user_id) REFERENCES users(id);
