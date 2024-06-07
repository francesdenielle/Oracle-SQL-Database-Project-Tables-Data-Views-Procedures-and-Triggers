    DROP SEQUENCE SampleSeq;
    CREATE SEQUENCE SampleSeq
    START WITH 11
    INCREMENT BY 1;
  

    CREATE OR REPLACE PROCEDURE PRC_FOR_NEWCUSTOMER (NCustomer_Num IN INTEGER, NHome_Address IN VARCHAR2, NCust_FName IN VARCHAR2, NCust_LName IN VARCHAR2, NContact_Number IN INTEGER) AS 
    BEGIN
        INSERT INTO Customer
        VALUES (SampleSeq.NEXTVAL, NHome_Address , NCust_FName, NCust_LName, NContact_Number);
        DBMS_OUTPUT.PUT_LINE(' New Customer Added! ');
        
    END;

    EXEC PRC_FOR_NEWCUSTOMER ('','Blk 4c Lot 23 Tunasan, Muntinlupa City', 'Justine Amiel', 'Jonson', '9060586230');
