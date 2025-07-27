# Library-Management-using-sql 
## Project Overview 
Project Title: Library Management System
An  Intermediate level project

This project demonstrates the implementation of a Library Management System using SQL. It includes creating and managing tables, performing CRUD operations, and executing advanced SQL queries. The goal is to showcase skills in database design, manipulation, and querying. 
Set up the Library Management System Database: Create and populate the database with tables for branches, employees, members, books, issued status, and return status.
CRUD Operations: Perform Create, Read, Update, and Delete operations on the data.
CTAS (Create Table As Select): Utilize CTAS to create new tables based on query results.
Advanced SQL Queries: Develop complex queries to analyze and retrieve specific data. 
## Project Structure 
create database librarydata;
--drop table if exists branch;
CREATE TABLE branches(
branch_id varchar(10) primary key,
manager_id varchar (10),
branch_address varchar(30),
contact_no varchar(15)
);

--create tabe "Employee"
--drop table if exists employees;
create table employees(
emp_id varchar(10) primary key,
emp_name varchar(30),salary decimal(10,2),
branch_id varchar(10),
foreign key (branch_id) references branches(branch_id)
);  
--create table "Members"
--drop table if exists  members;
create table members(
 member_id varchar(10) primary key,
 member_name varchar(30),
 member_address varchar(30),
 reg_date DATE);


 --CREATE TABLE "BOOKS"
-- DROP TABLE IF EXISTS books;
 create table books(
isbn varchar(50) primary key,
book_title varchar(80),
category  varchar(30),
rental_price decimal(10,2),
status varchar(10),
author varchar(30),
publisher varchar(30)); 
--create table "issuestatus"
-- drop table if exists issued_status;

 create table issued_status(
issued_id varchar(10) primary key,
issued_member_id varchar(30),
issued_book_name varchar(80),
issued_date DATE,issued_emp_id VARCHAR(10), 
issued_book_isbn varchar(10),
FOREIGN KEY (ISSUED_MEMBER_ID) REFERENCES MEMBERS(member_id),
foreign key(issued_emp_id) references employees(emp_id),
foreign key(issued_book_isbn) references books(isbn)
);
--create table "returnstatus"
--drop table if exists return_status;
create table return_status(
return_id varchar(10) primary key,
issued_id varchar(30),
return_book_name varchar(80),
return_date date,
return_book_isbn varchar(50),
foreign key (return_book_isbn) references books(isbn)); 
# 2. CRUD Operations
Create: Inserted sample records into the books table.
Read: Retrieved and displayed data from various tables.
Update: Updated records in the employees table.
Delete: Removed records from the members table as needed.
Task 1. Create a New  Records each tables

INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher)
VALUES 
('978-0-12345-678-9', '1984', 'Dystopian', 5.50, 'yes', 'George Orwell', 'Secker & Warburg'),
('978-0-98765-432-1', 'The Great Gatsby', 'Classic', 4.75, 'no', 'F. Scott Fitzgerald', 'Charles ScribnerSons'),
('978-1-25013-372-6', 'The Silent Patient', 'Thriller', 7.00, 'yes', 'Alex Michaelides', 'Celadon Books'),
('978-1-4028-9462-6', 'Pride and Prejudice', 'Romance', 5.00, 'no', 'Jane Austen', 'T. Egerton'),
('978-0-7432-7356-5', 'Angels & Demons', 'Mystery', 6.50, 'yes', 'Dan Brown', 'Pocket Books'),
('978-0-7432-7357-2', 'The Da Vinci Code', 'Mystery', 7.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-316-76948-0', 'The Midnight Library', 'Fiction', 6.25, 'no', 'Matt Haig', 'Canongate Books'),
('978-0-553-21311-7', 'A Brief History of Time', 'Science', 8.00, 'yes', 'Stephen Hawking', 'Bantam Books'),
('978-1-5011-9807-8', 'Where the Crawdads Sing', 'Fiction', 6.75, 'yes', 'Delia Owens', 'G.P. Putnam Sons'),
('978-0-141-03435-8', 'Brave New World', 'Dystopian', 5.20, 'no', 'Aldous Huxley', 'Chatto & Windus'); 
select * from books limit 1; 
update books set book_title='Dynasty'  where isbn='978-0-12345-678-9';
--delete a record from issued status table
delete from issued_status where issued_id='IS121'; 
INSERT INTO branches(branch_id, manager_id, branch_address, contact_no) VALUES
('B001', 'E001', 'Central City', '9876543210'),
('B002', 'E002', 'North Zone', '9123456789');
INSERT INTO employees(emp_id, emp_name, salary, branch_id) VALUES
('E001', 'Anjali Menon', 35000.00, 'B001'),
('E002', 'Ramesh Iyer', 30000.00, 'B002');
-- Insert into members
INSERT INTO members(member_id, member_name, member_address, reg_date) VALUES
('M001', 'Rahul Varma', 'Kochi', '2024-04-12'),
('M002', 'Sneha Rao', 'Chennai', '2024-05-01');

INSERT INTO issued_status(issued_id, issued_member_id, issued_book_name, issued_date, issued_emp_id, issued_book_isbn) VALUES
('IS121', 'M001', '1984', '2024-06-01', 'E001', '978-0-12345-678-9'),

('IS123','M002','1984','2024-07-01','E001','978-0-12345-678-9'),
('IS122', 'M002', 'The Silent Patient', '2024-06-10', 'E002', '978-1-25013-372-6');
INSERT INTO issued_status(issued_id, issued_member_id, issued_book_name, issued_date, issued_emp_id, issued_book_isbn) VALUES

('IS123','M002','1984','2024-07-01','E001','978-0-12345-678-9');
-- Insert into return_status
INSERT INTO return_status(return_id, issued_id, return_book_name, return_date, return_book_isbn) VALUES
('R001', 'IS121', '1984', '2024-06-20', '978-0-12345-678-9'); 
