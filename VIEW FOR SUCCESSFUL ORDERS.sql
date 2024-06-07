CREATE VIEW Successful_Orders AS SELECT Order_Num, Order_Date, Shipout_Date, Prod_ID, Shipment_Address
FROM Orders NATURAL JOIN ShipmentDetails 
WHERE Shipout_Date IS NOT NULL;


SELECT * FROM Successful_Orders;