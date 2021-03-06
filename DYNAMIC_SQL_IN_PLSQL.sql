CREATE OR REPLACE PROCEDURE CREATE_TBL_PROC(
    TBL_NAME IN VARCHAR2,
    TBL_CLM IN VARCHAR2
)
IS
    V_TBL_NAME VARCHAR2(50);
BEGIN
    V_TBL_NAME:='CREATE TABLE ' || TBL_NAME || '(' || TBL_CLM || ')' ;
    DBMS_OUTPUT.PUT_LINE(V_TBL_NAME);
    EXECUTE IMMEDIATE V_TBL_NAME ;
END;

BEGIN
    CREATE_TBL_PROC(TBL_NAME=>'OLD_EMP',TBL_CLM=>'ID NUMBER');
END;

SELECT * FROM OLD_EMP;

DESCRIBE OLD_EMP;