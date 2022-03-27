CREATE OR REPLACE TYPE ITAX IS OBJECT (
    ID_VAL NUMBER , 
    ENAME VARCHAR2(50),
    PSAL NUMBER ,
    PALLOW NUMBER ,
--    PFUND NUMBER ,
--    PTAX NUMBER ,
--    PITAX NUMBER ,
    MEMBER FUNCTION GROSS_SAL RETURN NUMBER 
    -- MEMBER FUNCTION NET_INCOME RETURN NUMBER ,
    -- MEMBER FUNCTION TAXABLE_AMT RETURN NUMBER ,
    -- MEMBER FUNCTION INCOME_TAX_AMOUNT RETURN NUMBER
);

/*CREATING THE OBJECT BODY AS */
CREATE OR REPLACE TYPE BODY ITAX AS
MEMBER FUNCTION GROSS_SAL RETURN NUMBER
IS
    SAL NUMBER ;--CREATING THE LOCAL VARIABLE 
    TSAL NUMBER ; --CREATING ANOTHER LOCAL SALARY 
BEGIN
    SAL:=SELF.PSAL+SELF.PALLOW ;
    TSAL:=SAL*12;
    RETURN TSAL;
END GROSS_SAL ;
END ;

/*CALLING THE OBJECT FUNCTION */

DECLARE
    V_SAL NUMBER;
    OBJ_ITAX  ITAX ;
BEGIN
    OBJ_ITAX:=ITAX(ID_VAL=>101,ENAME=>'PRATIK',PSAL=>3000,PALLOW=>500);
    V_SAL:=OBJ_ITAX.GROSS_SAL();
    DBMS_OUTPUT.PUT_LINE('GROSS  SALARY IS  ' || V_SAL  );
END;


/*CREATING THE OBJECT TYPE HEADER */
--REMEMBER TO USE ONLY COMM NO SEMICOLON REQUIRED IN THE BLOCK 
CREATE OR REPLACE TYPE ITAX IS OBJECT (
    ID_VAL NUMBER , 
    ENAME VARCHAR2(50),
    PSAL NUMBER ,
    PALLOW NUMBER ,
    PFUND NUMBER ,
    PSAVE NUMBER,
    PTAX NUMBER ,
    MEMBER FUNCTION GROSS_SAL RETURN NUMBER ,
    MEMBER FUNCTION NET_INCOME RETURN NUMBER ,
    MEMBER FUNCTION TAXABLE_AMT RETURN NUMBER ,
    MEMBER FUNCTION INCOME_TAX_AMOUNT RETURN NUMBER
);

/*CREATING THE OBJECT BODY AS */
/*CREATING THE OBJECT BODY AS */
CREATE OR REPLACE TYPE BODY ITAX AS
MEMBER FUNCTION GROSS_SAL RETURN NUMBER
IS
    SAL NUMBER ;--CREATING THE LOCAL VARIABLE 
    TSAL NUMBER ; --CREATING ANOTHER LOCAL SALARY 
BEGIN
    SAL:=SELF.PSAL+SELF.PALLOW ;
    TSAL:=SAL*12;
    RETURN TSAL;
END GROSS_SAL ;

--DEFINING THE FUNCTION FOR THE NETSALARY 
MEMBER FUNCTION NET_INCOME RETURN NUMBER
IS
    SAL NUMBER ;
BEGIN
    SAL:=SELF.GROSS_SAL-(SELF.GROSS_SAL*(SELF.PFUND/100));
    RETURN SAL ;
END NET_INCOME ;

--DEFINING THE TAXABLE AMOUNT FUNCTION 

MEMBER FUNCTION TAXABLE_AMT RETURN NUMBER
IS
    SAL NUMBER ;
BEGIN
    SAL:=SELF.NET_INCOME()-(SELF.PSAVE*12);
    RETURN SAL ;

END TAXABLE_AMT;

--DEFINING THE INCOMETAX FUNCTION 

MEMBER FUNCTION INCOME_TAX_AMOUNT RETURN NUMBER
IS
    SAL NUMBER ;
BEGIN
    SAL:=SELF.TAXABLE_AMT() * (PTAX/100) ;
    RETURN SAL ;

END INCOME_TAX_AMOUNT ;
END ;

DECLARE
    V_SAL NUMBER;
    OBJ_ITAX  ITAX ;
BEGIN
    OBJ_ITAX:=ITAX(ID_VAL=>101,ENAME=>'PRATIK',PSAL=>3000,PALLOW=>500,PFUND=>10,PSAVE=>500,PTAX=>10);
    V_SAL:=OBJ_ITAX.GROSS_SAL();
    DBMS_OUTPUT.PUT_LINE('GROSS  SALARY IS  ' || V_SAL  );
    DBMS_OUTPUT.PUT_LINE('NET  SALARY IS  ' || OBJ_ITAX.NET_INCOME());
    DBMS_OUTPUT.PUT_LINE('TAXABLE SALARY IS  ' || OBJ_ITAX.TAXABLE_AMT());
    DBMS_OUTPUT.PUT_LINE('INCOMTAX  SALARY IS  ' || OBJ_ITAX.INCOME_TAX_AMOUNT());
END;












