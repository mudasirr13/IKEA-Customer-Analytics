--Missing customer id
select COUNT(*) as missingCustomer_id from dbo.RetailCombined
where Customer_ID is null

--Negative or zero Quantity
select * from dbo.RetailCombined
where Quantity <=0

-- Missing Desciption
select * from dbo.RetailCombined
where description is null 

--Exact Duplicates Rows
select Invoice,StockCode,Description,InvoiceDate,Price,Customer_ID,Country,
COUNT(*) as ExactDuplicates
from dbo.RetailCombined
group by Invoice,StockCode,Description,InvoiceDate,Price,Customer_ID,Country
having COUNT(*)>1