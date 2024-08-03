-- Sử dụng cơ sở dữ liệu master
USE master
GO

-- Xóa cơ sở dữ liệu PolyOE nếu nó đã tồn tại
DROP DATABASE IF EXISTS PolyOE
GO

-- Tạo cơ sở dữ liệu PolyOE
CREATE DATABASE PolyOE
GO

-- Sử dụng cơ sở dữ liệu PolyOE
USE PolyOE
GO

-- Tạo bảng Users
CREATE TABLE Users
(
    id INT IDENTITY(1,1) PRIMARY KEY,
    Password VARCHAR(50),
    Fullname NVARCHAR(50),
    Email VARCHAR(200),
    admin BIT
)
GO

-- Thêm dữ liệu mẫu vào bảng Users
INSERT INTO Users (Password, Fullname, Email, admin)
VALUES
('password123', N'Nguyễn Văn A', 'nguyenvana@example.com', 1),
('password123', N'Nguyễn Văn b', 'nguyenvana@example.com', 0),
('password123', N'Nguyễn Văn c', 'nguyenvana@example.com', 0),
('password123', N'Nguyễn Văn d', 'nguyenvana@example.com', 0),
('password123', N'Nguyễn Văn e', 'nguyenvana@example.com', 0),
('password123', N'Nguyễn Văn f', 'nguyenvana@example.com', 1),
('password123', N'Nguyễn Văn g', 'nguyenvana@example.com', 1)
GO


-- Thêm dữ liệu mẫu vào bảng Users
INSERT INTO Users (Password, Fullname, Email, admin)
VALUES
('123', N'Võ Thanh Tùng', 'tungvt@gmail.com', 1)

select * from Users