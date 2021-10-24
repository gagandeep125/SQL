DROP TABLE painting;
DROP TABLE painter;
DROP TABLE gallery;

CREATE TABLE gallery (
gal_num INT(2) PRIMARY KEY,
gal_owner VARCHAR(35) NOT NULL,
gal_areacode CHAR(3) NOT NULL,
gal_phone CHAR (8) NOT NULL,
gal_rate DECIMAL (3,2)); 

CREATE TABLE painter (
ptr_num INT(3) PRIMARY KEY,
ptr_lastname VARCHAR(35) NOT NULL,
ptr_firstname VARCHAR(35) NOT NULL,
ptr_initial CHAR(1),
ptr_areacode CHAR(3),
ptr_phone CHAR (8));

CREATE TABLE painting (
pntg_num INT(3) PRIMARY KEY,
pntg_title VARCHAR(35) NOT NULL,
pntg_price DECIMAL(12,2) NOT NULL,
ptr_num INT(3) NOT NULL,
gal_num INT(2),
FOREIGN KEY (ptr_num) REFERENCES painter (ptr_num),
FOREIGN KEY (gal_num) REFERENCES gallery (gal_num) ON DELETE SET NULL);


INSERT INTO gallery VALUES 
(5, "L. R. Gilliam", "901", "123-4456", 0.37),
(6, "G. G. Waters", "405", "353-2243",	0.45);

INSERT INTO painter VALUES
(123, "Ross", "Georgette", "P", "901", "885-4567"),
(126, "Itero", "Julio",	"G", "901", "346-1112"),
(127, "Geoff", "George", "D", "615", "221-4456");

INSERT INTO painting VALUES
(1338, "Dawn Thunder", 	245.5, 123, 5),
(1339,	"A Faded Rose",	6723, 123, NULL),	
(1340,	"The Founders",	567.99,	126, 6),
(1341,	"Hasty Pudding Exit", 145.5, 123, NULL),	
(1342,	"Plastic Paradise", 8328.99, 126, 6),
(1343,	"Roamin''", 785,	127,	6),
(1344,	"Wild Waters",	999, 	127,	5)
(1345,	"Stuff'n Such'n Some",	9800,	123,	5);

