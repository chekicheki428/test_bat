set tablename=%1
set col_arg=%2
set getcsv_sqlfile=%tablename%.sql
set conn=

echo spool %tablename%.csv       >%getcsv_sqlfile%
echo select                     >>%getcsv_sqlfile%
call getcolumns.bat             >>%getcsv_sqlfile%
from %tablename%                >>%getcsv_sqlfile%
echo where col_1 = '%col_arg%' ;>>%getcsv_sqlfile%
echo quit                       >>%getcsv_sqlfile%

sqlplus -s %conn% @%getcsv_sqlfile%
