USE ec_sales;

INSERT INTO ec_sales(id, sales_time, sales_id, item_id, amount, unit_price) VALUES(1, '2018-10-05 11:11:11', 'EC_SALES_00001', 'ITEM_001', 2, 300);
INSERT INTO ec_sales(id, sales_time, sales_id, item_id, amount, unit_price) VALUES(2, '2018-10-01 11:11:11', 'EC_SALES_00001', 'ITEM_002', 1, 5800);
INSERT INTO ec_sales(id, sales_time, sales_id, item_id, amount, unit_price) VALUES(3, '2018-10-02 12:12:12', 'EC_SALES_00002', 'ITEM_001', 4, 298);
INSERT INTO ec_sales(id, sales_time, sales_id, item_id, amount, unit_price) VALUES(4, '2018-10-02 12:12:12', 'EC_SALES_00002', 'ITEM_003', 1, 2500);
INSERT INTO ec_sales(id, sales_time, sales_id, item_id, amount, unit_price) VALUES(5, '2018-10-02 12:12:12', 'EC_SALES_00002', 'ITEM_004', 1, 198);
INSERT INTO ec_sales(id, sales_time, sales_id, item_id, amount, unit_price) VALUES(6, '2018-10-02 12:12:12', 'EC_SALES_00002', 'ITEM_005', 1, 273);

USE pos_sales;

INSERT INTO pos_sales(id, sales_time, sales_id, shop_id, item_id, amount, unit_price) VALUES(1, '2018-10-11 21:21:21', 'POS_SALES_00001', 'SHOP_001', 'ITEM_001', 2, 300);
INSERT INTO pos_sales(id, sales_time, sales_id, shop_id, item_id, amount, unit_price) VALUES(2, '2018-10-11 21:21:21', 'POS_SALES_00001', 'SHOP_001', 'ITEM_004', 5, 198);
INSERT INTO pos_sales(id, sales_time, sales_id, shop_id, item_id, amount, unit_price) VALUES(3, '2018-10-11 21:21:21', 'POS_SALES_00001', 'SHOP_001', 'ITEM_005', 1, 273);
INSERT INTO pos_sales(id, sales_time, sales_id, shop_id, item_id, amount, unit_price) VALUES(4, '2018-10-12 22:22:22', 'POS_SALES_00002', 'SHOP_002', 'ITEM_001', 1, 300);
INSERT INTO pos_sales(id, sales_time, sales_id, shop_id, item_id, amount, unit_price) VALUES(5, '2018-10-12 22:22:22', 'POS_SALES_00002', 'SHOP_002', 'ITEM_006', 1, 512);
INSERT INTO pos_sales(id, sales_time, sales_id, shop_id, item_id, amount, unit_price) VALUES(6, '2018-10-12 23:23:23', 'POS_SALES_00003', 'SHOP_053', 'ITEM_006', 2, 512);