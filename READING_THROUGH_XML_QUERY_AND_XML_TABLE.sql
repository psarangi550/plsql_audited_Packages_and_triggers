

SELECT XT.*
FROM TBL_XML X,XMLTABLE(
    'ROWSET/ROW[DEPTNO=10]/LOC'
    PASSING X.DATA_VAL
) XT ;

SELECT XT.DEPTNO
FROM TBL_XML X ,
XMLTABLE(
    'ROWSET/ROW[DEPTNO=10]'
    PASSING X.DATA_VAL
    COLUMNS
    DEPTNO NUMBER PATH 'DEPTNO',
    DNAME VARCHAR2(50) PATH 'DNAME',
    LOC VARCHAR2(50) PATH 'LOC'
) XT ;

SELECT XT.*
FROM TBL_XML X, XMLTABLE(
    'ROWSET/ROW[DEPTNO>20]'
    PASSING X.DATA_VAL
    COLUMNS
    DNAME VARCHAR2(50)  PATH 'DNAME',
    LOC VARCHAR2(50) PATH 'LOC'
) XT ;


SELECT  XMLQUERY(
    'ROWSET/ROW/DEPTNO'
    PASSING DATA_VAL
    RETURNING CONTENT 
) XQ
FROM TBL_XML