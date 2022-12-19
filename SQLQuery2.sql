--CREATE PROC spUpdateProductDiscount
--@ProductID int, @DiscountPercent money
--AS
--IF (@DiscountPercent < 0)
--THROW 50003, 'Value for DiscountPercent must be a positive number.', 3;
--ELSE
--UPDATE Products
--SET DiscountPercent = @DiscountPercent
--WHERE ProductID = @ProductID;

--EXEC spUpdateProductDiscount
--@ProductID = 11,
--@DiscountPercent = 30;
--SELECT * FROM Products
--WHERE ProductID = 11;

--EXEC spUpdateProductDiscount
--@ProductID = 11,
--@DiscountPercent = -20;


--CREATE TRIGGER Products_UPDATE
--ON Products
--AFTER UPDATE
--AS
--IF ((SELECT DiscountPercent
--FROM Products
--WHERE ProductID IN (SELECT ProductID FROM Inserted)) > 100 OR
--(SELECT DiscountPercent
--FROM Products
--WHERE ProductID IN (SELECT ProductID FROM Inserted)) < 0)
--THROW 50004, 'Value for DiscountPercent must be between 0 and 100.', 4;
--IF ((SELECT DiscountPercent
--FROM Products
--WHERE ProductID IN (SELECT ProductID FROM Inserted)) < 1)
--UPDATE Products
--SET DiscountPercent = DiscountPercent * 100
--WHERE ProductID IN (SELECT ProductID FROM Inserted);

--UPDATE Products
--SET DiscountPercent = 101
--WHERE ProductID = 11;

--UPDATE Products
--SET DiscountPercent = 0.2
--WHERE ProductID = 11;
--SELECT * FROM Products
--WHERE ProductID = 11;

--CREATE TRIGGER Products_INSERT
--ON Products
--AFTER INSERT
--AS
--IF ((SELECT DateAdded
--FROM Products
--WHERE ProductID IN (SELECT ProductID FROM Inserted)) IS NULL)
--UPDATE Products
--SET DateAdded = GETDATE()
--WHERE ProductID IN (SELECT ProductID FROM Inserted);

--INSERT INTO Products
--VALUES (6, 'thing', 'new product here', ' ',
--543.21, 10, NULL);
--SELECT * FROM Products;


--CREATE TABLE ProductsAudit (
--AuditID int NOT NULL IDENTITY,
--ProductID int NOT NULL,
--CategoryID int NOT NULL,
--ProductCode varchar(10) NOT NULL,
--ProductName varchar(255) NOT NULL,
--ListPrice money NOT NULL,
--DiscountPercent money NOT NULL,
--DateUpdated datetime NULL,
--PRIMARY KEY (AuditID));

CREATE TRIGGER Products_UPDATE_Audit
ON Products
AFTER INSERT, UPDATE
AS
INSERT INTO ProductsAudit
(ProductID, CategoryID, ProductCode, ProductName, ListPrice,
DiscountPercent, DateUpdated)
SELECT ProductID, CategoryID, ProductCode, ProductName, ListPrice,
DiscountPercent, DateAdded
FROM Inserted;

INSERT INTO Products
VALUES (8, 'thingy', 'another product', ' ',
789.65, 25, NULL);
SELECT * FROM Products;
SELECT * FROM ProductsAudit;