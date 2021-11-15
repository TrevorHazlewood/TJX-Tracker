DROP DATABASE IF EXISTS Stores_Selling;
CREATE DATABASE Stores_Selling;
USE Stores_Selling;
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(customer_id int(10) NOT NULL AUTO_INCREMENT,
					  first_name varchar(25),
					  middle_name varchar(25),
                      last_name varchar(25),
					  phone_country_code int(3),
					  phone bigint(11),
                      email varchar(30),
                      customer_notes varchar(200),
                      street varchar(50),
                      city varchar(30),
                      zip_code varchar(10),
                      country varchar(30),
					  PRIMARY KEY(customer_id)
					)ENGINE = InnoDB AUTO_INCREMENT = 0000000001 charset = utf8 ;
DROP TABLE IF EXISTS Products;
CREATE TABLE Products(product_id int(10) NOT NULL AUTO_INCREMENT,
                      product_sku char(8),
                      product_price float,
                      product_name varchar(25),
                      product_quantity int,
                      product_description varchar(100),
                      image_url varchar(250),
					  PRIMARY KEY(product_id)
                      )ENGINE = InnoDB AUTO_INCREMENT = 0000000001 charset = utf8;
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(order_id int(10) NOT NULL AUTO_INCREMENT,
                    customer_id int(10),
                    order_status int,
                    datetime_order_placed datetime,
                    total_order_price float,
                    order_notes varchar(100),
                    PRIMARY KEY(order_id),
					CONSTRAINT fk_cust FOREIGN KEY(customer_id)
						REFERENCES customers(customer_id)
)ENGINE = InnoDB AUTO_INCREMENT = 0000000001 charset = utf8;
DROP TABLE IF EXISTS Order_detail;
CREATE TABLE Order_detail(detail_id int(10) NOT NULL AUTO_INCREMENT,
						  order_id int(10),
						  product_id int(10),
                          quantity_purchased int,
                          CONSTRAINT fk_ords FOREIGN KEY(order_id)
							REFERENCES orders(order_id),
                          CONSTRAINT fk_prod FOREIGN KEY(product_id)
							REFERENCES products(product_id),
						  PRIMARY KEY(detail_id)
                          )ENGINE = InnoDB AUTO_INCREMENT = 0000000001 charset = utf8;


