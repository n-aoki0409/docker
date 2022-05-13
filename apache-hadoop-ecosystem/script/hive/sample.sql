create table emailid(custno int, email string) row format delimited fields terminated by ',' stored as textfile;
create table txnrecords(txnno int, txndate string, custno int, amount double, category string, product string, city string, state string, spendby string) row format delimited fields terminated by ',' stored as textfile;

load data local inpath '/hive/script/email1.txt' into table emailid;
load data local inpath '/hive/script/txns1.txt' into table txnrecords;

select * from emailid;
select * from txnrecords;