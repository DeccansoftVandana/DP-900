Create Table Customer
(
	Id int Primary Key,
	FirstName Varchar(50) Not Null,
	MiddleName Varchar(50),
	LastName Varchar(50),
	Email Varchar(100) Not Null,
	Address Varchar(100) Not Null,
	City Varchar(50) Not Null
)


Create Table Product
(
	Id int Primary Key,
	Name Varchar(20) Not Null,
	Price Decimal (10,2)
)

Create Table [Order]
(
	OrderNo int Primary Key,
	OrderDate Datetime,
	Customer int References Customer(Id)
)

Create Table LineItem
(
	OrderNo int References [Order](OrderNO),
	ItemNo int,
	ProductID int References Product(Id),
	Quantity int
)


Insert Into Customer Values(1,'Joe','David','Jones','joe@litware.com','1 MainSt.','Seattle')
Insert Into Customer Values(2,'Samir',Null,'Nadoy','samir@northwind.com','123 Elm Pl.','New York')

Go

Insert into Product Values(123,'Hammer',2.99)
Insert into Product Values(162,'Screwdriver',3.49)
Insert into Product Values(201,'Wrench',4.25)

Go

Insert into [Order] values(1000,'1/1/2022',1)
Insert into [Order] values(1001,'1/1/2022',2)

Go

Insert into LineItem Values(1000,1,123,1)
Insert into LineItem Values(1000,2,201,2)
Insert into LineItem Values(1001,1,123,1)





