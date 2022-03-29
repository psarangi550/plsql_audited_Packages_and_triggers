CREATE OR REPLACE TRIGGER EMP_OBJ_TRIGGER 
AFTER INSERT OR UPDATE ON EMP 
DECLARE
    TYPE MY_NEST IS TABLE OF VARCHAR2(50);
    V_VAR MY_NEST;--DEFINING THE VARIABLE OF NESTED COLLECTION TYPE 
    COUNT_VAL NUMBER:=0;
BEGIN
    SELECT ENAME BULK COLLECT INTO  V_VAR 
    FROM EMP ;
    FOR I IN V_VAR.FIRST .. V_VAR.LAST 
    LOOP
        DBMS_OUTPUT.PUT_LINE(V_VAR(I));
        COUNT_VAL:=COUNT_VAL+1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(COUNT_VAL);
END ;

INSERT INTO EMP (EMPNO,ENAME,SAL,DEPTNO) VALUES(7659,'ABHIPSA',5000,10);

SELECT COUNT(*) FROM EMP;