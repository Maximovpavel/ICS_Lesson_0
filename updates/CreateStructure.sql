-- Создание таблицы "dbo.SKU"
if object_id('dbo.SKU') is null
begin
	create table dbo.SKU (ID int not null identity (1,1))
	alter table dbo.SKU add constraint PK_SKU primary key (ID)
	alter table dbo.SKU add Name varchar(100) not null
	alter table dbo.SKU add Code as concat('s', ID)
end

-- Создание таблицы "dbo.Basket"
if object_id('dbo.Basket') is null
begin
	create table dbo.Basket (ID int not null identity (1,1))
	alter table dbo.Basket add constraint PK_Basket primary key (ID)
	alter table dbo.Basket add ID_SKU int not null
	alter table dbo.Basket add constraint FK_Basket_ID_SKU foreign key (ID_SKU) references dbo.SKU(ID)
	alter table dbo.Basket add Quantity int not null
	alter table dbo.Basket add Value decimal not null
	alter table dbo.Basket add constraint CHK_Basket_Quantity_Value check (Quantity > 0 AND Value > 0)
	alter table dbo.Basket add PurchaseDate date not null
	alter table dbo.Basket add constraint DF_Basket_PurchaseDate default getdate() for PurchaseDate
	alter table dbo.Basket add DiscountValue decimal null
end

-- Создание таблицы "dbo.Family"
if object_id('dbo.Family') is null
begin
	create table dbo.Family (ID int not null identity (1,1))
	alter table dbo.Family add constraint PK_Family primary key (ID)
	alter table dbo.Family add FamilySurName varchar(100) not null
	alter table dbo.Family add BudgetValue decimal not null
end
