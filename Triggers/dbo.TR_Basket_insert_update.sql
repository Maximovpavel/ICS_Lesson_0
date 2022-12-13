create or alter trigger dbo.TR_Basket_insert_update
on dbo.Basket
after insert as
begin
	update dbo.Basket
	set DiscountValue = Value * 5 / 100
	from dbo.Basket
	where ID_SKU in (
		select ID_SKU from inserted group by ID_SKU having count(ID_SKU) >= 2
	) and ID in (
		select ID from inserted
	)

	update dbo.Basket
	set DiscountValue = 0
	from dbo.Basket
	where ID_SKU in (
		select ID_SKU from inserted group by ID_SKU having count(ID_SKU) < 2
	) and ID in (
		select ID from inserted
	)
end;
