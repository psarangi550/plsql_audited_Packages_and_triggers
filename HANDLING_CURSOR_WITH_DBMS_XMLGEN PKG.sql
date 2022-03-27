/* USING THE SYSREF CURSOR TO GENERATE THE CONTEXT HANDLER */

DECLARE
    QWCTX DBMS_XMLGEN.CTXHANDLE;
    MY_CUR Sys_RefCursor ;
    RESULT_VAR XMLTYPE ;
BEGIN
    OPEN MY_CUR FOR SELECT * FROM DEPT ;
    QWCTX:=DBMS_XMLGEN.NEWCONTEXT(MY_CUR);
    RESULT_VAR:=DBMS_XMLGEN.GETXMLTYPE(QWCTX);
    DBMS_XMLGEN.CLOSECONTEXT(QWCTX);
    DBMS_OUTPUT.PUT_LINE(RESULT_VAR.GETCLOBVAL);
    CLOSE MY_CUR ;
END ;

/* USING THE SYSREF CURSOR TO GENERATE THE CONTEXT HANDLER */

DECLARE
    QWCTX DBMS_XMLGEN.CTXHANDLE;
    MY_CUR Sys_RefCursor ;
    RESULT_VAR XMLTYPE ;
BEGIN
    OPEN MY_CUR FOR SELECT * FROM DEPT ;
    QWCTX:=DBMS_XMLGEN.NEWCONTEXT(MY_CUR);
    RESULT_VAR:=DBMS_XMLGEN.GETXMLTYPE(QWCTX);
    DBMS_XMLGEN.CLOSECONTEXT(QWCTX);
    DBMS_OUTPUT.PUT_LINE(RESULT_VAR.GETCLOBVAL);
    CLOSE MY_CUR ;
END ;

/* CREATIN THE TABLE USING THE XML DATA FETCHED */
BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE TABL_XML(DATA XMLTYPE)' ;
END ;

DECLARE
    QWTCTX DBMS_XMLGEN.CTXHANDLE ;
    RESULT_VAR XMLTYPE ;
BEGIN
    QWTCTX:=DBMS_XMLGEN.NEWCONTEXT('SELECT * FROM EMP WHERE DEPTNO=10');
    RESULT_VAR:=DBMS_XMLGEN.GETXMLTYPE(QWTCTX);
    INSERT INTO TABL_XML(DATA) VALUES (RESULT_VAR); 
    DBMS_XMLGEN.CLOSECONTEXT(QWTCTX);
    DBMS_OUTPUT.PUT_LINE(RESULT_VAR.GETCLOBVAL);
END ;

BEGIN
    EXECUTE IMMEDIATE 'SELECT * FROM TABL_XML ' ;
END