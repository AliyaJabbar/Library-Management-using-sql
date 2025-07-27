
create DATABASE librarydata;

-- Use the database


-- Drop tables if needed (run in reverse order of dependencies)
DROP TABLE IF EXISTS return_status;
DROP TABLE IF EXISTS issued_status;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS branches;

-- Create branches
CREATE TABLE branches(
    branch_id VARCHAR(10) PRIMARY KEY,
    manager_id VARCHAR(10),
    branch_address VARCHAR(30),
    contact_no VARCHAR(15)
);

-- Insert into branches
INSERT INTO branches(branch_id, manager_id, branch_address, contact_no) VALUES
('B001', 'E001', 'Central City', '9876543210'),
('B002', 'E002', 'North Zone', '9123456789');

-- Create employees
CREATE TABLE employees(
    emp_id VARCHAR(10) PRIMARY KEY,
    emp_name VARCHAR(30),
    salary DECIMAL(10,2),
    branch_id VARCHAR(10),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

-- Insert into employees
INSERT INTO employees(emp_id, emp_name, salary, branch_id) VALUES
('E001', 'Anjali Menon', 35000.00, 'B001'),
('E002', 'Ramesh Iyer', 30000.00, 'B002');

-- Create members
CREATE TABLE members(
    member_id VARCHAR(10) PRIMARY KEY,
    member_name VARCHAR(30),
    member_address VARCHAR(30),
    reg_date DATE
);

-- Insert into members
INSERT INTO members(member_id, member_name, member_address, reg_date) VALUES
('M001', 'Rahul Varma', 'Kochi', '2024-04-12'),
('M002', 'Sneha Rao', 'Chennai', '2024-05-01');

-- Create books
CREATE TABLE books(
    isbn VARCHAR(50) PRIMARY KEY,
    book_title VARCHAR(80),
    category VARCHAR(30),
    rental_price DECIMAL(10,2),
    status VARCHAR(10),
    author VARCHAR(30),
    publisher VARCHAR(30)
);

-- Insert into books
INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher) VALUES
('978-0-12345-678-9', '1984', 'Dystopian', 5.50, 'yes', 'George Orwell', 'Secker & Warburg'),
('978-0-98765-432-1', 'The Great Gatsby', 'Classic', 4.75, 'no', 'F. Scott Fitzgerald', 'Charles Scribner Sons'),
('978-1-25013-372-6', 'The Silent Patient', 'Thriller', 7.00, 'yes', 'Alex Michaelides', 'Celadon Books'),
('978-1-4028-9462-6', 'Pride and Prejudice', 'Romance', 5.00, 'no', 'Jane Austen', 'T. Egerton'),
('978-0-7432-7356-5', 'Angels & Demons', 'Mystery', 6.50, 'yes', 'Dan Brown', 'Pocket Books'),
('978-0-7432-7357-2', 'The Da Vinci Code', 'Mystery', 7.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-316-76948-0', 'The Midnight Library', 'Fiction', 6.25, 'no', 'Matt Haig', 'Canongate Books'),
('978-0-553-21311-7', 'A Brief History of Time', 'Science', 8.00, 'yes', 'Stephen Hawking', 'Bantam Books'),
('978-1-5011-9807-8', 'Where the Crawdads Sing', 'Fiction', 6.75, 'yes', 'Delia Owens', 'G.P. Putnam Sons'),
('978-0-141-03435-8', 'Brave New World', 'Dystopian', 5.20, 'no', 'Aldous Huxley', 'Chatto & Windus');

-- Create issued_status
CREATE TABLE issued_status(
    issued_id VARCHAR(10) PRIMARY KEY,
    issued_member_id VARCHAR(30),
    issued_book_name VARCHAR(80),
    issued_date DATE,
    issued_emp_id VARCHAR(10), 
    issued_book_isbn VARCHAR(50),
    FOREIGN KEY (issued_member_id) REFERENCES members(member_id),
    FOREIGN KEY (issued_emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (issued_book_isbn) REFERENCES books(isbn)
);

-- Insert into issued_status
INSERT INTO issued_status(issued_id, issued_member_id, issued_book_name, issued_date, issued_emp_id, issued_book_isbn) VALUES
('IS121', 'M001', '1984', '2024-06-01', 'E001', '978-0-12345-678-9'),
('IS122', 'M002', 'The Silent Patient', '2024-06-10', 'E002', '978-1-25013-372-6');

-- Create return_status
CREATE TABLE return_status(
    return_id VARCHAR(10) PRIMARY KEY,
    issued_id VARCHAR(30),
    return_book_name VARCHAR(80),
    return_date DATE,
    return_book_isbn VARCHAR(50),
    FOREIGN KEY (return_book_isbn) REFERENCES books(isbn)
);

-- Insert into return_status
INSERT INTO return_status(return_id, issued_id, return_book_name, return_date, return_book_isbn) VALUES
('R001', 'IS121', '1984', '2024-06-20', '978-0-12345-678-9');
