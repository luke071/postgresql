--Hobbit_Bookstore;


CREATE TABLE Categories (
CategoryId int,
CategoryName char(50) NOT NULL
);

CREATE TABLE Books (
BookId int,
CategoryId int,
Title char(50) NOT NULL,
Author char(50) NOT NULL,
CatalogNumber char(10),
PurchasePrice decimal(6,2),
SellingPrice decimal(6,2),
StockStatus int,
IsNew boolean,
IsSale boolean
);

CREATE TABLE Customers_Orders_Items (
OrderId int,
BookId int,
Quantity int,
Price decimal(6,2)
);

CREATE TABLE Customers (
CustomerId int,
Name char(10) NOT NULL,
Surname char(10) NOT NULL,
Adress char(255) NOT NULL
);

CREATE TABLE  Couriers (
CourierId int,
Name char(10) NOT NULL,
PriceBoxS decimal (6,2) NOT NULL,
PriceBoxM decimal (6,2) NOT NULL,
PriceBoxL decimal (6,2) NOT NULL
);

CREATE TABLE Statuses (
StatusId int,
StatusName char(10) NOT NULL
);

CREATE TABLE Customers_Orders (
OrderId int NOT NULL DEFAULT 0,
CustomerId int,
StatusId int,
EmployeeId int,
CourierId int,
OrderValue decimal(6,2),
ToPay decimal(6,2),
IsPaid decimal(6,2),
Discount decimal(6,2),
IsReturn boolean,
OrderDate date,
PackingDate date,
SendingDate date,
Comments char(255)
);

CREATE TABLE Employees (
EmployeeId int,
Name char(10) NOT NULL,
Surname char(10) NOT NULL,
IsAvailable boolean
);

ALTER TABLE Categories ADD 
	CONSTRAINT PK_Categories PRIMARY KEY    
	(
		CategoryId
	)  
;

ALTER TABLE Books ADD 
	CONSTRAINT PK_Books PRIMARY KEY    
	(
		BookId
	)  
;

ALTER TABLE Customers_Orders_Items ADD 
	CONSTRAINT PK_Customers_Orders_Items PRIMARY KEY    
	(
		OrderId, BookId
	)  
;

ALTER TABLE Customers ADD 
	CONSTRAINT PK_Customers PRIMARY KEY    
	(
		CustomerId
	)  
;

ALTER TABLE Couriers ADD 
	CONSTRAINT PK_Couriers PRIMARY KEY    
	(
		CourierId
	)  
;

ALTER TABLE Statuses ADD 
	CONSTRAINT PK_Statuses PRIMARY KEY    
	(
		StatusId
	)  
;

ALTER TABLE Customers_Orders ADD 
	CONSTRAINT PK_Customers_Orders PRIMARY KEY    
	(
		OrderId
	)  
;

ALTER TABLE Employees ADD 
	CONSTRAINT PK_Employees PRIMARY KEY    
	(
		EmployeeId
	)  
;

ALTER TABLE Customers_Orders_Items 
ADD CONSTRAINT FK1_Customers_Orders_Items FOREIGN KEY 
	(
		OrderId
	) REFERENCES Customers_Orders (
		OrderId
	),
ADD CONSTRAINT FK2_Customers_Orders_Items FOREIGN KEY 
	(
		BookId
	) REFERENCES Books (
		BookId
	)
;

ALTER TABLE Books 
ADD CONSTRAINT FK1_Books FOREIGN KEY 
	(
		CategoryId
	) REFERENCES Categories (
		CategoryId
	)
;

ALTER TABLE Customers_Orders 
ADD CONSTRAINT FK1_Customers FOREIGN KEY 
	(
		CustomerId
	) REFERENCES Customers (
		CustomerId
	),
ADD CONSTRAINT FK2_Statuses FOREIGN KEY 
	(
		StatusId
	) REFERENCES Statuses (
		StatusId
	),
ADD CONSTRAINT FK3_Couriers FOREIGN KEY 
	(
		CourierId
	) REFERENCES Couriers (
		CourierId
	),
ADD CONSTRAINT FK4_Employees FOREIGN KEY 
	(
		EmployeeId
	) REFERENCES Employees (
		EmployeeId
	)
;