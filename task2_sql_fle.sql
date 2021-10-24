USE ict701_s2_19_g_k088_task2;

CREATE TABLE customer(
cust_num INT(5) PRIMARY KEY AUTO_INCREMENT NOT NULL,
cust_name VARCHAR(50) NOT NULL,
cust_add VARCHAR(50) NOT NULL,
cust_email VARCHAR(50) NOT NULL,
cust_phone INT(10) NOT NULL,
balance DECIMAL(20,2));	

CREATE TABLE sales_rep(
sales_rep_id INT(6) PRIMARY KEY AUTO_INCREMENT NOT NULL,
sales_rep_name VARCHAR(20) NOT NULL,
sales_rep_phone VARCHAR(10) NOT NULL,
hire_date DATE NOT NULL,
salary INT(10) NOT NULL,
commission_rate INT(4) NOT NULL);

CREATE TABLE order_table(
order_num INT(5) PRIMARY KEY AUTO_INCREMENT NOT NULL, 
date_order DATE NOT NULL,
date_req DATE NOT NULL,
sales_rep_id INT(6) NOT NULL,
cust_num INT(5) NOT NULL,
method_del VARCHAR(15) NOT NULL, 
foreign key(cust_num) references customer(cust_num),
foreign key(sales_rep_id) references sales_rep(sales_rep_id));

CREATE TABLE item(
item_code INT(3) PRIMARY KEY AUTO_INCREMENT NOT NULL, 
item_des VARCHAR(35) NOT NULL,
suggested_retail DECIMAL(5,2) NOT NULL,
price DECIMAL(5,2) NOT NULL,
category VARCHAR(50) NOT NULL,
minimum_stock_level INT(10) NOT NULL,
stock_in_hand INT(10) NULL);

CREATE TABLE order_item(
order_num INT(5) NOT NULL,
item_code INT(3) NOT NULL,
qut INT(5) NOT NULL,
foreign key(order_num) references order_table(order_num),
foreign key(item_code) references item(item_code),
primary key(order_num,item_code));

CREATE TABLE invoice(
invoice_num INT(6) PRIMARY KEY AUTO_INCREMENT NOT NULL,
order_num INT(5) NOT NULL,
sales_rep_name VARCHAR(20) NOT NULL,
note VARCHAR(50) NULL,
foreign key(order_num) references order_table(order_num));

CREATE TABLE invoice_item(
item_code INT(3)  NOT NULL,
invoice_num INT(6) NOT NULL,
PRIMARY KEY(item_code,invoice_num),
foreign key(item_code) references item(item_code),
foreign key(invoice_num) references invoice(invoice_num));

CREATE TABLE payment(
payment_id INT(5) PRIMARY KEY AUTO_INCREMENT NOT NULL,
date_of_pay DATE NOT NULL,
invoice_num INT(6) NOT NULL,
amount INT(10),
cust_num INT(5) NOT NULL,
foreign key(cust_num) references customer(cust_num),
foreign key(invoice_num) references invoice(invoice_num));

CREATE TABLE delivery(
delivery_id INT(5) PRIMARY KEY AUTO_INCREMENT NOT NULL,
method_del VARCHAR(15) NOT NULL,
delivery_charges DECIMAL(5,2) NOT NULL);

INSERT INTO customer(cust_num,cust_name,cust_add,cust_email,cust_phone,balance) 
VALUES('10225',"Cottage Capers Local Store","12 Linkfield Rd, Mango Hill 4509","cottage123@gmail.com","123456789",641.5);

INSERT INTO customer(cust_num,cust_name,cust_add,cust_email,cust_phone,balance) 
VALUES('11331',"Tania's Toys","8 Avondale Street, Brisbane 4000","tania_toys123@gmail.com","456123789",199.4);

INSERT INTO customer(cust_num,cust_name,cust_add,cust_email,cust_phone,balance) 
VALUES('12009',"Kmart Flagstone","43 Dale Avenue, Flagstone 4280","kmart_flag123@gmail.com","456789123",1095);

INSERT INTO customer(cust_num,cust_name,cust_add,cust_email,cust_phone,balance) 
VALUES('12993',"McCains Dept Store","28 Lara Street, South Brisbane 4101","McCains123@gmail.com","789123789",0);

