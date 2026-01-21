CREATE DATABASE final;
use final;
CREATE TABLE Readers (
	reader_id int AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(11),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Membership_Details (
	card_number VARCHAR(255) PRIMARY KEY,
    reader_id INT UNIQUE,
    rank_menber varchar(255),
    expiry_date DATETIME,
    citizen_id VARCHAR(20),
    FOREIGN KEY (reader_id) REFERENCES Readers(reader_id)
);
CREATE TABLE Categories(
	category_id int AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255),
    description TEXT
);
CREATE TABLE Books (
	book_id int AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    category_id int,
    price DOUBLE,
    stock_quantity int,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
CREATE TABLE Loan_Records (
	loan_id VARCHAR(255) PRIMARY KEY,
    reader_id int,
    book_id int,
    borrow_date DATETIME,
    due_date DATETIME,
    return_date DATETIME,
	FOREIGN KEY (reader_id) REFERENCES Readers(reader_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Readers (full_name, email, phone_number, created_at) VALUES
('Nguyen Van A','anv@gmail.com','901234567','2022-1-15'),
('Tran Thi B','btt@gmail.com','912345678','2022-5-20'),
('Le Van C','cle@yahoo.com','922334455','2023-2-10'),
('Pham Minh D','dpham@hotmail.com','933445566','2023-5-11'),
('Hoang Anh E','ehoang@gmail.com','944556677','2024-1-12');

INSERT INTO Membership_Details(card_number, reader_id, rank_menber, expiry_date, citizen_id) VALUES
('CARD-001','1','Standard','2022-1-15','123456789'),
('CARD-002','2','VIP','2022-5-20','234567890'),
('CARD-003','3','Standard','2023-2-10','345678901'),
('CARD-004','4','VIP','2023-5-11','456789012'),
('CARD-005','5','Standard','2024-1-12','567890123');

INSERT INTO Categories(category_name, description) VALUES
('IT','Sách về công nghệ thông tin và lập trình'),
('Kinh Te','Sách kinh doanh, tài chính, khởi nghiệp'),
('Van Hoc','Tiểu thuyết, truyện ngắn, thơ'),
('Ngoai Ngu','Sách học tiếng Anh, Nhật, Hàn'),
('Lich Su','Sách nghiên cứu lịch sử, văn hóa');

INSERT INTO Books(title, author, category_id, price, stock_quantity) VALUES
('Clean Code','Robert C. Martin','1','450000','10'),
('Dac Nhan Tam','Dale Carnegie','2','150000','50'),
('Harry Potter 1','J.K. Rowling','3','250000','5'),
('IELTS Reading','Cambridge','4','180000','0'),
('Dai Viet Su Ky','Le Van Huu','5','300000','20');

INSERT INTO Loan_Records(loan_id, reader_id, book_id, borrow_date, due_date, return_date) VALUES
('101','1','1','2023-11-15','2023-11-22','2023-11-20'),
('102','2','2','2023-12-1','2023-8-12','2023-5-12'),
('103','1','3','2023-5-20','2024-1-17',''),
('104','3','4','2023-5-20','2023-5-27',''),
('105','4','1','2024-1-18','2024-1-25','');
/*phan 2 cau1*/
select book_id, title, price
from books 
WHERE category_id = 1 AND price > 200000;
/*phan 2 cau3*/
SELECT book_id, title, price
from books
ORDER BY price DESC 
LIMIT 5 OFFSET 2;
/*phan 4 cau1*/
CREATE INDEX idx_loan_dates on Loan_Records(borrow_date, return_date);
/*phan 5 cau1*/
delimiter //
CREATE trigger trg_after_loan_insert
after INSERT on Loan_Records
for each row
BEGIN
	UPDATE stock_quantity from 
end//
delimiter ;
/*phan 6 cau1*/
delimiter //
CREATE PROCEDURE sp_check_availability (
 p_book_id int,
 out p_message VARCHAR(255)
)
begin
	if (SELECT stock_quantity from Books WHERE stock_quantity=0)THEN
		
end//
delimiter ;
