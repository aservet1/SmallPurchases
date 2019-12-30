/***Sample Queries***/

/*Add Entry*/
INSERT INTO Purchases(DateAndTime, Amount, FK_Purchases_PurchaseTypes) VALUES ('1909-09-30 04:21:00',2.50,1);

/*Delete Last Entry ... this one doesnt work though. deletes every single entry*/
DELETE FROM Purchases
WHERE DateAndTime = (
	SELECT MIN(DateAndTime)
);


/*Get total amount spent on one certain type*/
