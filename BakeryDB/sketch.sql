/*
Orders
	OrdersId pk
	FirstName varchar(30) not null not blank
	LastName varchar(30) not null not blank
	Item varchar(30) not null not blank
	Quantity int not null greater than zero
	PricePerUnit decimal(6,2) not null between 2.50 and 650
	TotalCost as Quantity * PricePerUnit
	DateOrdered date not null less than getdate
	DateNeeded date not null must be after opening day
	CreditCardNum char(4) not null not blank
	CommunicationType varchar(20) not null must be call, text, mail, email
	PaymentType char(4) not null must be cash or card
	constraint DateNeeded >= DateOrdered
	constraint DateOrdered up to 60 days in advance, least 1 week.
	
*/