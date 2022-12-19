--exec sp_changedbowner 'DESKTOP-5B06M07\Tyler'
--select CategoryName, ProductName, ListPrice 
--from Categories join Products
--on Categories.CategoryID = Products.CategoryID
--order by CategoryName asc , ProductName

--select FirstName, LastName, Line1, City, State, ZipCode 
--from Customers join Addresses 
--on Customers.CustomerID = Addresses.CustomerID
--where EmailAddress = 'allan.sherwood@yahoo.com'

--select FirstName, LastName, Line1, City, State, ZipCode 
--from Customers join Addresses 
--on Customers.CustomerID = Addresses.CustomerID
--where ShippingAddressID = AddressID

--select LastName, FirstName, OrderDate, ProductName, ItemPrice, DiscountAmount as Discount, Quantity 
--from Customers
--join Orders on Customers.CustomerID = Orders.CustomerID
--join OrderItems on Orders.OrderID = OrderItems.OrderID
--join Products on OrderItems.ProductID = Products.ProductID
--order by LastName, OrderDate, ProductName

--select a.ProductName as ProductName1, b.ProductName as ProductName2, a.ListPrice 
--from Products a, Products b
--where a.ProductID <> b.ProductID
--and a.ListPrice =b.ListPrice
--order by a.ProductName

--select CategoryName, ProductID
--from Categories 
--left join Products on  Categories.CategoryID =Products.CategoryID
--where ProductID is null

--select count(OrderID) as OrderCount, sum(TaxAmount) as TotalTaxAmount
--from Orders

--select Categories.CategoryName, Count(Products.ProductID) as ProductCounts, max (Products.ListPrice) as MostExpensiveProduct
--from Categories, Products
--where Categories.CategoryID = Products.CategoryID
--group by CategoryName order by COUNT(*) desc;

--select EmailAddress, sum(ItemPrice*Quantity) as TotalItemPrice, sum(DiscountAmount*Quantity) as TotalDiscount
--from Customers c
--join Orders o on c.CustomerID = o.CustomerID
--join OrderItems oi on o.OrderID = oi.OrderID
--group by EmailAddress
--order by TotalItemPrice desc;

--select EmailAddress, count(o.OrderID) as NumberOfOrders, sum((ItemPrice-DiscountAmount)*Quantity) as TotalAmount
--from Customers c
--join Orders o on c.CustomerID = o.CustomerID
--join OrderItems oi on o.OrderID = oi.OrderID
--group by EmailAddress
--having count(o.OrderID) > 1

--select EmailAddress, count(o.OrderID) as NumberOrders, sum((ItemPrice - DiscountAmount)*Quantity) as TotalAmount
--from Customers c
--join Orders o on c.CustomerID =o.OrderID
--join OrderItems oi on o.OrderID = oi.OrderID
--where ItemPrice > 400
--group by EmailAddress

--select ProductName, sum((ItemPrice-DiscountAmount)*Quantity) as TotalAmount
--from Products p
--join OrderItems oi on p.ProductID = oi.ProductID
--group by rollup(ProductName)

--select EmailAddress, count(p.ProductID) as NoOfProduct
--from Customers c
--join Orders o on c.CustomerID = o.CustomerID
--join OrderItems oi on o.OrderID = oi.OrderID
--join Products p on oi.ProductID = p.ProductID
--group by EmailAddress 
--having count(p.ProductID) > 1

--select d.Name, max(Rate) as HighestPayRate
--from HumanResources.Department d
--join HumanResources.EmployeeDepartmentHistory edh on d.DepartmentID = edh.DepartmentID
--join HumanResources.EmployeePayHistory eph on edh.BusinessEntityID = eph.BusinessEntityID
--group by Name
--order by HighestPayRate desc

select 
from 









