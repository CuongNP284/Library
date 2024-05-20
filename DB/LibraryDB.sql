CREATE TABLE [Admin] (
  [adminID] int PRIMARY KEY IDENTITY(1, 1),
  [adminFName] varchar(20),
  [adminLName] varchar(20),
  [adminPassword] varchar(20),
  [adminName] varchar(20)
);
GO

CREATE TABLE [Users] (
  [userID] int PRIMARY KEY IDENTITY(1, 1),
  [userFName] varchar(20) NOT NULL,
  [userLName] varchar(20) NOT NULL,
  [userEmail] varchar(50) UNIQUE NOT NULL,
  [userContact] varchar(10) UNIQUE NOT NULL,
  [username] varchar(20) NOT NULL,
  [userPassword] varchar(20) NOT NULL,
  [adminID] int,
  FOREIGN KEY ([adminID]) REFERENCES [Admin] ([adminID])
);
GO

CREATE TABLE [Books] (
  [bookID] int PRIMARY KEY IDENTITY(1, 1),
  [bookName] varchar(30) NOT NULL,
  [bookAuthor] varchar(50),
  [bookType] varchar(30),
  [bookLanguage] varchar(30),
  [bookIMG] image,
  [userID] int,
  [borrowedStatus] varchar(10) , 
  FOREIGN KEY ([userID]) REFERENCES [Users] ([userID]),
);
GO




CREATE TABLE [DonateOrders] (
  [dntID] int PRIMARY KEY IDENTITY(1, 1),
  [userID] int,
  [bookName] varchar(100),
  [bookAuthor] varchar(100),
  [bookLanguage] varchar(100),
  [created_date] varchar(100),
  [status] varchar(10),
  FOREIGN KEY ([userID]) REFERENCES [Users] ([userID])
);
