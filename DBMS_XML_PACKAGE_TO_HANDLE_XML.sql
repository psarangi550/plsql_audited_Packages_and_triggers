SELECT DBMS_XMLGEN.GETXML(
'SELECT DEPTNO FROM DEPT WHERE DEPTNO=10 ') 
FROM DUAL;

SELECT DBMS_XMLGEN.GETXML(
'SELECT * FROM DEPT ') 
FROM DUAL;

/* USING THE PLSQL PROCEDURE FOR THE SAME TO GENERATE THE XML FILES */

DECLARE
    MY_VAR CLOB ;
BEGIN
    MY_VAR:=DBMS_XMLGEN.GETXML( 'SELECT * FROM DEPT ' );
    DBMS_OUTPUT.PUT_LINE(MY_VAR);
END;


/* DEFINING THROUGH THE QUERY CONTEXT THEN */
DECLARE
    MY_VAR DBMS_XMLGEN.CTXHANDLE ; /* DEFINING THE QUERY CONTEXT WHICH IS OF CTXHANDLE TYPE */
    NEW_VAR CLOB ;
BEGIN
    MY_VAR:=DBMS_XMLGEN.NEWCONTEXT('SELECT * FROM DEPT');/* FETCHING THE QUERY CONTEXT FROM THE SQL STATEMENT*/
    NEW_VAR:=DBMS_XMLGEN.GETXML(MY_VAR);--USING THE GETXML WITH QUERY CONTEXT TO FETCH THE XML_DATA
    DBMS_OUTPUT.PUT_LINE(NEW_VAR);
END;



/* DEFINING THROUGH THE QUERY CONTEXT WITH CLOSING  */
DECLARE
    MY_VAR DBMS_XMLGEN.CTXHANDLE ; /* DEFINING THE QUERY CONTEXT WHICH IS OF CTXHANDLE TYPE */
    NEW_VAR CLOB ;
BEGIN
    MY_VAR:=DBMS_XMLGEN.NEWCONTEXT('SELECT * FROM DEPT');/* FETCHING THE QUERY CONTEXT FROM THE SQL STATEMENT*/
    NEW_VAR:=DBMS_XMLGEN.GETXML(MY_VAR);--USING THE GETXML WITH QUERY CONTEXT TO FETCH THE XML_DATA
    DBMS_OUTPUT.PUT_LINE(NEW_VAR);
    DBMS_XMLGEN.CLOSECONTEXT(MY_VAR);/* CLOSING THE QUERY CONTEXT*/
END;


/*USING THE GETXMLTYPE FUNCTION FOR THE SAME  */

SELECT DBMS_XMLGEN.GETXMLTYPE('SELECT * FROM DEPT') FROM DUAL;

DECLARE
    RESULT_VAR XMLType ;
BEGIN
    SELECT DBMS_XMLGEN.GETXMLTYPE('SELECT * FROM DEPT') INTO  RESULT_VAR
    FROM DUAL;
    -- DBMS_OUTPUT.PUT_LINE(RESULT);
    DBMS_OUTPUT.PUT_LINE(RESULT_VAR.GETCLOBVAL);
END ;


DECLARE
    RESULT_VAR XMLType ;
    QWCTX DBMS_XMLGEN.CTXHANDLE;
BEGIN
    QWCTX:=DBMS_XMLGEN.NEWCONTEXT('SELECT * FROM DEPT');
    RESULT_VAR:=DBMS_XMLGEN.GETXMLTYPE(QWCTX);
    -- DBMS_OUTPUT.PUT_LINE(RESULT_VAR);
    DBMS_OUTPUT.PUT_LINE(RESULT_VAR.GETCLOBVAL);
END ;

/* CLOSING THE CONTEXT */

DECLARE
    RESULT_VAR XMLType ;
    QWCTX DBMS_XMLGEN.CTXHANDLE;
BEGIN
    QWCTX:=DBMS_XMLGEN.NEWCONTEXT('SELECT * FROM DEPT');
    RESULT_VAR:=DBMS_XMLGEN.GETXMLTYPE(QWCTX);
    -- DBMS_OUTPUT.PUT_LINE(RESULT_VAR);
    DBMS_XMLGEN.CLOSECONTEXT(QWCTX);
    DBMS_OUTPUT.PUT_LINE(RESULT_VAR.GETCLOBVAL);
END ;



SELECT DBMS_XMLGEN.GETXML ( ' SELECT  D.* ,
CURSOR( SELECT E.ENAME FROM EMP E WHERE E.DEPTNO=D.DEPTNO ) EMP_CUR
FROM DEPT D WHERE DEPTNO=10 '  ) 
FROM DUAL ;


SELECT DBMS_XMLGEN.GETXMLTYPE ( ' SELECT  D.* ,
CURSOR( SELECT E.ENAME FROM EMP E WHERE E.DEPTNO=D.DEPTNO ) EMP_CUR
FROM DEPT D WHERE DEPTNO=10 '  ) 
FROM DUAL ;