INSERT INTO customer(cust_num,cust_name,cust_add,cust_email,cust_phone,balance) 
VALUES('13810',"Magic Land","18 Waller Road, Ormeau 4208","magic_land123@gmail.com","456023709",755);

INSERT INTO sales_rep(sales_rep_id,sales_rep_name,sales_rep_phone,hire_date,salary,commission_rate)
VALUES(366542,"John Jones",234561788,'2015-01-29',45000,7);

INSERT INTO sales_rep(sales_rep_id,sales_rep_name,sales_rep_phone,hire_date,salary,commission_rate)
VALUES(229844,"Mark Jacobs",905647122,'2016/03/20',41000,6);

INSERT INTO sales_rep(sales_rep_id,sales_rep_name,sales_rep_phone,hire_date,salary,commission_rate)
VALUES(340900,"Mary Mee",234561799,'2018/06/15',49000,3);

INSERT INTO sales_rep(sales_rep_id,sales_rep_name,sales_rep_phone,hire_date,salary,commission_rate)
VALUES(229109,"Jane Smith",234561777,'2017/10/16',44000,4);

INSERT INTO sales_rep(sales_rep_id,sales_rep_name,sales_rep_phone,hire_date,salary,commission_rate)
VALUES(210567,"Steve Black",234561722,'2019/01/17',47000,3);

INSERT INTO item(item_code,item_des,suggested_retail,price,category,minimum_stock_level,stock_in_hand)
VALUES(104,"Patton War Kit",10.5,8,"Pretend",10,20);

INSERT INTO item(item_code,item_des,suggested_retail,price,category,minimum_stock_level,stock_in_hand)
VALUES(107,"Our Generation Doll",31.5,19,"Dolls",10,15);

INSERT INTO item(item_code,item_des,suggested_retail,price,category,minimum_stock_level,stock_in_hand)
VALUES (110,"Scrabble",29,15,"Puzzles and games",5,10);

INSERT INTO item(item_code,item_des,suggested_retail,price,category,minimum_stock_level,stock_in_hand)
VALUES (126,"Super Hero costume bundle",15.95,7.5,"Pretend",15,30);

INSERT INTO item(item_code,item_des,suggested_retail,price,category,minimum_stock_level,stock_in_hand)
VALUES (133,"Baby Alive - Judy",22,17,"Dolls",8,26);

INSERT INTO item(item_code,item_des,suggested_retail,price,category,minimum_stock_level,stock_in_hand)
VALUES (142,"Trail Chopper",25.99,16,"Remote ,control",10,17);

INSERT INTO item(item_code,item_des,suggested_retail,price,category,minimum_stock_level,stock_in_hand)
VALUES (177,"Giant Teddy Bear, Red and Brown",50,33,"Soft toys",5,8);

INSERT INTO item(item_code,item_des,suggested_retail,price,category,minimum_stock_level,stock_in_hand)
VALUES (180,"Dance mat",75,40,"Electronic",15,13);

INSERT INTO item(item_code,item_des,suggested_retail,price,category,minimum_stock_level,stock_in_hand)
VALUES (212,"Blue balance bike, 40inch",19.99,9,"Bikes and Ride ons",10,10);

INSERT INTO item(item_code,item_des,suggested_retail,price,category,minimum_stock_level,stock_in_hand)
VALUES (231,"Pink Tea Set (20 piece)",15,7,"Pretend",10,18);

INSERT INTO delivery(delivery_id,method_del,delivery_charges)
VALUE (1,"Air Mail",55);

INSERT INTO delivery(delivery_id,method_del,delivery_charges)
VALUE (2,"Regular Mail",15);

INSERT INTO delivery(delivery_id,method_del,delivery_charges)
VALUE (3,"Courier",25.5);

INSERT INTO delivery(delivery_id,method_del,delivery_charges)
VALUE (4,"Pick Up",0);

INSERT INTO order_table(order_num,date_order,date_req,method_del,sales_rep_id,cust_num)
VALUES(15209,'2019/01/02','2019/02/05',"Courier",366542,10225);

