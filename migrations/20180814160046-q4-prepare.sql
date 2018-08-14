
-- +migrate Up
CREATE TABLE item_histories (
  id INT NOT NULL AUTO_INCREMENT,
  item_id INT NOT NULL,
  price INT NOT NULL,
  created_at DATETIME NOT NULL,
  PRIMARY KEY(id)
);

ALTER TABLE order_items ADD COLUMN item_history_id INT NOT NULL AFTER item_id;

INSERT INTO item_histories(item_id, price, created_at) VALUES
(1, 1000, '2013-10-01'),
(2, 950, '2013-10-01'),
(3, 1200, '2013-10-01'),
(4, 1800, '2013-10-01'),
(1, 5000, '2013-10-03');

-- +migrate Down

ALTER TABLE order_items DROP COLUMN item_history_id;
DELETE FROM item_histories;
DROP TABLE item_histories;
