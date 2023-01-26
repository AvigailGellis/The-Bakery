Use BakeryDB
go
delete Orders
go

insert Orders(FirstName, LastName, Item, Quantity, PricePerUnit, DateOrdered, DateNeeded, CreditCardNum, PaymentType, CommunicationType)
select 'Brian', 'Johns', 'Wedding cookies', 75, 4.5, '2022-12-09', '2023-01-03', '0383', 'Card', 'Call'
union select 'John', 'Seba', 'Birthday Cake', 1, 115, '2022-12-12', '2023-02-01', '6393', 'Card', 'Email'
union select 'Sarah', 'Will', 'Number Cake', 2, 100, '2022-12-25', '2023-01-22', '', 'Cash', 'Email'
union select 'Josh', 'Brad', 'Birthday cupcakes', 35, 3.5, '2022-11-29', '2023-01-05', '8639', 'Card', 'Text'
union select 'Mike', 'Seris', 'Wedding Cake', 1, 450, '2022-12-01', '2023-01-29', '8363', 'Card', 'Call'
union select 'Steve', 'Woods', 'Baby Girl cookies', 50, 3, '2022-11-09', '2023-01-02', '7238', 'Card', 'Text'
union select 'Mike', 'Brand', 'Baby Boy cupcakes', 45, 3.50, '2022-12-15', '2023-02-01', '', 'Cash', 'Call'
union select 'Emma', 'Bird', 'Wedding cake (small)', 1, 350, '2022-12-01', '2023-01-15', '', 'Cash', 'Email'
union select 'Emma', 'Bird', 'Wedding cupcakes', 75, 5.50, '2022-12-01', '2023-01-15', '', 'Cash', 'Email'
union select 'Emma', 'Bird', 'Wedding cookies', 100, 6.50, '2022-12-01', '2023-01-15', '', 'Cash', 'Email'
union select 'Brian', 'Sars', 'Birthday cake', 1, 115, '2022-12-26', '2023-01-31', '', 'Cash', 'Text'
