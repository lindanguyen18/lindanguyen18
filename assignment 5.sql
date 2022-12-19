--select distinct CategoryName from Categories
--where CategoryID in (select CategoryID from Products)
--order by CategoryName

--select ProductName, ListPrice from Products 
--order by ListPrice desc

--select CategoryName from Categories c
--where not exists (select 1 from Products p where p.CategoryID = c.CategoryID)



--SELECT EmailAddress, Orders.OrderID, SUM ((ItemPrice-DiscountAmount) * Quantity) AS OrderTotal
--FROM OrderItems JOIN Orders
--On Orderitems.OrderId = Orders.OrderID
--JOIN Customers On Orders.CustomerID= Customers.CustomerID
--GROUP BY EmailAddress, Orders.OrderID

--Select Customers.EmailAddress, MAX (OrderTotal) AS LargestOrder
--FROM Customers JOIN
--(SELECT EmailAddress, Orders.OrderID, SUM ((ItemPrice-DiscountAmount) * Quantity) AS OrderTotal
--FROM OrderItems JOIN Orders
--On OrderItems.OrderID = Orders.OrderID
--JOIN Customers On Orders.CustomerID= Customers.CustomerID
--GROUP BY EmailAddress, Orders.OrderID) AS CustomerTotals
--ON Customers.EmailAddress = CustomerTotals.EmailAddress
--GROUP BY Customers.EmailAddress

--select DiscountPercent, ProductName from Products
--where DiscountPercent in 
--(select DiscountPercent from Products 
--group by DiscountPercent 
--having count(*)=1 )
--order by ProductName;


--select EmailAddress, OrderDate, OrderID from Customers c
--join Orders o on c.CustomerID = o.CustomerID
--where OrderDate = (select min(OrderDate) from Orders )

--Insert into Categories
--(CategoryName)
--values ('Brass')

--update Categories
--set CategoryName = 'Woodwinds'
--where CategoryID = (select CategoryID from Categories where CategoryName ='Brass')

--delete Categories
--where CategoryName = 'Brass' 

--insert into Products
--(ProductID, CategoryID, ProductCode, ProductName, Description, ListPrice, DiscountPercent, DateAdded)
--values (   4, 4, 'dgx_640', 'Yamaha DGX 640 88-Key Digital Piano', 'Long description to come.', 799.99, 0, GETDATE())

--delete Products where ProductID = 4 
--delete Categories where CategoryID = 4

--update Products
--set DiscountPercent = 0.35 
--where CategoryID = 4


--INSERT into Customers
--(EmailAddress, Password, FirstName, LastName)
--values ('rick@reven.com', ' ', 'Rick', 'Revan')

--update Customers
--set Password = 'secret'
--where EmailAddress = 'rick@raven.com'

--update Customers 
--set Password = 'reset'
