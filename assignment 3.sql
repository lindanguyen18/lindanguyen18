--select ORDER_NUM, ORDER_DATE, CUSTOMER.CUSTOMER_NAME from ORDERS, CUSTOMER
    
--select ORDER_NUM, CUSTOMER.CUSTOMER_NAME, CUSTOMER.CUSTOMER_NUM  from ORDERS, CUSTOMER
----where ORDER_DATE ='Oct 15, 2015'

--select ORDERS.ORDER_NUM, ORDER_DATE, item.ITEM_NUM, NUM_ORDERED, QUOTED_PRICE from ORDERS, ITEM, ORDER_LINE

--select customer.CUSTOMER_NUM, CUSTOMER_NAME, ORDER_DATE from CUSTOMER, ORDERS
--where ORDER_DATE = 'Oct 15, 2015'

--select ORDER_NUM, ORDER_DATE, ITEM_NUM, DESCRIPTION, CATEGORY from ITEM, ORDERS

--select CUSTOMER.REP_NUM, LAST_NAME, FIRST_NAME, CREDIT_LIMIT from REP, CUSTOMER
--where CREDIT_LIMIT =10000

--select CUSTOMER_NAME, CUSTOMER_NUM, DESCRIPTION from CUSTOMER, ITEM
--where DESCRIPTION = 'Rocking Horse'

--select  A.ITEM_NUM, A.DESCRIPTION,B.CATEGORY from ITEM A, ITEM B
--where A.CATEGORY =B.CATEGORY
--and A.ITEM_NUM >B.ITEM_NUM


--select ORDER_DATE, ORDER_NUM, CUSTOMER_NAME from ORDERS, CUSTOMER
--where CUSTOMER_NAME = 'Johnson''s Department Store'

--select ORDER_NUM, ORDER_DATE, DESCRIPTION from ORDERS, ITEM
--where DESCRIPTION = 'Fire Engine'

--select ORDER_NUM, ORDER_DATE, DESCRIPTION from ORDERS, ITEM
--where DESCRIPTION = 'Fire Engine'
--union
--select ORDER_NUM, ORDER_DATE, CUSTOMER_NAME from ORDERS, CUSTOMER
--where CUSTOMER_NAME = 'Almondton General Store'


--select ORDER_NUM, ORDER_DATE, CUSTOMER_NAME, DESCRIPTION from ORDERS, ITEM, CUSTOMER
--where CUSTOMER_NAME = 'Almondton General Store' and DESCRIPTION not like '%fire engine%'

SELECT ORDERS.ORDER_NUM, ORDERS.ORDER_DATE FROM [TAL].[dbo].[ORDERS] 
JOIN CUSTOMER ON CUSTOMER.CUSTOMER_NUM = ORDERS.CUSTOMER_NUM 
JOIN ORDER_LINE ON ORDER_LINE.ORDER_NUM = ORDERS.ORDER_NUM 
JOIN ITEM ON ITEM.ITEM_NUM = ORDER_LINE.ITEM_NUM 
WHERE ITEM.DESCRIPTION = 'Fire Engine'
or CUSTOMER.CUSTOMER_NAME = 'Almondton General Store'


--select LastName, FirstName, LoginID, JobTitle, BirthDate  from HumanResources.Employee, Person.Person
--order by LastName, FirstName