INSERT INTO order_item(order_num,item_code,qut)
VALUES (15209,104,10);

INSERT INTO order_item(order_num,item_code,qut)
VALUES (15209,142,30);

INSERT INTO order_item(order_num,item_code,qut)
VALUES (15209,231,20);

INSERT INTO order_table(order_num,date_order,date_req,method_del,sales_rep_id,cust_num)
VALUES(15210,'2019/01/02','2019/02/05',"Courier",366542,13810);

INSERT INTO order_item(order_num,item_code,qut)
VALUES (15210,104,3);
INSERT INTO order_item(order_num,item_code,qut)
VALUES (15210,107,3);

INSERT INTO order_table(order_num,date_order,date_req,method_del,sales_rep_id,cust_num)
VALUES(15211,'2019/01/02','2019/02/05',"Courier",366542,12993);

INSERT INTO order_item(order_num,item_code,qut)
VALUES (15211,104,3);
INSERT INTO order_item(order_num,item_code,qut)
VALUES (15211,107,3);

INSERT INTO invoice(invoice_num,order_num,sales_rep_name,note)
VALUES (17211,15209,"John Jones","Pink Tea Set will be delivered with next order");

INSERT INTO invoice_item(item_code,invoice_num)
VALUES (104,17211);

INSERT INTO invoice_item(item_code,invoice_num)
VALUES (142,17211);

INSERT INTO payment(payment_id,date_of_pay,invoice_num,amount,cust_num)
VALUES (1,'2019/02/25',17211,641.50,10225);

select * from customer;
SELECT customer.cust_name,customer.cust_phone,customer.cust_add 
FROM customer
LEFT JOIN order_table ON  customer.cust_num = order_table.cust_num
WHERE order_table.cust_num IS NULL;


DELIMITER //
CREATE FUNCTION item_total_fn (order_id INT(6))
RETURNS DECIMAL(6,2)
BEGIN
DECLARE total DECIMAL(6,2);
SET total=(SELECT SUM(qut*item.price+0.1*(qut*item.price)) 
FROM order_item
INNER JOIN item ON order_item.item_code=item.item_code
WHERE order_item.order_num=order_id);
RETURN total;
END //
DELIMITER ;

SELECT customer.cust_name,customer.cust_phone,customer.cust_add,
order_table.order_num,order_table.date_order,
item_total_fn(order_num)+delivery.delivery_charges AS Order_total
FROM order_table
INNER JOIN customer ON order_table.cust_num = customer.cust_num
INNER JOIN delivery ON order_table.method_del = delivery.method_del;

DELIMITER //
CREATE TRIGGER update_stock_trr
AFTER INSERT ON order_item
FOR EACH ROW
BEGIN
Update item
Set stock_in_hand= stock_in_hand - new.qut
where item_code = new.item_code;
END//
DELIMITER ;


INSERT INTO order_table(order_num,date_order,date_req,method_del,sales_rep_id,cust_num)
VALUES(15212,'2019/01/02','2019/02/05',"Courier",366542,13810);

INSERT INTO order_item(order_num,item_code,qut)
VALUES (15212,104,3);

DELIMITER //
CREATE TRIGGER add_balance
AFTER INSERT ON order_table
FOR EACH ROW
BEGIN
update customer 
set balance = balance+item_total_fn(new.order_num)
where cust_num = new.cust_num;
END //
DELIMITER ;
select * from customer where cust_num=13810;
INSERT INTO order_table(order_num,date_order,date_req,method_del,sales_rep_id,cust_num)
VALUES(15213,'2019/01/02','2019/02/05',"Courier",366542,13810);

INSERT INTO order_item(order_num,item_code,qut)
VALUES (15213,104,3);

DELIMITER //
CREATE TRIGGER subtract_balance_trr
AFTER INSERT ON payment
FOR EACH ROW
BEGIN
Update customer
Set balance= balance - new.amount
where cust_num = new.cust_num;
END //
DELIMITER ;


drop table delivery;
drop table payment;
drop table invoice_item;
drop table invoice;
drop table order_item;
drop table item;
drop table order_table;
drop table sales_rep;
drop table customer;


