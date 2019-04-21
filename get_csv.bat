set tablename=%1

echo sqlplus userid/pass %tablename%.sql

type nul > %tablename%.csv
