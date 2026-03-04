DROP DATABASE IF EXISTS AcmeFurniture;

create database AcmeFurniture;

use AcmeFurniture;

create table Territory (
  TerritoryNumber INT PRIMARY KEY,
  TerritoryName VARCHAR(50),
  Region VARCHAR(50),
  Quota DECIMAL(10, 2)
);

create table SalesRep (
  EmployeeID INT PRIMARY KEY,
  MTDSales DECIMAL(10, 2),
  YTDSales DECIMAL(10, 2),
  MTDCommission DECIMAL(10, 2),
  YTDCommission DECIMAL(10, 2),
  CommissionRate DECIMAL(4, 2),
  TerritoryNumber INT,
  FOREIGN KEY (TerritoryNumber) REFERENCES Territory(TerritoryNumber)
);

create table Employee (
  EmployeeID INT PRIMARY KEY,
  EmpName VARCHAR(50),
  EmpAddress1 VARCHAR(50),
  EmpAddress2 VARCHAR(50),
  EmpCity VARCHAR(50),
  EmpState CHAR(2),
  EmpZip CHAR(10),
  EmpPhone CHAR(12)
);

create table Customer (
  CustomerNumber INT PRIMARY KEY,
  FName VARCHAR(50),
  LName VARCHAR(50),
  Address1 VARCHAR(50),
  Address2 VARCHAR(50),
  City VARCHAR(50),
  State CHAR(2),
  ZipCode CHAR(10),
  PhoneNum CHAR(12),
  MTDSales DECIMAL(10, 2),
  YTDSales DECIMAL(10, 2),
  CurrentBalance DECIMAL(10, 2),
  CreditLimit DECIMAL(10, 2),
  ShipName VARCHAR(50),
  ShipAddress1 VARCHAR(50),
  ShipAddress2 VARCHAR(50),
  ShipCity VARCHAR(50),
  ShipState CHAR(2),
  ShipZipCode CHAR(10),
  CurrentInvoiceTotal DECIMAL(10, 2),
  CurrentPaymentTotal DECIMAL(10, 2),
  CurrentAmount DECIMAL(10, 2),
  Over30 INT,
  Over60 INT,
  Over90 INT,
  PreviousBalance DECIMAL(10, 2),
  EmployeeID INT,
  FOREIGN KEY (EmployeeID) REFERENCES SalesRep(EmployeeID)
);

create table Part (
  PartNumber INT PRIMARY KEY,
  VendorNumber INT,
  PartDescription VARCHAR(50),
  UnitPrice DECIMAL(10, 2),
  MTDSales DECIMAL(10, 2),
  YTDSales DECIMAL(10, 2),
  UnitsOnHand INT,
  UnitsAllocated INT,
  ReorderPoint INT,
  VendorPrice DECIMAL(10, 2),
  MinimumOrderQuantity INT,
  ExpectedLeadTime INT,
  FOREIGN KEY (VendorNumber) REFERENCES Vendor(VendorNumber)
);

create table Vendor (
  VendorNumber INT PRIMARY KEY,
  Name VARCHAR(50),
  Address VARCHAR(50),
  City VARCHAR(50),
  State CHAR(2),
  ZipCode CHAR(10),
  PhoneNum CHAR(12),
  CreditLimit DECIMAL(10, 2)
);
create table OrderTable (
  OrderNumber INT PRIMARY KEY,
  OrderDate DATE,
  CustomerNumber INT,
  CustomerPONumber VARCHAR(50),
  OrderTotal DECIMAL(10, 2),
  OrderStatus VARCHAR(50),
  OrderSpecialCharges DECIMAL(10, 2),
  OrderSpecialChargeDescription VARCHAR(50),
  ShipName VARCHAR(50),
  ShipAddress1 VARCHAR(50),
  ShipAddress2 VARCHAR(50),
  ShipCity VARCHAR(50),
  ShipState CHAR(2),
  ShipZip CHAR(10),
  FOREIGN KEY (CustomerNumber) REFERENCES Customer(CustomerNumber)
);
create table OrderDetail (
OrderNumber INT,
SeqNumber INT,
PartNumber INT,
VendorNumber INT,
NumberOrdered INT,
QuotedPrice DECIMAL(10, 2),
LineTotal DECIMAL(10, 2),
Comments VARCHAR(255),
PRIMARY KEY (OrderNumber, SeqNumber),
FOREIGN KEY (OrderNumber) REFERENCES OrderTable(OrderNumber),
FOREIGN KEY (PartNumber, VendorNumber) REFERENCES Part(PartNumber, VendorNumber)
);

create table Invoice (
InvoiceNumber INT PRIMARY KEY,
ShipDate DATE,
Freight DECIMAL(10, 2),
ShipStatus VARCHAR(50)
);

