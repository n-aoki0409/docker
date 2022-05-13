A = LOAD '/user/root/input/information.txt' using PigStorage(' ') as (FName: chararray, LName: chararray, MobileNo: chararray, City: chararray, Profession: chararray);
B = FOREACH A generate FName, MobileNo, Profession;
DUMP B;