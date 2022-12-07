if object_id('dbo.usp_MakeFamilyPurchase') is not null drop procedure dbo.usp_MakeFamilyPurchase;
go

create procedure dbo.usp_MakeFamilyPurchase
(
 @FamilySurName varchar(255)
)
as
if (select ID from dbo.Family where FamilySurName = @FamilySurName) is null
	print 'Такой семьи нет'
else begin
	update dbo.Family
		set BudgetValue -= (select sum(Value) from dbo.Basket)
		from dbo.Family
		where FamilySurName = @FamilySurName
end;
go
