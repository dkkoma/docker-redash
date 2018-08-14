
-- +migrate Up
ALTER TABLE items DROP COLUMN price;

-- +migrate Down
ALTER TABLE items ADD COLUMN price INT NOT NULL;
