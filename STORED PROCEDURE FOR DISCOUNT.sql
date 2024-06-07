    
    CREATE OR REPLACE PROCEDURE PRC_FOR_DISCOUNT
    AS BEGIN
        UPDATE Product
        SET Discounts = .10
        WHERE UnitsInStock >75 AND UnitsInStock <101;
        
        UPDATE Product
        SET Discounts = .25
        WHERE UnitsInStock > 100;
        
        
        UPDATE Product
        SET Discounts = NULL
        WHERE UnitsInStock < 76;
        DBMS_OUTPUT.PUT_LINE(' Update Successful ');
    END;

EXEC PRC_FOR_DISCOUNT;
