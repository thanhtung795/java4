create database PolyOE
use PolyOE
go
create table Users
(
	id INT IDENTITY(1,1) PRIMARY KEY,
	Password varchar(50),
	Fullname  nvarchar (50),
	Email varchar(200),
	admin bit 
)