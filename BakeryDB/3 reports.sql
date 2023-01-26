--1. I will need a list of my top 3 goods that are the most popular.
select top 3 NumberOfOrders = count(*), o.Item
from orders o
group by o.Item
order by NumberOfOrders desc

/*2. I would like to know how many customers are paying with cash and how many with card, just so I can know how to better service them. 
  (Eventually I would like to switch over to card only.). 
  I also need to see the average spent per payment method.*/
select count(*), AvgSpent = avg(o.TotalCost), o.PaymentType
from Orders o
group by o.PaymentType

--3. I would like to have a concise list of the date, item, quantity, and order total, grouped by the month it was ordered, so that I can better understand what's poplular at different times of year.
select o.Item, o.DateOrdered, o.DateNeeded, o.Quantity, o.TotalCost, MonthOrdered = datename(month, o.DateOrdered)
from Orders o
order by MonthOrdered desc

/*4. People often complain that my prices are exorbatant. 
  I was thinking to have a "Buy 1 get 1 free" for the first and 15th of each month. 
  I would like to know the total loss, as well as the loss per month.*/
select TotalLoss = sum(o.TotalCost) - sum(case when datepart(day, o.DateOrdered) in(1,15) and o.Quantity > 1 then (o.Quantity / 2) * o.PricePerUnit else o.TotalCost end)
from orders o

select LossPerMonth = sum(o.TotalCost) - sum(case when datepart(day, o.DateOrdered) in(1,15) and o.Quantity > 1 then (o.Quantity / 2) * o.PricePerUnit else o.TotalCost end), datename(month, o.DateOrdered)
from orders o
group by datename(month, o.DateOrdered)
/*5. As a new buisness owner, I would like to have an incentive system set up to encourage my employees to do their best. 
  I currently have 3 employees. Rina makes the cakes, Dina makes the cupcakes, and Sara makes the cookies.
  I would like each employee to receive 5% of what their product brought per month.
  It should also show how many pastries they've made that month.*/
--AS I assumed that if you only included it in a query, you did not want the employees to be included in the table. That can be changed if needed.
select AmountMade = sum(o.TotalCost * .05), TotalQuantity = sum(o.Quantity), Month = datename(month, o.DateOrdered), 
      Employee = case 
                  when o.Item like '% cake%' then 'Rina' 
                  when o.Item like '% Cupcakes%' then 'Dina' 
                  when o.Item like '% Cookies%' then 'Sara' 
                 end
from Orders o
group by datename(month, o.DateOrdered),
         case 
          when o.Item like '% cake%' then 'Rina' 
          when o.Item like '% Cupcakes%' then 'Dina' 
          when o.Item like '% Cookies%' then 'Sara' 
         end
order by Employee, Month desc
