CREATE OR REPLACE PROCEDURE  MY_CUR_EMP_PROC
(
    DEPT_NO EMP.DEPTNO%TYPE DEFAULT NULL  
)
IS
    EMP_NO EMP.EMPNO%TYPE;
    EMP_NAME EMP.ENAME%TYPE;
    MY_CUR SYS_REFCURSOR ;
    V_SCRIPT VARCHAR2(3000):='SELECT EMPNO,ENAME FROM EMP ';
BEGIN
    IF DEPT_NO IS NULL THEN
        OPEN MY_CUR FOR V_SCRIPT ;
    ELSE
        V_SCRIPT:=V_SCRIPT || 'WHERE DEPTNO=:DEPTNO';
        OPEN MY_CUR FOR V_SCRIPT USING DEPT_NO ;
    END IF;

    LOOP
        FETCH MY_CUR INTO EMP_NO,EMP_NAME;
        EXIT WHEN MY_CUR%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(EMP_NO || '--->'||EMP_NAME );
    END LOOP ;

    CLOSE MY_CUR;

END;



BEGIN
    MY_CUR_EMP_PROC();
END;

BEGIN
    MY_CUR_EMP_PROC(30);
END;
    
    