BEGIN
        EXECUTE IMMEDIATE 'CREATE TABLE OLD_EMP(DATA NUMBER )';
END;

CREATE OR REPLACE PROCEDURE INSERT_OLD_EMP_PROC
(
    P_TABLE IN VARCHAR2,
    P_COLUMN IN NUMBER
)
IS
    V_VAR VARCHAR2(50);
BEGIN
    -- V_VAR:='INSERT INTO ' || P_TABLE || ' VALUES' || '('|| P_COLUMN ||')';
    V_VAR:='INSERT INTO ' || P_TABLE ||' VALUES(:1) ' ;
    -- DBMS_OUTPUT.PUT_LINE(V_VAR);
    EXECUTE IMMEDIATE V_VAR USING P_COLUMN;
END ;


/* ALTERNATE APPROACHES */
SET SERVEROUTPUT ON
SET DEFINE ON
CREATE OR REPLACE PROCEDURE INSERT_OLD_EMP_PROC
(
    P_TABLE IN VARCHAR2,
    P_COLUMN IN NUMBER
)
IS
    V_VAR VARCHAR2(255);
BEGIN
    -- V_VAR:='INSERT INTO ' || P_TABLE || ' VALUES' || '('|| P_COLUMN ||')';
    V_VAR:='INSERT INTO ' || P_TABLE ||' VALUES(:1)' ;
    -- DBMS_OUTPUT.PUT_LINE(V_VAR);
    EXECUTE IMMEDIATE V_VAR USING P_COLUMN ;
END ;


EXECUTE INSERT_OLD_EMP_PROC(P_TABLE=>'OLD_EMP', P_COLUMN=>20);


SELECT *  FROM OLD_EMP;

SELECT ROWNUM FROM OLD_EMP;

SELECT * FROM OLD_EMP;

UPDATE OLD_EMP SET ID=20 WHERE ROWNUM=1;
/*EXECUTE IMMEDIATE WITH INTO CLAUSE ONLY */
DECLARE
    V_VAR NUMBER;
BEGIN
    EXECUTE IMMEDIATE 'SELECT ID FROM OLD_EMP WHERE ID=10'
    INTO V_VAR ;
    DBMS_OUTPUT.PUT_LINE(V_VAR);
END;
/*USING AND INTO CLAUSE WITH EXECUTE IMMEDIATE */
DECLARE
    V_VAR NUMBER:=20;
    V_EMPID NUMBER;
BEGIN
    EXECUTE IMMEDIATE 'SELECT ID FROM OLD_EMP WHERE ID=:X'
    INTO V_EMPID USING V_VAR ;
    DBMS_OUTPUT.PUT_LINE(V_EMPID);
END;

SELECT con_id  FROM v$database ;
show parameter db_name;

SELECT * FROM v$pdbs;


