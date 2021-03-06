/*CREATING THE TABLE OUT OF THE OBJECT TYPE OF ITAX IS */

CREATE TABLE EMPTAX OF ITAX ;

DESCRIBE EMPTAX ;

SELECT * FROM EMPTAX ;

/*INSERTING THE VALUES INTO THE ATTRIBUTES */

INSERT INTO EMPTAX(ID_VAL,ENAME,PSAL,PALLOW,PFUND,PSAVE,PTAX) VALUES (101,'RIKA',5000,200,10,600,10);
INSERT INTO EMPTAX(ID_VAL,ENAME,PSAL,PALLOW,PFUND,PSAVE,PTAX) VALUES (101,'ABISMRUTA',6000,250,12,600,12);
INSERT INTO EMPTAX(ID_VAL,ENAME,PSAL,PALLOW,PFUND,PSAVE,PTAX) VALUES (101,'GUNDU',8000,300,15,800,12);

/*FETCHING ALL THE ATTRIBUTE VALUE */

SELECT * FROM EMPTAX ;

/*UPDATING THE ATTRIBUT INFO */

UPDATE EMPTAX SET ID_VAL=102,PALLOW=700 WHERE ENAME='ABISMRUTA';
UPDATE EMPTAX SET ID_VAL=103 WHERE ENAME='GUNDU';

SELECT * FROM EMPTAX ORDER BY ID_VAL ;


/*USING THE FUNCTION WITH THE ALIAS NAME TO FETCH THE CORRESPONDING VALUE */

SELECT E.ENAME,E.GROSS_SAL() FROM EMPTAX E ;
SELECT E.ENAME,E.NET_INCOME() FROM EMPTAX E ;

