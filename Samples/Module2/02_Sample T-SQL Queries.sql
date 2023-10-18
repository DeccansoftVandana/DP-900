--Get Customers Details in Seattle city
SELECT *
FROM Customer
WHERE City = 'Seattle';

--Select specific columns
SELECT FirstName, LastName, Address, City
FROM Customer
WHERE City = 'Seattle';



--Sort the result set in order of LastName
SELECT FirstName, LastName, Address, City
FROM Customer
WHERE City = 'Seattle'
ORDER BY LastName;


--Get Customer Details and his Order date and order no
SELECT o.OrderNo, o.OrderDate, c.Address, c.City
FROM Order AS o
JOIN Customer AS c
ON o.Customer = c.ID

--Change address of customer with id as 1

UPDATE Customer
SET Address = '123 High St.'
WHERE ID = 1;


--Delete From Product Table
DELETE FROM Product
WHERE ID = 162;


--Insert Row in Product Table
INSERT INTO Product(ID, Name, Price)
VALUES (99, 'Drill', 4.99);

--Create Login and associate database user with that
CREATE LOGIN JOHN WITH PASSWORD ='john'

CREATE USER JOHN FOR LOGIN [JOHN]


--Connect using new Login and Execute following Query

Select * from Customer

--Give Permissins to user to Select from Customer Table

GRANT SELECT, INSERT, UPDATE
ON Customer
TO JOHN;

--Execute Following Queries

Select * from Customer

Select * from Product




