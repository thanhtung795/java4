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
('abc123', N'Võ Thanh Tùng', 'tungvt@gmail.com', 1),
('def456', N'Lê Thị Hồng', 'honglt@example.com', 0),
('ghi789', N'Trần Minh Hoàng', 'hoangtm@example.com', 0),
('jkl012', N'Phạm Quang Huy', 'huyqp@example.com', 0),
('mno345', N'Nguyễn Thị Thu', 'thunt@example.com', 1),
('pqr678', N'Đỗ Văn Bình', 'binhdv@example.com', 1),
('stu901', N'Huỳnh Anh Khoa', 'khoaha@example.com', 0);

GO

-- Thêm dữ liệu mẫu vào bảng Users
INSERT INTO Users (Password, Fullname, Email, admin)
VALUES
('vwx234', N'Ngô Văn Anh', 'anhnv@example.com', 0),
('yz1234', N'Hoàng Thanh Sơn', 'sonht@example.com', 1),
('lmn890', N'Phan Hữu Phước', 'phuocph@example.com', 0),
('opq345', N'Trịnh Minh Tuấn', 'tuanmt@example.com', 0),
('rst678', N'Lê Vân Anh', 'vananhl@example.com', 0),
('uvw123', N'Nguyễn Hải Yến', 'yenhn@example.com', 1),
('abc901', N'Vũ Hồng Quân', 'quanhv@example.com', 1),
('def234', N'Trần Quang Minh', 'minhtq@example.com', 0),
('ghi567', N'Phạm Thanh Bình', 'binhpt@example.com', 0),
('jkl890', N'Nguyễn Quốc Bảo', 'baoquoc@example.com', 1);

GO

select * from Users where admin = 0

