create or alter view dbo.vw_SKUPrice
as
select
	  ID
	 ,Name
	 ,Code
	 ,dbo.udf_GetSKUPrice(ID) as price
from dbo.SKU
