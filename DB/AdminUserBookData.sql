INSERT INTO [Admin] ([adminFName], [adminLName], [adminPassword], [adminName])
VALUES ('Cuong', 'Nguyen', 'cuong', 'cuong');

INSERT INTO [Admin] ([adminFName], [adminLName], [adminPassword], [adminName])
VALUES ('Khoa', 'Le', 'khoa', 'khoa');

INSERT INTO [Admin] ([adminFName], [adminLName], [adminPassword], [adminName])
VALUES ('Huy', 'Pham', 'huy', 'huy');

INSERT INTO [Admin] ([adminFName], [adminLName], [adminPassword], [adminName])
VALUES ('Hoang', 'Nguyen', 'hoang', 'hoang');
INSERT INTO [Users] ([userFName], [userLName], [userEmail], [userContact], [username], [userPassword], [adminID])
VALUES ('Cuong', 'Nguyen', 'cuongnguyen@example.com', '0898876512', 'cuong', 'cuong', 1);

INSERT INTO [Users] ([userFName], [userLName], [userEmail], [userContact], [username], [userPassword], [adminID])
VALUES ('Khoa', 'Le', 'khoale@example.com', '0909123456', 'khoa', 'khoa', 1);

INSERT INTO [Users] ([userFName], [userLName], [userEmail], [userContact], [username], [userPassword], [adminID])
VALUES ('Huy', 'Pham', 'huypham@example.com', '0898987654', 'huy', 'huy', 2);

INSERT INTO [Users] ([userFName], [userLName], [userEmail], [userContact], [username], [userPassword], [adminID])
VALUES ('Hoang', 'Nguyen', 'hoangnguyen@example.com', '0909987654', 'hoang', 'hoang', 2);

INSERT INTO [Users] ([userFName], [userLName], [userEmail], [userContact], [username], [userPassword], [adminID])
VALUES ('Nguyen', 'Vo', 'nguyenvo@example.com', '0123456789', 'nguyen', 'nguyen', 3);

INSERT INTO [Users] ([userFName], [userLName], [userEmail], [userContact], [username], [userPassword], [adminID])
VALUES ('Dung', 'Huynh', 'dunghuynh@example.com', '0898654321', 'dung', 'dung', 4);
INSERT INTO [Books] ([bookName], [bookAuthor], [bookType], [bookLanguage], [bookIMG])
VALUES ('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 'English', NULL);

INSERT INTO [Books] ([bookName], [bookAuthor], [bookType], [bookLanguage],  [bookIMG])
VALUES ('1984', 'George Orwell', 'Dystopian', 'English',  NULL);

INSERT INTO [Books] ([bookName], [bookAuthor], [bookType], [bookLanguage],  [bookIMG])
VALUES ('Pride and Prejudice', 'Jane Austen', 'Romance', 'English', NULL);

INSERT INTO [Books] ([bookName], [bookAuthor], [bookType], [bookLanguage],  [bookIMG])
VALUES ('The Catcher in the Rye', 'J.D. Salinger', 'Coming-of-age', 'English',  NULL);

INSERT INTO [Books] ([bookName], [bookAuthor], [bookType], [bookLanguage],  [bookIMG])
VALUES ('The Great Gatsby', 'F. Scott Fitzgerald', 'Literary fiction', 'English',  NULL);

INSERT INTO [Books] ([bookName], [bookAuthor], [bookType], [bookLanguage],  [bookIMG])
VALUES ('Nhat Ky Trong Tu', 'Ho Chi Minh', 'Autobiography', 'Vietnamese', NULL);

INSERT INTO [Books] ([bookName], [bookAuthor], [bookType], [bookLanguage],  [bookIMG])
VALUES ('De Men Phieu Luu Ky', 'To Hoai', 'Novel', 'Vietnamese',  NULL);

INSERT INTO [Books] ([bookName], [bookAuthor], [bookType], [bookLanguage], [bookIMG])
VALUES ('So Do', 'Vu Trong Phung', 'Novel', 'Vietnamese', NULL);

INSERT INTO [Books] ([bookName], [bookAuthor], [bookType], [bookLanguage],  [bookIMG])
VALUES ('Truyen Kieu', 'Nguyen Du', 'Poem', 'Vietnamese', NULL);

INSERT INTO [Books] ([bookName], [bookAuthor], [bookType], [bookLanguage], [bookIMG])
VALUES ('Mien Tay', 'To Hoai', 'Novel', 'Vietnamese', NULL);

INSERT INTO [Books] ([bookName], [bookAuthor], [bookType], [bookLanguage],  [bookIMG])
VALUES ('Ba nguoi khac', 'To Hoai', 'Novel', 'Vietnamese',  NULL);
