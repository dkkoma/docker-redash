
-- +migrate Up
INSERT INTO customers(id, name, address) VALUES
(1, 'A商事', '東京都'),
(2, 'B商会', '埼玉県'),
(3, 'C商店', '神奈川県');

INSERT INTO items(id, name, price) VALUES
(1, 'シャツ', 1000),
(2, 'パンツ', 950),
(3, 'マフラー', 1200),
(4, 'ブルゾン', 1800);

INSERT INTO orders(id, order_date, customer_id) VALUES
(1, '2013/10/1', 1);
INSERT INTO order_items(order_id, item_id, amount) VALUES
(1, 1, 3),
(1, 2, 2);

INSERT INTO orders(id, order_date, customer_id) VALUES
(2, '2013/10/1', 2);
INSERT INTO order_items(order_id, item_id, amount) VALUES
(2, 1, 1),
(2, 3, 10),
(2, 4, 5);


INSERT INTO orders(id, order_date, customer_id) VALUES
(3, '2013/10/2', 2);
INSERT INTO order_items(order_id, item_id, amount) VALUES
(3, 2, 80);

INSERT INTO orders(id, order_date, customer_id) VALUES
(4, '2013/10/2', 3);
INSERT INTO order_items(order_id, item_id, amount) VALUES
(4, 3, 25);

-- +migrate Down
DELETE FROM order_items;
DELETE FROM orders;
DELETE FROM items;
DELETE FROM customers;
