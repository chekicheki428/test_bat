rem @echo off


setlocal enabledelayedexpansion
for /f %%I in (tablelist.txt) do (

  set tablename=%%I
  set getcsv_sqlfile=%%I.sql
  echo !getcsv_sqlfile!

  rem sqlファイル作成
  echo select * from !tablename! where cd = %1 ;> !getcsv_sqlfile!
  echo.>> !getcsv_sqlfile!
  echo quit>> !getcsv_sqlfile!

  rem CSVファイル出力SQL実行
  call getcsv.bat !tablename!

)
endlocal

pause
