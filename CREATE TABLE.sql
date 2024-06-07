DROP TABLE OrderDetails;

DROP TABLE Orders;

DROP TABLE Product;

DROP TABLE Suppliers;

DROP TABLE Shippers;

DROP TABLE ShipmentDetails;

DROP TABLE Customer;

DROP TABLE Employee;

DROP TABLE Branch;

DROP TABLE Region;

ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY';

CREATE TABLE Region( 
Region_Num INTEGER NOT NULL PRIMARY KEY,
RDescription VARCHAR2(30) 
);

CREATE TABLE Branch( 
Branch_ID INTEGER NOT NULL PRIMARY KEY, 
Region_Num INTEGER, 
ZIP_Code INTEGER, 
FOREIGN KEY (Region_Num) REFERENCES Region (Region_Num) 
);

CREATE TABLE Employee( 
Emp_ID INTEGER NOT NULL PRIMARY KEY, 
Branch_ID INTEGER, Emp_FName VARCHAR2 (30), 
Emp_LName VARCHAR2 (30), 
Hire_Date DATE, 
CHECK (Hire_Date > TO_DATE('10/31/1996','MM/DD/YYYY')),
CHECK (Emp_ID BETWEEN 100 AND 1000),
FOREIGN KEY (Branch_ID) REFERENCES Branch (Branch_ID) 
);

CREATE TABLE Customer( 
Customer_Num INTEGER NOT NULL PRIMARY KEY, 
Home_Address VARCHAR2 (100), 
Cust_FName VARCHAR2 (30), 
Cust_LName VARCHAR2 (30), 
Contact_Number INTEGER 
);

CREATE TABLE ShipmentDetails( 
Shipment_Num INTEGER NOT NULL PRIMARY KEY, 
Shipment_Address VARCHAR2 (100), 
Shipout_Date DATE
);

CREATE TABLE Shippers( 
Shipper_ID INTEGER NOT NULL, 
Shipment_Num INTEGER, 
Company_Name VARCHAR2 (30), 
Company_Contact INTEGER, 
FOREIGN KEY (Shipment_Num) REFERENCES ShipmentDetails (Shipment_Num) 
);

CREATE TABLE Suppliers( 
Supplier_ID INTEGER NOT NULL PRIMARY KEY, 
Supplier_Name VARCHAR2 (100), 
Supplier_Contact INTEGER, 
Supplier_Address VARCHAR2 (30) 
);

CREATE TABLE Product( 
Prod_ID INTEGER NOT NULL PRIMARY KEY, 
Supplier_ID INTEGER, 
Product_Name VARCHAR2 (30), 
UnitsInStock INTEGER,
CHECK (UnitsInStock > 0),
FOREIGN KEY (Supplier_ID) REFERENCES Suppliers (Supplier_ID) 
);

CREATE TABLE Orders ( 
Order_Num INTEGER NOT NULL PRIMARY KEY, 
Emp_ID INTEGER, 
Customer_Num INTEGER, 
Prod_ID INTEGER, 
Shipment_Num INTEGER, 
Order_Date DATE, 
FOREIGN KEY (Emp_ID) REFERENCES Employee (Emp_ID), 
FOREIGN KEY (Customer_Num) REFERENCES Customer (Customer_Num), 
FOREIGN KEY (Prod_ID) REFERENCES Product (Prod_ID), 
FOREIGN KEY (Shipment_Num) REFERENCES ShipmentDetails (Shipment_Num) 
);

CREATE TABLE OrderDetails( 
Order_Num INTEGER REFERENCES Orders (Order_Num), 
Prod_ID INTEGER REFERENCES Product (Prod_ID), 
Unit_Price INTEGER,
Quantity INTEGER, 
Total_Price INTEGER, 
CHECK (Quantity > 0)
);

    






