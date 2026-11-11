select * from dbo.[year2009-2010]
select * from dbo.[year2010-2011]

--combine both years and convert types safely

select Invoice,
StockCode,
Description,
Quantity ,
coalesce(
TRY_CONVERT(DATETIME2,InvoiceDate,120),
TRY_CONVERT(DATETIME2,InvoiceDate,105)) as InvoiceDate,
TRY_CONVERT(decimal(10,2),Price) as Price,
Customer_ID,Country,'2009-2010' as SourceSheet
into dbo.RetailCombined
from dbo.[year2009-2010]

union all
select Invoice,
StockCode,
Description,
Quantity ,
coalesce(
TRY_CONVERT(DATETIME2,InvoiceDate,120),
TRY_CONVERT(DATETIME2,InvoiceDate,105)) as InvoiceDate,
TRY_CONVERT(decimal(10,2),Price) as Price,
Customer_ID,Country,'2010-2011' as SourceSheet
from dbo.[year2010-2011]