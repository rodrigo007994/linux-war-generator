cd ./ext

echo "CONNECT 'jdbc:derby:memory:firstdb;create=true'; CREATE TABLE FIRSTTABLE (ID INT PRIMARY KEY, NAME VARCHAR(12)); INSERT INTO FIRSTTABLE VALUES (10,'TEN'),(20,'TWENTY'),(30,'THIRTY');SELECT * FROM FIRSTTABLE;" > test.dsql
java -jar derbyrun.jar ij test.dsql
