-- Sử dụng cơ sở dữ liệu master
USE master
GO

-- Xóa cơ sở dữ liệu PolyOELab6 nếu nó đã tồn tại
DROP DATABASE IF EXISTS PolyOELab6
GO

-- Tạo cơ sở dữ liệu PolyOELab6
CREATE DATABASE PolyOELab6
GO

-- Sử dụng cơ sở dữ liệu PolyOELab6
USE PolyOELab6
GO

-- Tạo bảng Users
CREATE TABLE Users
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Password VARCHAR(50),
    Fullname NVARCHAR(50),
    Email VARCHAR(200),
    admin BIT
)
GO
create table Videos
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Title nvarchar (maX),
	Poster nvarchar (50),
	Description nvarchar (max),
	Active bit,
	Views int
)
go
create table Favorites
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Id_Video int not null,
	Id_User int not null,
	LikeDate date 
)
go

ALTER TABLE Favorites
ADD CONSTRAINT fk_Favorites
FOREIGN KEY (Id_Video) REFERENCES Videos(Id);
go


ALTER TABLE Favorites
ADD CONSTRAINT fk_Users
FOREIGN KEY (Id_User) REFERENCES Users(Id);
go



 -- Dữ liệu mẫu cho bảng Users
INSERT INTO Users (Password, Fullname, Email, admin) VALUES
('password123', N'Võ Thanh Tùng', 'nguyenvana@example.com', 1),
('password123', N'Vũ Đăng Quang', 'nguyenvana@example.com', 0),
('password123', N'Bùi Minh Quang', 'nguyenvana@example.com', 0),
('password123', 'John Doe', 'john.doe@example.com', 1),
('securepass', 'Jane Smith', 'jane.smith@example.com', 0),
('mypassword', 'Alice Johnson', 'alice.johnson@example.com', 0),
('pass2024', 'Bob Brown', 'bob.brown@example.com', 0),
('letmein', 'Charlie White', 'charlie.white@example.com', 1),
('admin123', 'David Black', 'david.black@example.com', 1),
('user2024', 'Eve Green', 'eve.green@example.com', 0),
('qwerty', 'Frank Blue', 'frank.blue@example.com', 0),
('123456', 'Grace Pink', 'grace.pink@example.com', 0),
('abcdef', 'Hank Purple', 'hank.purple@example.com', 0);

-- Dữ liệu mẫu cho bảng Videos
INSERT INTO Videos (Title, Poster, Description, Active, Views) VALUES
('Learning Java', 'poster1.jpg', 'This is the first video description', 1, 100),
('Understanding Servlets', 'poster2.jpg', 'This is the second video description', 1, 250),
('Advanced Java Programming', 'poster3.jpg', 'This is the third video description', 0, 75),
('Java and Databases', 'poster4.jpg', 'This is the fourth video description', 1, 150),
('Java Web Applications', 'poster5.jpg', 'This is the fifth video description', 1, 300),
('Java Web Applications', 'poster6.jpg', 'This is the sixth video description', 0, 50),
('Spring Framework Basics', 'poster7.jpg', 'This is the seventh video description', 1, 90),
('Hibernate ORM', 'poster8.jpg', 'This is the eighth video description', 1, 200),
('RESTful Web Services', 'poster9.jpg', 'This is the ninth video description', 0, 30),
('Microservices with Spring Boot', 'poster10.jpg', 'This is the tenth video description', 1, 400);

