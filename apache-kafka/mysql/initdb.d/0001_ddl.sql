CREATE DATABASE IF NOT EXISTS ec_sales;
USE ec_sales;

CREATE TABLE IF NOT EXISTS ec_sales (
  id int NOT NULL PRIMARY KEY,
  sales_time timestamp,
  sales_id varchar(80),
  item_id varchar(80),
  amount int,
  unit_price int
);
CREATE USER ec_user IDENTIFIED BY 'ec_pass';
GRANT ALL ON ec_sales.* TO ec_user;


CREATE DATABASE IF NOT EXISTS pos_sales;
USE pos_sales;

CREATE TABLE IF NOT EXISTS pos_sales (
  id int NOT NULL PRIMARY KEY,
  sales_time timestamp,
  sales_id varchar(80),
  shop_id varchar(80),
  item_id varchar(80),
  amount int,
  unit_price int
);
CREATE USER pos_user IDENTIFIED BY 'pos_pass';
GRANT ALL ON pos_sales.* TO pos_user;