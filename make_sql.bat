rem @echo off


setlocal enabledelayedexpansion
for /f %%I in (tablelist.txt) do (

  set tablename=%%I

  REM 列名取得用SQL生成
  set getcol_sqlfile=%%I_col.sql

  echo set echo off > !getcol_sqlfile!
  echo set linesize 1000 >> !getcol_sqlfile!
  echo set head off >> !getcol_sqlfile!
  echo set newpage none >> !getcol_sqlfile!
  echo set feedback off >> !getcol_sqlfile!
  echo select LISTAGG^(column_name, ' ^|^| '','' ^|^| '^) WITHIN GROUP ^(ORDER BY column_id^) >> !getcol_sqlfile!
  echo from SYS.USER_TAB_columns where TABLE_NAME = '%%I' ; >> !getcol_sqlfile!
  echo quit >> !getcol_sqlfile!

  rem CSVファイル取得用SQL生成
  set getcsv_sqlfile=%%I.sql

  echo set echo off > !getcsv_sqlfile!
  echo set termout off >> !getcsv_sqlfile!
  echo set linesize 9000 >> !getcsv_sqlfile!
  echo set head off >> !getcsv_sqlfile!
  echo set newpage none >> !getcsv_sqlfile!
  echo set feedback off >> !getcsv_sqlfile!
  echo spool !tablename!.csv >> !getcsv_sqlfile!
  echo select >> !getcsv_sqlfile!
  sqlplus -s hr/jko20hii@ORCLPDB @!getcol_sqlfile! >> !getcsv_sqlfile!
  echo from !tablename! ;>> !getcsv_sqlfile!
  echo spool off >> !getcsv_sqlfile!
  echo.>> !getcsv_sqlfile!
  echo quit>> !getcsv_sqlfile!

  rem CSVファイル取得用SQL実行
  sqlplus -s hr/jko20hii@ORCLPDB @!getcsv_sqlfile!

)
endlocal

pause