-- Dữ liệu mẫu thêm cho bảng Videos
INSERT INTO Videos (Title, Poster, Description, Active, Views) VALUES
('Introduction to Algorithms', 'poster11.jpg', 'This video covers the basics of algorithms.', 1, 220),
('Data Structures in Depth', 'poster12.jpg', 'An in-depth look at various data structures.', 1, 180),
('Design Patterns Explained', 'poster13.jpg', 'Learn about common design patterns in software development.', 1, 260),
('Machine Learning Basics', 'poster14.jpg', 'Introduction to machine learning concepts.', 1, 320),
('Deep Learning with TensorFlow', 'poster15.jpg', 'A guide to deep learning using TensorFlow.', 1, 290),
('Java Concurrency', 'poster16.jpg', 'Understanding concurrency in Java applications.', 1, 140),
('Java Stream API', 'poster17.jpg', 'Mastering the Stream API in Java.', 1, 230),
('Java Memory Management', 'poster18.jpg', 'A look at how memory is managed in Java.', 1, 160),
('Spring Boot for Beginners', 'poster19.jpg', 'Getting started with Spring Boot.', 1, 300),
('Building REST APIs with Spring', 'poster20.jpg', 'Learn to build RESTful APIs with Spring Framework.', 1, 410);


-- Dữ liệu mẫu cho bảng Favorites với 10 dòng chia đều từ 2021-2024
INSERT INTO Favorites (Id_Video, Id_User, LikeDate) VALUES
(1, 2, '2021-01-15'),
(2, 2, '2021-02-20'),
(3, 2, '2021-03-25'),
(4, 2, '2021-04-10'),
(5, 2, '2021-05-18'),
(6, 2, '2021-06-22'),
(8, 2, '2021-07-19'),
(9, 2, '2021-08-23'),
(1, 2, '2021-09-15'),
(2, 3, '2021-10-30'),
(3, 1, '2022-01-05'),
(7, 2, '2022-02-10'),
(2, 3, '2022-03-12'),
(6, 4, '2022-04-18'),
(9, 5, '2022-05-07'),
(1, 6, '2022-06-14'),
(4, 7, '2022-07-04'),
(5, 8, '2022-08-23'),
(8, 9, '2022-09-05'),
(10, 1, '2022-10-20'),
(7, 2, '2023-01-13'),
(6, 3, '2023-02-27'),
(5, 4, '2023-03-06'),
(3, 5, '2023-04-15'),
(9, 6, '2023-05-04'),
(8, 7, '2023-06-17'),
(2, 8, '2023-07-09'),
(10, 9, '2023-08-25'),
(1, 1, '2023-09-01'),
(4, 2, '2023-10-19'),
(1, 2, '2024-01-15'),
(2, 2, '2024-01-15'),
(3, 2, '2024-01-15'),
(4, 2, '2024-02-15'),
(5, 2, '2024-02-15'),
(6, 2, '2024-02-15'),
(8, 2, '2024-03-15'),
(9, 2, '2024-03-15'),
(1, 2, '2024-03-15'),
(2, 3, '2024-04-15'),
(2, 4, '2024-04-15'),
(2, 5, '2024-04-15'),
(2, 6, '2024-05-15'),
(2, 7, '2024-05-15'),
(2, 8, '2024-05-15'),
(2, 9, '2024-06-15'),
(4, 1, '2024-06-15'),
(4, 2, '2024-06-15'),
(1, 1, '2024-07-01'),
(2, 2, '2024-07-15'),
(3, 1, '2024-07-20'),
(1, 3, '2024-08-22'),
(4, 4, '2024-08-25'),
(5, 5, '2024-08-26'),
(6, 6, '2024-08-27'),
(7, 7, '2024-09-28'),
(5, 8, '2024-09-29'),
(4, 9, '2024-09-30'),
(3, 8, '2024-10-29'),
(2, 8, '2024-10-29'),
(1, 8, '2024-10-29');
go

CREATE OR ALTER PROCEDURE spFavoriteByYear
    @Year INT
AS
BEGIN
    SELECT
        v.Title AS 'Group',
        COUNT(f.Id) AS 'Likes',
        MAX(f.LikeDate) AS 'Newest',
        MIN(f.LikeDate) AS 'Oldest'
    FROM Favorites f 
    JOIN Videos v ON v.Id = f.Id_Video  
    WHERE YEAR(f.LikeDate) = @Year
    GROUP BY v.Title
END;


select * from Favorites where YEAR(LikeDate)  = 2023
exec spFavoriteByYear 2024

