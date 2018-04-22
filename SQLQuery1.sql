create database TestDb
go
use Testdb
go
create table Countries
(
	CountryID int primary key identity(1,1),
	CountryName nvarchar(50) not null,
	PhoneCode nvarchar(24),
	CreatedDate datetime default(getdate())
)
go
create table Cities
(
	CityID int primary key identity(1,1),
	CityName nvarchar(50) not null,
	PhoneCode nvarchar(24) null,
	CreatedDate datetime default(getdate()),
	CountryID int foreign key references Countries(CountryID)
)
go
create table Districts
(
	DistrictID int primary key identity(1,1),
	DistrictName nvarchar(50) not null,
	PostalCode nvarchar(15),
	CreatedDate datetime default(getdate()),
	CityID int foreign key references Cities(CityID)
)
go
create table Towns
(
	TownID int primary key identity(1,1),
	TownName nvarchar(50) not null,
	CreatedDate datetime default(getdate()),
	DistrictID int foreign key references Districts(DistrictID)
)