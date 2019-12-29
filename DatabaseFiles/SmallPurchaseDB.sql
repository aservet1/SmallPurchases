DROP DATABASE IF EXISTS SmallPurchaseDB;
CREATE DATABASE IF NOT EXISTS SmallPurchaseDB;

use SmallPurchaseDB;

/*Using bigints for IDs is overkill on memory? Or does this not matter until later? I used bigints on my last database project*/

CREATE TABLE PurchaseTypes (

	PurchaseTypeID	bigint			NOT NULL	AUTO_INCREMENT,	/*can change id determiner to hash or whatever if we would like*/
	Name			varchar(20)		NOT NULL,
	Description		varchar(100)	NULL,

	Primary Key (PurchaseTypeID)

);

CREATE TABLE Purchases (

	PurchaseID		bigint			NOT NULL	AUTO_INCREMENT,	/*can change id determiner to hash or whatever if we would like*/
	DateAndTime		datetime		NOT NULL,
	Amount			DECIMAL(5,2)	NOT NULL,	/*idk about decimal paramters. too big?*/
	PurchaseTypeID	bigint			NOT NULL,

	Primary Key (PurchaseID),
	Foreign Key (PurchaseTypeID) References PurchaseTypes(PurchaseTypeID)

);

/*Inserting Dummy Data*/
INSERT INTO PurchaseTypes(Name) VALUES ('Hot Dog Stand');
INSERT INTO PurchaseTypes(Name) VALUES ('Vanding Machine');
INSERT INTO PurchaseTypes(Name) VALUES ('Parking Garage');
INSERT INTO PurchaseTypes(Name) VALUES ('Toll Road');
INSERT INTO PurchaseTypes(Name, Description) VALUES ('Getting Robbed','yeah this is getting pretty frequent isnt it');

INSERT INTO Purchases(DateAndTime, Amount, PurchaseTypeID) VALUES ('1909-09-30 04:21:00',2.50,1);
INSERT INTO Purchases(DateAndTime, Amount, PurchaseTypeID) VALUES ('1909-11-22 09:37:25',3.1,2);
INSERT INTO Purchases(DateAndTime, Amount, PurchaseTypeID) VALUES ('1946-06-12 15:24:09',2.0,1);
INSERT INTO Purchases(DateAndTime, Amount, PurchaseTypeID) VALUES ('1932-07-04 01:25:42',1.4,4);
INSERT INTO Purchases(DateAndTime, Amount, PurchaseTypeID) VALUES ('1948-07-31 08:34:31',4.4,5);
INSERT INTO Purchases(DateAndTime, Amount, PurchaseTypeID) VALUES ('1935-01-27 07:48:15',.75,3);
INSERT INTO Purchases(DateAndTime, Amount, PurchaseTypeID) VALUES ('1938-05-04 15:56:41',.44,2);
INSERT INTO Purchases(DateAndTime, Amount, PurchaseTypeID) VALUES ('1992-07-30 11:47:47',1.69,2);
INSERT INTO Purchases(DateAndTime, Amount, PurchaseTypeID) VALUES ('1979-03-30 22:25:53',7.00,1);
INSERT INTO Purchases(DateAndTime, Amount, PurchaseTypeID) VALUES ('1980-05-02 18:41:10',4.4,3);
