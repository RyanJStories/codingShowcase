USE AcmeFurniture

GO

--1
SELECT FName,  *
FROM Customer
WHERE FName = 'Mary';

--2
UPDATE Customer
SET FName = 'Michelle'
WHERE FName = 'Mary';

--3
UPDATE Customer
SET City = 'Milwaukee', ZipCode = '53201'
WHERE FName= 'Michelle';

--4
DELETE FROM Customer
WHERE FName = 'Michelle';

--5
UPDATE SalesRep
SET CommissionRate = .17;

--6
ALTER TABLE Vendor
ADD Status INT;

--7
SELECT FName, PhoneNum
FROM Customer
ORDER BY FName ASC;

--8
SELECT LName, FName
FROM Customer
WHERE CreditLimit >= 800;

--9
SELECT OrderNumber
FROM OrderTable
WHERE CustomerNumber = 124 AND OrderDate = '12/01/23';

--10
SELECT PartNumber, PartDescription, UnitPrice
FROM  Part
WHERE  ReorderPoint > 10;

--11
SELECT CustomerNumber, FName || ' ' || LName AS Name
FROM Customer
WHERE FName LIKE 'S%';

--12
SELECT PartNumber, PartDescription, UnitsOnHand
FROM Part
WHERE UnitsOnHand > (SELECT AVG(UnitsOnHand) FROM Part);

--13
SELECT PartNumber, PartDescription, UnitPrice
FROM Part
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM Part);

--14
SELECT COUNT(*) FROM Customer;

--15
SELECT SalesRep, SUM(CurrentBalance)
FROM Customer
GROUP BY SalesRep;

--16
SELECT OrderTable.OrderNumber, OrderTable.OrderDate, Customer.CustomerNumber, Customer.LName, Customer.FName
FROM OrderTable
INNER JOIN Customer ON OrderTable.CustomerNumber = Customer.CustomerNumber
WHERE OrderTable.OrderDate = '12/22/22';

--17
SELECT OrderTable.OrderNumber, OrderTable.OrderDate, OrderDetail.PartNumber, Part.PartDescription, OrderDetail.QuantityOrdered
FROM OrderTable
INNER JOIN OrderDetail ON Orders.OrderNumber = OrderDetail.OrderNumber
INNER JOIN Inventory ON OrderDetail.PartNumber = Part.PartNumber
ORDER BY OrderTable.OrderNumber ASC;

--18
SELECT PartNumber, PartDescription, UnitPrice, UnitsOnHand
FROM Part
WHERE UnitPrice > ALL (SELECT UnitPrice FROM Part WHERE UnitsOnHand > 0);

--19
SELECT SalesRep.SalesRep, SalesRep.LName, SalesRep.FName
FROM SalesRep
INNER JOIN Customer ON SalesRep.SalesRep = Customer.SalesRep
WHERE Customer.CreditLimit = 2000;
