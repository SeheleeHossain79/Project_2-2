create database online_super_shop;
USE online_super_shop;
create table product (
product_id int not null,
product_name varchar(50),
product_status varchar(50),
 price int,
 product_quantity int,
production_date date,
Expire_date date,
supply_date datetime,
primary key(product_id)
);
 create table product_category(
 category_id  int not null,
 category_name varchar(30),
 primary key(category_id)
 );
 CREATE TABLE Admin (
    Admin_id INT PRIMARY KEY,
    Admin_name VARCHAR(100),
    Admin_role VARCHAR(50)
);
 CREATE TABLE Supplier (
    Supplier_id INT PRIMARY KEY ,
    Supplier_name VARCHAR(100),
    Supplier_address TEXT,
    Supplier_contact_no VARCHAR(15)
);
CREATE TABLE Customer (
    Cust_id INT PRIMARY KEY,
    Cust_name VARCHAR(100),
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Cust_cont_num VARCHAR(15),
    City VARCHAR(50),
    State VARCHAR(50),
    Pin_code VARCHAR(10)
);
CREATE TABLE Cart (
    Cart_id INT PRIMARY KEY,
    Cart_date DATE,
    Quantity INT,
    Cust_id INT,
    FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);
CREATE TABLE Place_order (
    Order_no INT PRIMARY KEY ,
    Order_date DATE,
    Order_amount DECIMAL(10,2),
    Cust_id INT,
    Cart_id INT,
    FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id),
    FOREIGN KEY (Cart_id) REFERENCES Cart(Cart_id)
);
CREATE TABLE Payment (
    Payment_id INT PRIMARY KEY ,
    Payment_date DATE,
    Payment_amount DECIMAL(10,2),
    Payment_method VARCHAR(50),
    Payment_status VARCHAR(50),
    Currency VARCHAR(10),
    Cust_id INT,
    FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);
CREATE TABLE Tracking_Details (
    Tracking_no INT PRIMARY KEY,
    Courier_name VARCHAR(100),
    Order_status VARCHAR(50),
    Delivery_date DATE,
    Order_no INT,
    FOREIGN KEY (Order_no) REFERENCES place_order(Order_no)
);
CREATE TABLE Review (
    Review_id INT PRIMARY KEY,
    Review_date DATE,
    Helpful_count INT,
    Product_id INT,
    Cust_id INT,
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id),
    FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);
CREATE TABLE Voucher (
    Voucher_id INT PRIMARY KEY,
    Voucher_code VARCHAR(50),
    Discount_amount DECIMAL(10,2),
    Start_date DATE,
    End_date DATE,
    Usage_limit INT,
    Min_purch_amount DECIMAL(10,2),
    Voucher_type VARCHAR(50),
    Is_active BOOLEAN
);
 CREATE TABLE Added_To (
    Product_id INT,
    Cart_id INT,
    PRIMARY KEY (Product_id, Cart_id),
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id),
    FOREIGN KEY (Cart_id) REFERENCES Cart(Cart_id)
);
CREATE TABLE Includes (
    Prouct_id INT,
    Voucher_id INT,
    PRIMARY KEY (Product_id, Voucher_id),
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id),
    FOREIGN KEY (Voucher_id) REFERENCES Voucher(Voucher_id)
);
CREATE TABLE Contains (
    Product_id INT,
    Order_id INT,
    PRIMARY KEY (Product_id, Order_id),
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id),
    FOREIGN KEY (Order_id) REFERENCES place_order(Order_no)
);
ALTER TABLE product 
ADD COLUMN Cart_id INT,
ADD CONSTRAINT fk_Cart
FOREIGN KEY (Cart_id) REFERENCES cart(cart_id);
Alter Table product
ADD COLUMN Supplier_id int,
ADD constraint fk_supplier
Foreign key (supplier_id) references supplier(supplier_id);

