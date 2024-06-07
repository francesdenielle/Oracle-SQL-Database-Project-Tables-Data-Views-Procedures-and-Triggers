
    CREATE OR REPLACE TRIGGER TRG_FOR_REORDER
    AFTER INSERT OR UPDATE OF UnitsInStock ON Product
    BEGIN
        UPDATE Product
        SET REORDER_STATUS = 'Reorder Needed'
        WHERE UnitsInStock < 5 OR UnitsInStock = 5;
        
        UPDATE Product
        SET REORDER_STATUS = NULL
        WHERE UnitsInStock > 5;
    END;
