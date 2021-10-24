USE ict701_s2_19_g_k088_task2;

CREATE TABLE painter( ptc_num INT(4) PRIMARY KEY, ptr_lastname VARCHAR(35), ptr_firstname VARCHAR(35), ptr_initial CHAR(1), ptr_areacode char(3), ptr_phone char(8))	

CREATE TABLE gallery(
gal_num INT(2) PRIMARY KEY, 
gal_owner VARCHAR(35) NOT NULL,
gal_areacode CHAR(3) NOT NULL,
gal_phone VARCHAR(8) NOT NULL,
gal_rate DECIMAL(6,2) NOT NULL);

CREATE TABLE painting(
pntg_num INT(2) PRIMARY KEY, 
pntg_title VARCHAR(35) NOT NULL,
pntg_price 	decimal(12,2) NOT NULL,
gal_num int(2),
ptc_num int(4) not null,
foreign key(gal_num) references gallery(gal_num),
foreign key(ptc_num) references painter(ptc_num));
