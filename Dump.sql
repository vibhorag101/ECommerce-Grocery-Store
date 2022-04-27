-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: online_store
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `Admin_ID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(15) NOT NULL,
  `Last_Name` varchar(15) DEFAULT NULL,
  `Admin_Password` varchar(20) NOT NULL,
  PRIMARY KEY (`Admin_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Anshak','Goel','akgoel@283'),(2,'Deeptorshi','Mondal','deepto@294'),(3,'Pritish','Poswal','pritishposwal@321'),(4,'Vibhor','Agarwal','vibhorag@349');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_views`
--

DROP TABLE IF EXISTS `admin_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_views` (
  `Admin_ID` int NOT NULL,
  `Order_ID` int NOT NULL,
  `No_Of_Orders_Viewed` int DEFAULT NULL,
  PRIMARY KEY (`Order_ID`,`Admin_ID`),
  KEY `admin_views_admin_Admin_ID_fk` (`Admin_ID`),
  CONSTRAINT `admin_views_admin_Admin_ID_fk` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`) ON DELETE CASCADE,
  CONSTRAINT `admin_views_orders_Order_ID_fk` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_views`
--

LOCK TABLES `admin_views` WRITE;
/*!40000 ALTER TABLE `admin_views` DISABLE KEYS */;
INSERT INTO `admin_views` VALUES (1,1,3),(1,2,3),(1,3,3),(2,4,1),(3,5,2),(3,6,2),(4,7,4),(4,8,4),(4,9,4),(4,10,4);
/*!40000 ALTER TABLE `admin_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `associated_with`
--

DROP TABLE IF EXISTS `associated_with`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `associated_with` (
  `Customer_ID` int NOT NULL,
  `Cart_ID` int NOT NULL,
  `Product_ID` int NOT NULL,
  PRIMARY KEY (`Customer_ID`,`Cart_ID`,`Product_ID`),
  KEY `Associated_With_cart_Cart_ID_fk` (`Cart_ID`),
  KEY `Associated_With_product_Product_ID_fk` (`Product_ID`),
  CONSTRAINT `associated_with_cart_Cart_ID_fk` FOREIGN KEY (`Cart_ID`) REFERENCES `cart` (`Cart_ID`) ON DELETE CASCADE,
  CONSTRAINT `Associated_With_customer_Customer_ID_fk` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE CASCADE,
  CONSTRAINT `Associated_With_product_Product_ID_fk` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associated_with`
--

LOCK TABLES `associated_with` WRITE;
/*!40000 ALTER TABLE `associated_with` DISABLE KEYS */;
INSERT INTO `associated_with` VALUES (201,1,1),(201,1,16),(201,1,18),(203,2,47),(203,2,65),(203,2,73),(203,2,79),(203,2,85),(205,3,1),(205,3,3),(205,3,6),(205,3,8),(205,3,10),(205,3,20),(205,3,22),(205,3,27),(205,3,28),(205,3,29),(207,4,87),(209,5,70),(209,5,75),(211,6,49),(211,6,55),(213,7,8),(213,7,10),(215,8,11),(215,8,12),(215,8,20),(217,9,21),(219,10,26),(219,10,27),(219,10,28),(219,10,29),(219,10,30);
/*!40000 ALTER TABLE `associated_with` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `Cart_ID` int NOT NULL AUTO_INCREMENT,
  `Total_Value` int DEFAULT NULL,
  `Total_Count` int DEFAULT NULL,
  `Offer_ID` int DEFAULT NULL,
  `Final_Amount` int NOT NULL,
  PRIMARY KEY (`Cart_ID`),
  KEY `cart_offer_Offer_ID_fk` (`Offer_ID`),
  KEY `totalcount` (`Total_Count`),
  KEY `finalvalue` (`Final_Amount`),
  CONSTRAINT `cart_offer_Offer_ID_fk` FOREIGN KEY (`Offer_ID`) REFERENCES `offer` (`Offer_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,230,3,1,130),(2,254,5,2,134),(3,954,10,NULL,954),(4,655,1,NULL,655),(5,285,2,2,165),(6,250,2,2,130),(7,620,2,3,372),(8,184,3,NULL,184),(9,335,1,NULL,335),(10,100,5,5,35);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `Category_ID` int NOT NULL AUTO_INCREMENT,
  `Category_Name` varchar(30) NOT NULL,
  PRIMARY KEY (`Category_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'dairy'),(2,'bread & buns'),(3,'vegetables & fruits'),(4,'beauty & hygiene'),(5,'chips & crisps'),(6,'snacks'),(7,'cold drinks'),(8,'fruit juices'),(9,'instant food'),(10,'bakery & biscuits'),(11,'icecreams '),(12,'grocery'),(13,'cleaning'),(14,'stationary'),(15,'dry fruits');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Customer_ID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(15) NOT NULL,
  `Last_Name` varchar(15) DEFAULT NULL,
  `Email` varchar(35) NOT NULL,
  `Mobile_No` varchar(14) NOT NULL,
  `Password` varchar(20) NOT NULL,
  PRIMARY KEY (`Customer_ID`),
  KEY `customerpassword` (`Password`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (201,'Sahil','Goyal','sahilgoyal@gmail.com','9821607414','sahil@2002'),(202,'Krishnam','Omar','krishnam20309@iiitd.ac.in','9205458676','krishnam!309'),(203,'Sanjay','Singh','sanjays@gmail.com','9876543210','ssingh#07'),(204,'Daksh','Sethi','sethidaksh02@gmail.com','9079676872','02oct@daksh'),(205,'Nakshatra','Yadav','yadavnk@gmail.com','6367918004','nick@05june'),(206,'Dhroovi','Poswal','dhrooviposwal@gmail.com','7021145249','apr29dh@05'),(207,'Madhvendra','Shaktawat','madhavsingh@gmail.com','9116849560','mahavjln@2001'),(208,'Suryakant','Rawat','srawat1961@gmail.com','9784647931','gaurav@2000'),(209,'Devesh','Mishra','deveshmanit@gmail.com','8004473290','devesh@ayodhya'),(210,'Jaya','Rawat','jaya1996@gmail.com','9785344167','rawatj@20'),(211,'Harsh','Raj','harshgaya@rediffmail.com','9876543211','harsh@bitm2001'),(212,'Himanshi','Fagna','fagnahimanshi@yahoomail.com','9930844798','himanshi@2005'),(213,'Harshit','R','raviharshit@gmail.com','9448722521','araviharshit@02'),(214,'Palak','Jain','jainpalakksg@gmail.com','9462270427','palakllb@muj'),(215,'Bajrang','Sharma','bsharmamayoor@gmail.com','9829110069','sharma@bajrangajmer'),(216,'Prachi','Chouhan','prachi2001@gmail.com','9928905860','prachi@geetanjali'),(217,'Krishandev',NULL,'kdevajmer@gmail.com','9664030892','devajmer@raj'),(218,'Ghisalal','Rawat','rawat1935@gmail.com','9782522343','gl@rawatdausa'),(219,'Madhav','Vyas','madhav20310@iiitd.ac.in','9625793053','vyasiiitd@madhav'),(220,'Ruchir','Agarwal','ruchir2607iitb@gmail.com','9434376643','agarwaliitb@2001'),(221,'Prateek','Apurva','prateekiiitn@gmail.com','8306573385','papurvaajmer@cse'),(222,'Shubham','Gautam','shubhamudce@gmail.com','9950746862','gautam@2002'),(223,'Prashant','Ramnani','prashant@iitkgp.ac.in','8443454531','ramnani@csekgp'),(224,'Mimansa','Bharadwaj','mimansamayoor@gmail.com','9214444174','art@bharadwaj'),(225,'Dharam','Pratap','dpratap@bitsp.ac.in','7343434342','dharam@1basketball'),(226,'Ojasva','Singh','osingh@gmail.com','7838067886','singh@iiitd1'),(227,'Kairvee','Rastogi','rastogikairvee@gmail.com','9732423442','rastogi@2002'),(228,'Yash','Rariya','yashcuraj@gmail.com','9660011878','rariyabjp@ajmer'),(229,'Shubham','Singh','bitmshubham@gmail.com','9105862131','shubham@kota2001'),(230,'Rajendra','Singh','rajendrakanha@gmail.com','9878945793','kanha@ajmer1');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_boy`
--

DROP TABLE IF EXISTS `delivery_boy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_boy` (
  `Delivery_Boy_ID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(15) NOT NULL,
  `Last_Name` varchar(15) DEFAULT NULL,
  `Mobile_No` varchar(10) NOT NULL,
  `Email` varchar(35) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Average_Rating` decimal(3,2) DEFAULT NULL,
  `Admin_ID` int NOT NULL,
  PRIMARY KEY (`Delivery_Boy_ID`),
  KEY `delivery_boy_admin_Admin_ID_fk` (`Admin_ID`),
  KEY `deliveryboyavgrating` (`Average_Rating`),
  CONSTRAINT `delivery_boy_admin_Admin_ID_fk` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_boy`
--

LOCK TABLES `delivery_boy` WRITE;
/*!40000 ALTER TABLE `delivery_boy` DISABLE KEYS */;
INSERT INTO `delivery_boy` VALUES (1,'Yogesh','Singh','9876543220','yogeshs@gmail.com','yogesh@singh',4.00,1),(2,'Sandeep','Sharma','9876543221','sandeeps@gmail.com','sandeep@sharma',NULL,2),(3,'Hukum','Chand','9876543222','hukum@gmail.com','hukumchand@123',5.00,3),(4,'Salman','Ansari','9876543223','salmanansari@gmail.com','salman@delhi',3.00,4),(5,'Ramesh','Choudhary','9876543224','rameshc@gmail.com','choudhary@ramesh',NULL,1),(6,'Jagdish','Bhadana','9876543225','bhadanajag@gmail.com','bhadana@jagdish',5.00,2),(7,'Sachin','Yadav','9876543226','yadavdelhi@gmail.com','sachin@yadav',3.00,3),(8,'Suresh','Gupta','9876543227','guptasuresh@gmail.com','suresh@gupta',4.00,4),(9,'Aman','Kumar','9876543228','kumaraman@gmail.com','kumar@aman',NULL,1),(10,'Mohd','Asif','9876543229','asifmohd@gmail.com','mohd@asif123',NULL,2);
/*!40000 ALTER TABLE `delivery_boy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offer` (
  `Offer_ID` int NOT NULL AUTO_INCREMENT,
  `Promo_Code` varchar(20) NOT NULL,
  `Percentage_Discount` int NOT NULL,
  `Min_OrderValue` int NOT NULL,
  `Max_Discount` int NOT NULL,
  `Admin_ID` int NOT NULL,
  PRIMARY KEY (`Offer_ID`),
  KEY `offer_admin_Admin_ID_fk` (`Admin_ID`),
  CONSTRAINT `offer_admin_Admin_ID_fk` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer`
--

LOCK TABLES `offer` WRITE;
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;
INSERT INTO `offer` VALUES (1,'IPL50',50,150,100,1),(2,'WELCOME60',60,200,120,2),(3,'FLAT40',40,500,300,3),(4,'FAN30',30,1000,500,4),(5,'ONLINE65',65,100,65,2);
/*!40000 ALTER TABLE `offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `Order_ID` int NOT NULL AUTO_INCREMENT,
  `Mode` varchar(15) DEFAULT NULL,
  `Amount` int DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `State` varchar(25) DEFAULT NULL,
  `Order_Time` varchar(20) DEFAULT NULL,
  `House_Flat_No` varchar(30) DEFAULT NULL,
  `Pincode` varchar(10) DEFAULT NULL,
  `Cart_ID` int DEFAULT NULL,
  `Date` varchar(20) DEFAULT NULL,
  `Delivery_Boy_ID` int NOT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `orders_cart_Cart_ID_fk` (`Cart_ID`),
  KEY `orders_delivery_boy_Delivery_Boy_ID_fk` (`Delivery_Boy_ID`),
  KEY `ordermode` (`Mode`),
  CONSTRAINT `orders_cart_Cart_ID_fk` FOREIGN KEY (`Cart_ID`) REFERENCES `cart` (`Cart_ID`) ON DELETE CASCADE,
  CONSTRAINT `orders_delivery_boy_Delivery_Boy_ID_fk` FOREIGN KEY (`Delivery_Boy_ID`) REFERENCES `delivery_boy` (`Delivery_Boy_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'COD',130,'Delhi','Delhi','10:00:00','304','110020',1,'20-03-2022',1),(2,'UPI',134,'Delhi','Delhi','11:05:00','100','110001',2,'25-03-2022',1),(3,'Card',954,'Noida','UP','09:05:00','200','201301',3,'28-03-2022',3),(4,'Netbanking',655,'Gurgaon','Haryana','14:30:00','300','122011',4,'31-03-2022',4),(5,'UPI',165,'Ghaziabad','UP','19:00:00','400','110093',5,'01-04-2022',4),(6,'Card',130,'Faridabad','Haryana','20:00:00','105','101213',6,'05-04-2022',6),(7,'UPI',372,'Delhi','Delhi','06:00:30','250','110005',7,'08-04-2022',7),(8,'COD',184,'Mumbai','Maharashtra','15:00:00','102','400001',8,'12-04-2022',8),(9,'UPI',335,'Mumbai','Maharashtra','20:30:00','205','400005',9,'15-04-2022',6),(10,'COD',35,'Delhi','Delhi','11:30:00','002','110003',10,'19-04-2022',8);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Product_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(35) NOT NULL,
  `Price` int NOT NULL,
  `Brand` varchar(15) DEFAULT NULL,
  `Measurement` varchar(15) DEFAULT NULL,
  `Admin_ID` int DEFAULT NULL,
  `Category_ID` int DEFAULT NULL,
  `Unit` varchar(15) NOT NULL,
  PRIMARY KEY (`Product_ID`),
  KEY `product_admin_Admin_ID_fk` (`Admin_ID`),
  KEY `product_category_Category ID_fk` (`Category_ID`),
  KEY `priceindex` (`Price`),
  CONSTRAINT `product_admin_Admin_ID_fk` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`) ON DELETE SET NULL,
  CONSTRAINT `product_category_Category ID_fk` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Amul Taaza Toned Milk',25,'Amul','500',1,1,'ml'),(2,'Mother Dairy Cow Milk',26,'Mother Dairy','500',2,1,'ml'),(3,'Mother Dairy Full Cream Milk',30,'Mother Dairy','500',3,1,'ml'),(4,'Nestle Toned Milk',85,'Nestle','1000',1,1,'ml'),(5,'Amul Masti Spiced Buttermilk',12,'Amul','200',4,1,'ml'),(6,'Mother Dairy Mango Lassi',10,'Mother Dairy','80',2,1,'ml'),(7,'Mother Dairy Classic Curd',22,'Mother Dairy','200',3,1,'ml'),(8,'Amul Butter',100,'Amul','100',3,1,'g'),(9,'Britannia Cheese Slices',144,'Britannia','200',4,1,'g'),(10,'Amul Pure Ghee',520,'Amul','1000',3,1,'ml'),(11,'Harvest Gold Brown Bread',43,'Harvest Gold','400',2,2,'g'),(12,'English Oven Whole Wheat Bread',41,'English Oven','400',3,2,'g'),(13,'English Oven Pav',35,'English Oven','300',1,2,'g'),(14,'Britannia Whole Wheat Bread',45,'Britannia','450',2,2,'g'),(15,'Harvest Gold Burger Bun',35,'Harvest Gold','200',3,2,'g'),(16,'Mango',180,'Generic','1000',2,3,'g'),(17,'Apple',125,'Generic','500',4,3,'g'),(18,'Onion',25,'Generic','1000',1,3,'g'),(19,'Tomato',31,'Generic','500',3,3,'g'),(20,'Pineapple',100,'Generic','1000',3,3,'g'),(21,'Vaseline Intensive Care Lotion',335,'Vaseline','400',2,4,'ml'),(22,'Nivea Watermelon Shine Lip Balm',199,'Nivea','5',1,4,'g'),(23,'Nivea Creme',199,'Nivea','100',3,4,'ml'),(24,'Tresemme Keratin Smooth Shampoo',319,'Tresemme','340',3,4,'ml'),(25,'Parachute Coconut Oil',128,'Parachute','300',3,4,'ml'),(26,'Lays India\'s Magic Masala Chips',20,'Lays','52',2,5,'g'),(27,'Bingo Tedhe Medhe',20,'Bingo','90',4,5,'g'),(28,'Bingo Cream & Onion Chips ',20,'Lays','52',3,5,'g'),(29,'Lays Cream & Onion Chips',20,'Lays','52',1,5,'g'),(30,'Kurkure Masala Munch',20,'Kurkure','85',3,5,'g'),(31,'Act II Butter Microwave Popcorn',25,'Act II','33',3,6,'g'),(32,'Haldiram Bhujia',54,'Haldiram','200',2,6,'g'),(33,'Bingo Mad Angles Nachos',20,'Bingo','66',4,6,'g'),(34,'Haldiram All in One Namkeen',99,'Haldiram','400',3,6,'g'),(35,'Britannia Fruit Cake',30,'Britannia','115',4,6,'g'),(36,'Thumbs Up',40,'Thumbs Up','300',2,7,'ml'),(37,'Sprite',40,'Sprite','300',4,7,'ml'),(38,'Coco-Cola',40,'Coco-Cola','300',3,7,'ml'),(39,'Red Bull Energy Drink',115,'Red Bull','250',1,7,'ml'),(40,'Pepsi',33,'Pepsi','600',2,7,'ml'),(41,'Slice Mango Drink',95,'Slice','1750',2,8,'ml'),(42,'Tropicana Guava Delight Juice',105,'Tropicana','1000',4,8,'ml'),(43,'B Natural Apple Juice',120,'B Natural','1000',3,8,'ml'),(44,'Paper Boat Aam Panna',30,'Paper Boat','200',1,8,'ml'),(45,'Real Orange Juice',115,'Real','1000',2,8,'ml'),(46,'Real Canberry Juice',115,'Real','1000',4,8,'ml'),(47,'Tropicana Mixed Fruit Juice',40,'Tropicana','500',3,8,'ml'),(48,'Paper Boat Guava Juice',30,'Paper Boat','200',4,8,'ml'),(49,'Real Pomegranate Juice',125,'Real','1000',2,8,'ml'),(50,'B Natural Mixed Fruit Juice',120,'B Natural','1000',1,8,'ml'),(51,'Maggi Masala Instant Noodles',27,'Nestle','140',2,9,'g'),(52,'Knorr Manchow Soup',65,'Knorr','46',3,9,'g'),(53,'Maggi Masala Penne Pasta',28,'Nestle','65',1,9,'g'),(54,'Yippee Magic Masala Noodles',48,'Sunfeast','240',4,9,'g'),(55,'McCain Masala French Fries',125,'McCain','375',2,9,'g'),(56,'Britannia Good Day Butter Cookies',10,'Britannia','68',3,10,'g'),(57,'Parle-G Glucose Biscuit',25,'Parle','250',1,10,'g'),(58,'Britannia Nutri Choice Biscuit',25,'Britannia','100',4,10,'g'),(59,'Sunfeast Dark Fantasy Biscuit',150,'Sunfeast','300',2,10,'g'),(60,'Oreo Orignal Vanilla Biscuit',30,'Cadbury','120',3,10,'g'),(61,'Parle Elaichi Rusk',170,'Parle','1000',1,10,'g'),(62,'Unibic Choco Chip Cookies',120,'Unibic','500',4,10,'g'),(63,'Sunfeast Mom\'s Magic Biscuit',35,'Sunfeast','200',2,10,'g'),(64,'Unibic Cashew Cookies',140,'Unibic','500',3,10,'g'),(65,'Parle Krackjack Biscuit',35,'Parle','200',1,10,'g'),(66,'NIC Choco Chips Ice Cream',70,'NIC','100',4,11,'ml'),(67,'Amul Chocolate Brownie Ice Cream',215,'Amul','1000',2,11,'ml'),(68,'Kwality Walls Oreo & Cream',299,'Kwality Walls','700',3,11,'ml'),(69,'BR Cotton Candy Ice Cream',365,'Baskin Robbins','450',1,11,'ml'),(70,'NIC Alphonso Mango Ice Cream',70,'NIC','100',4,11,'ml'),(71,'Aashirvaad Atta',205,'ITC','5000',2,12,'g'),(72,'India Gate Dubar Basmati Rice',138,'India Gate','1000',3,12,'g'),(73,'Madhur Sugar',60,'Madhur','1000',1,12,'g'),(74,'Tata Salt',24,'Tata','1000',4,12,'g'),(75,'Fortune Soyabean Oil',215,'Fortune','1000',2,12,'ml'),(76,'Surf Excel Easy Wash Detergent',128,'HUL','1000',3,13,'g'),(77,'Surf Excel Matic Liquid Detergent',230,'HUL','1020',1,13,'ml'),(78,'Lizol Citrus Floor Cleaner',103,'Reckitt','500',4,13,'ml'),(79,'Harpic Toilet Cleaner',99,'Reckitt','500',2,13,'ml'),(80,'Vim Lemon Dishwash Gel',52,'Vim','250',3,13,'ml'),(81,'Kangaro Stapler',65,'Kangaro','1',1,14,'unit'),(82,'Fevi Stick',30,'Pidlite','1',4,14,'unit'),(83,'Rorito Maxtron Pen',50,'Rorito','1',2,14,'unit'),(84,'Fevicol',30,'Pidlite','1',3,14,'unit'),(85,'Cello Tape',20,'Generic','1',1,14,'unit'),(86,'Tata Sampann Raisins',103,'Tata','200',4,15,'g'),(87,'Tata Sampann Almonds',655,'Tata','500',2,15,'g'),(88,'Tata Sampann Pista',345,'Tata','200',3,15,'g'),(89,'Tata Sampann Cashew',585,'Tata','585',1,15,'g'),(90,'Happilo Dates',440,'Happilo','680',3,15,'g');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_feedback`
--

DROP TABLE IF EXISTS `product_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_feedback` (
  `Review_ID` int NOT NULL AUTO_INCREMENT,
  `Rating` int DEFAULT NULL,
  `Review_Body` varchar(50) DEFAULT NULL,
  `Product_ID` int NOT NULL,
  `Customer_ID` int DEFAULT NULL,
  `Review_Date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Review_ID`,`Product_ID`),
  KEY `product_feedback_customer_Customer_ID_fk` (`Customer_ID`),
  KEY `product_feedback_product_Product_ID_fk` (`Product_ID`),
  KEY `productreview` (`Rating`,`Product_ID`),
  CONSTRAINT `product_feedback_customer_Customer_ID_fk` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE SET NULL,
  CONSTRAINT `product_feedback_product_Product_ID_fk` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_feedback`
--

LOCK TABLES `product_feedback` WRITE;
/*!40000 ALTER TABLE `product_feedback` DISABLE KEYS */;
INSERT INTO `product_feedback` VALUES (1,5,'amazing',1,201,'21-04-2022'),(2,1,'horrible',73,203,'21-04-2022'),(3,3,'average',6,205,'20-04-2022'),(4,4,'good product',55,211,'20-04-2022'),(5,2,'below expectations',87,207,'20-04-2022'),(6,3,'okayish',1,205,'22-04-2022'),(7,4,'amazing',28,205,'22-04-2022'),(8,5,'exceeded expecations',20,215,'21-04-2022'),(9,3,'average good',28,219,'20-04-2022'),(10,1,'don\'t order',21,217,'21-04-2022');
/*!40000 ALTER TABLE `product_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rates_order_delivery`
--

DROP TABLE IF EXISTS `rates_order_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rates_order_delivery` (
  `Order_ID` int NOT NULL,
  `Delivery_Boy_ID` int NOT NULL,
  `Customer_ID` int NOT NULL,
  `Rating_Given` int NOT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `rates_order_delivery_customer_Customer_ID_fk` (`Customer_ID`),
  KEY `rates_order_delivery_delivery_boy_Delivery_Boy_ID_fk` (`Delivery_Boy_ID`),
  KEY `customerratingdeliveryboy` (`Customer_ID`,`Rating_Given`),
  CONSTRAINT `rates_order_delivery_customer_Customer_ID_fk` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON UPDATE CASCADE,
  CONSTRAINT `rates_order_delivery_delivery_boy_Delivery_Boy_ID_fk` FOREIGN KEY (`Delivery_Boy_ID`) REFERENCES `delivery_boy` (`Delivery_Boy_ID`) ON UPDATE CASCADE,
  CONSTRAINT `rates_order_delivery_orders_Order_ID_fk` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rates_order_delivery`
--

LOCK TABLES `rates_order_delivery` WRITE;
/*!40000 ALTER TABLE `rates_order_delivery` DISABLE KEYS */;
INSERT INTO `rates_order_delivery` VALUES (1,1,201,3),(2,1,203,5),(3,3,205,5),(4,4,207,2),(5,4,209,4),(6,6,211,5),(7,7,213,3),(8,8,215,4),(9,6,217,5),(10,8,219,4);
/*!40000 ALTER TABLE `rates_order_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `rating_table`
--

DROP TABLE IF EXISTS `rating_table`;
/*!50001 DROP VIEW IF EXISTS `rating_table`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rating_table` AS SELECT 
 1 AS `Average_Rating`,
 1 AS `Product_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `selects`
--

DROP TABLE IF EXISTS `selects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `selects` (
  `Customer_ID` int NOT NULL,
  `Category_ID` int NOT NULL,
  PRIMARY KEY (`Customer_ID`,`Category_ID`),
  KEY `selects_category_Category_ID_fk` (`Category_ID`),
  CONSTRAINT `selects_category_Category_ID_fk` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`) ON DELETE CASCADE,
  CONSTRAINT `selects_customer_Customer_ID_fk` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selects`
--

LOCK TABLES `selects` WRITE;
/*!40000 ALTER TABLE `selects` DISABLE KEYS */;
INSERT INTO `selects` VALUES (201,1),(205,1),(213,1),(215,2),(201,3),(205,3),(215,3),(205,4),(217,4),(205,5),(219,5),(211,8),(211,9),(203,10),(209,11),(203,12),(209,12),(203,13),(203,14),(207,15);
/*!40000 ALTER TABLE `selects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `Seller_ID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(15) NOT NULL,
  `Last_Name` varchar(15) DEFAULT NULL,
  `Email` varchar(35) NOT NULL,
  `Phone_Number` varchar(15) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Place_Of_Operation` varchar(30) DEFAULT NULL,
  `Admin_ID` int DEFAULT NULL,
  PRIMARY KEY (`Seller_ID`),
  KEY `Seller_admin_Admin_ID_fk` (`Admin_ID`),
  CONSTRAINT `Seller_admin_Admin_ID_fk` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'Saver','Bazar','saverbazar@gmail.com','8765432109','saverbazar@123','New Delhi',1),(2,'24 ','Seven','24seven@gmail.com','7654321098','24seven@247','New Delhi',2),(3,'Xpress ','Mart','xpressm@gmail.com','8901234567','xpress@123','Mumbai',3),(4,'OneStop','Grocery','onestopgrocery@gmail.com','9999999998','onestop@one','New Delhi',4),(5,'Appario','Retail','appario@gmail.com','8908908901','app@2022','New Delhi',1),(6,'Twelve','Seven','12X7@gmail.com','7890789012','12X7@123','Mumbai',2);
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sells`
--

DROP TABLE IF EXISTS `sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sells` (
  `Seller_ID` int NOT NULL,
  `Product_ID` int NOT NULL,
  `No_of_Product_Sold` int DEFAULT NULL,
  PRIMARY KEY (`Product_ID`,`Seller_ID`),
  KEY `sells_seller_Seller_ID_fk` (`Seller_ID`),
  CONSTRAINT `sells_product_Product_ID_fk` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE,
  CONSTRAINT `sells_seller_Seller_ID_fk` FOREIGN KEY (`Seller_ID`) REFERENCES `seller` (`Seller_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sells`
--

LOCK TABLES `sells` WRITE;
/*!40000 ALTER TABLE `sells` DISABLE KEYS */;
INSERT INTO `sells` VALUES (1,1,2),(1,3,1),(1,6,1),(1,8,2),(1,10,2),(3,11,1),(3,12,1),(1,16,1),(1,18,1),(1,20,1),(3,20,1),(6,21,1),(1,22,1),(1,26,1),(1,27,2),(1,28,2),(1,29,2),(1,30,1),(2,47,1),(2,49,1),(2,55,1),(2,65,1),(5,70,1),(2,73,1),(5,75,1),(2,79,1),(2,85,1),(4,87,1);
/*!40000 ALTER TABLE `sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `rating_table`
--

/*!50001 DROP VIEW IF EXISTS `rating_table`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rating_table` AS select avg(`product_feedback`.`Rating`) AS `Average_Rating`,`product_feedback`.`Product_ID` AS `Product_ID` from `product_feedback` group by `product_feedback`.`Product_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-27 20:43:32
