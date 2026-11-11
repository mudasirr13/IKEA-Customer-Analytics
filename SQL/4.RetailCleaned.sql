--duplicates and produce final cleaned table
with Deduped as(
select *,
ROW_NUMBER() over(
  partition by Invoice,StockCode,Description,Quantity,InvoiceDate,Price,Customer_ID,Country
  order by (select null)
) as RowNum
from dbo.RetailCombined
)

Select Invoice,StockCode,Description,
     Quantity,InvoiceDate,Price,Customer_ID,Country,SourceSheet 
     into dbo.RetailCleaned
     from Deduped
     where RowNum =1

select * from dbo.RetailCleaned