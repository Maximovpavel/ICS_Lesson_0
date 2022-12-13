create or alter procedure dbo.usp_MakeFamilyPurchase
	@FamilySurName varchar(255)
as
begin
	if (select ID from dbo.Family where FamilySurName = @FamilySurName) is null
	raiserror ('Такой семьи нет', 3, 1)

	update dbo.Family
	set BudgetValue -= (select sum(Value) from dbo.Basket)
	where FamilySurName = @FamilySurName
end
go
