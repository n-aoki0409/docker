create database retail;
use retail;

create table emailid(custno int, email string) row format delimited fields terminated by ',' stored as textfile;
create table txnrecords(txnno string, txndate string, custno int, amount double, product string, city string, state string, spendby string) partitioned by (category string) clustered by (state) INTO 10 BUCKETS row format delimited fields terminated by ',' stored as textfile;

load data inpath '/user/hive/email1.txt' into table emailid;
load data inpath '/user/hive/txns1.txt' into table txnrecords;

select * from emailid;
select * from txnrecords;

-- insert into txnrecords partition(category='Road Sports') values('00000010','06-17-2011',4004799,252.46,'Skate Board','St. Petersburg','Florida', 'credit');