create table InvoiceDetail (
InvoiceNumber INT,
OrderNumber INT,
SeqNumber INT,
QuantityShipped INT,
PRIMARY KEY (InvoiceNumber, OrderNumber, SeqNumber),
FOREIGN KEY (InvoiceNumber) REFERENCES Invoice(InvoiceNumber),
FOREIGN KEY (OrderNumber, SeqNumber) REFERENCES OrderDetail(OrderNumber, SeqNumber)
);

create table Payment (
PaymentNumber INT PRIMARY KEY,
CustomerNumber INT,
PaymentDate DATE,
Amount DECIMAL(10, 2),
FOREIGN KEY (CustomerNumber) REFERENCES Customer(CustomerNumber)
);


insert into Territory (TerritoryNumber, TerritoryName, Region, Quota)
values
(1, 'Northeast', 'Eastern', 100000),
(2, 'Southeast', 'Eastern', 75000);


insert into SalesRep (EmployeeID, MTDSales, YTDSales, MTDCommission, YTDCommission, CommissionRate, TerritoryNumber)
values
(1, 50000, 1000000, 5000, 100000, 0.05, 1),
(2, 30000, 750000, 3000, 75000, 0.04, 2);

insert into Employee (EmployeeID, EmpName, EmpAddress1, EmpAddress2, EmpCity, EmpState, EmpZip, EmpPhone)
values
(1, 'Tony Furgison', '123 Main St', '', 'Boston', 'MA', '02110', '555-555-1212'),
(2, 'Garret Bobby The Third', '456 Park Ave', '', 'Atlanta', 'GA', '30303', '555-555-2121');

insert into Vendor (VendorNumber, Name, Address, City, State, ZipCode, Phonenum, CreditLimit)
values
(1, 'ABC Company', '789 Market St', 'San Francisco', 'CA', '94103', '555-555-1313', 10000),
(2, 'XYZ Corporation', '321 Elm St', 'New York', 'NY', '10001', '555-555-2424', 5000);

insert into Part (PartNumber, VendorNumber, PartDescription, UnitPrice, MTDSales, YTDSales, UnitsOnHand, UnitsAllocated, ReorderPoint, VendorPrice, MinimumOrderQuantity, ExpectedLeadTime)
values
(1, 1, 'Widget', 10.00, 10000, 200000, 5000, 1000, 200, 9.00, 100, 14),
(2, 2, 'Gizmo', 20.00, 5000, 150000, 2000, 500,200, 15.00, 250, 21),
(3, 1, 'Sprocket', 5.00, 8000, 100000, 10000, 5000, 1000, 4.50, 50, 7),
(4, 3, 'Cog', 15.00, 2000, 50000, 500, 100, 50, 12.00, 1000, 28);

insert into OrderTable (OrderNumber, OrderDate, CustomerNumber, CustomerPONumber, OrderTotal, OrderStatus, OrderSpecialCharges, OrderSpecialChargeDescription, ShipName, ShipAddress1, ShipAddress2, ShipCity, ShipState, ShipZip)
values
(1, '2023-04-01', 1, 'PO123', 200.00, 'Shipped', 10.00, 'Rush order', 'Bruce Wayne', '123 Elm St', '', 'Anytown', 'CA', '12345'),
(2, '2023-04-15', 2, 'PO456', 500.00, 'In Progress', 20.00, 'Special handling', 'Ash Ketchum', '456 Oak Ave', '', 'Big City', 'NY', '54321');

insert into OrderDetail (OrderNumber, SeqNumber, PartNumber, VendorNumber, NumberOrdered, QuotedPrice, LineTotal, Comments)
values
(1, 1, 1, 1, 10, 9.00, 90.00, 'Standard delivery'),
(1, 2, 2, 2, 5, 15.00, 75.00, 'Next day delivery'),
(2, 1, 3, 1, 20, 4.50, 90.00, 'Standard delivery'),
(2, 2, 4, 2, 50, 12.00, 600.00, 'Special handling');

insert into Invoice (InvoiceNumber, ShipDate, Freight, ShipStatus)
values
(1, '2023-04-01', 10.00, 'Shipped'),
(2, '2023-04-15', 20.00, 'In Progress');

insert into InvoiceDetail (InvoiceNumber, OrderNumber, SeqNumber, QuantityShipped)
values
(1, 1, 1, 10),
(1, 1, 2, 5),
(2, 2, 1, 20),
(2, 2, 2, 50);

insert into Payment (PaymentNumber, CustomerNumber, PaymentDate, Amount)
values
(1, 1, '2023-04-01', 100.00),
(2, 2, '2023-04-15', 250.00);

insert into Customer (CustomerNumber, FName, LName, PhoneNum)
values
(1, 'Johnny', 'Test', '555-5555'),
(2, 'Blues', 'Clues', '234-5678');