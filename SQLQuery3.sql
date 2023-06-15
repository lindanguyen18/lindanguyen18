--1. 
select ITEM_NUM, DESCRIPTION, PRICE
from ITEM
 
--2.
select *
from ORDERS

--3. 
select CREDIT_LIMIT from CUSTOMER
where CREDIT_LIMIT >=10000;
 
--4. 
select ORDER_NUM
 from ORDERS
 where CUSTOMER_NUM = '126' and ORDER_DATE = '10/15/2015'
 

--5. 
select CUSTOMER_NUM, CUSTOMER_NAME
from CUSTOMER
where REP_NUM = 30 or REP_NUM =45
 
--6.
select ITEM_NUM, DESCRIPTION
from ITEM
where CATEGORY ='PZL';


--7. 
select ITEM_NUM, DESCRIPTION, ON_HAND from ITEM where ON_HAND >=20 and ON_HAND <=40
select ITEM_NUM, ON_HAND, DESCRIPTION from ITEM where ON_HAND between 20 and 40
 
--8. 
select ITEM_NUM, DESCRIPTION, ON_HAND*PRICE as ON_HAND_VALUE
from ITEM
where CATEGORY = 'toy'
 
--9.
select ITEM_NUM, DESCRIPTION, ON_HAND*PRICE AS ON_HAND_VALUE from ITEM
WHERE ON_HAND*PRICE >= 1500
 
--10.
SELECT ITEM_NUM, DESCRIPTION
from ITEM
where CATEGORY in ('GME', 'PZL')
 


--11. 
select CUSTOMER_NUM, CUSTOMER_NAME from CUSTOMER 
where CUSTOMER_NAME like 'C%'
 
--12.
select * from ITEM 
order by DESCRIPTION asc
 
--13. 
select * from ITEM 
order by STOREHOUSE, ITEM_NUM asc; 

--14. 
select ITEM_NUM, DESCRIPTION from ITEM 
where CATEGORY in ('PZL', 'TOY') and DESCRIPTION like '%set%'
 
--15.
select ORDER_DATE, ORDER_NUM, CUSTOMER_NAME, ORDERS.CUSTOMER_NUM from ORDERS,CUSTOMER
 
--16. 
select ORDERS.ORDER_NUM, ORDER_DATE, ITEM.ITEM_NUM, NUM_ORDERED,QUOTED_PRICE from  ORDERS, ITEM, ORDER_LINE
where ORDER_DATE = '10/15/2015'
 
--17.
select CUSTOMER_NAME, CUSTOMER.CUSTOMER_NUM from CUSTOMER, ORDERS
where ORDER_DATE = '10/15/2015'
 
--18.
select ORDER_NUM,ORDER_DATE, ITEM_NUM, DESCRIPTION, CATEGORY from ORDERS, ITEM
 
--19.
select JobTitle from HumanResources.Employee
 

--20. 
select BusinessEntityID, PersonType, FirstName, MiddleName, LastName from Person.Person
where LastName like '%X%' and FirstName like( '[E, I , N]%') and LEN(FirstName) <5
and MiddleName is not null
 

--21. 
select ProductID, Name from Production.Product
where Color ='blue'
 
--22.
select SalesOrderID, OrderDate, CustomerID, SubTotal, TotalDue from sales.SalesOrderHeader
where  SalesOrderID in ('63408', '63451' ,'63520' ,'63599' , '63655' , '637210' )
 

--23.
where name like '%derailleur%'
 
--24.
select Person.BusinessEntityID, LastName, FirstName, JobTitle, BirthDate from Person.Person, HumanResources.Employee
order by LastName desc ,FirstName
 




