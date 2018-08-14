
-- +migrate Up
INSERT INTO items(id, name, price) VALUES
(5, 'キャップ', 0);
INSERT INTO item_histories(item_id, price, created_at) VALUES
(5, 1500, '2013-10-03');

INSERT INTO customers(id, name, address) VALUES
(4, 'Z本舗', '東京都');

INSERT INTO orders(id, order_date, customer_id) VALUES
(5, '2013/10/3', 4);

INSERT INTO order_items(order_id, item_id, item_history_id, amount) VALUES
(5, 1, 0, 5),
(5, 2, 0, 4),
(5, 5, 0, 7);

UPDATE order_items
SET item_history_id = (
  SELECT MAX(item_histories.id) FROM item_histories, orders
  WHERE item_histories.created_at <= orders.order_date
  AND orders.id = order_items.order_id AND order_items.item_id = item_histories.item_id
)
WHERE item_history_id = 0;

-- +migrate Down

DELETE FROM order_items WHERE order_id = 5;
DELETE FROM orders WHERE id = 5;
DELETE FROM customers WHERE id = 4;
DELETE FROM item_histories WHERE item_id = 5;
DELETE FROM items WHERE id = 5;
