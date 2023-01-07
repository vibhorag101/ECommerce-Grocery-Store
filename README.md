# An E-Commerce Grocery Store website using Flask
We have incorporated the database in the form of an application
where we have tried to resemble it into an E-commerce website which is in a running
form where users,sellers, and Administrators can work as they want in a real-life
Platform. We have made the Front end to enable the User Interface and User
Experience to the best of our abilities. Here our users can actually interact with our
website and do changes as they want to according to their scope in the project. It
ranges from selling and buying for users to make changes for Administrators and for
Sellers for selling their products. It also enables the site to work with all the necessary
constraints to put up an actual E-commerce site. We have connected the Database to
our actual website which maintains the recording accordingly, if we do any basic change
some change happens in or database.

## The Team 😀
All of us are CS undergrads at `IIIT Delhi`
- Vibhor Agarwal
- Anshak Goel
- Pritish Poswal
- Deeptorshi Mondal

## Project Report 📙📙
Here find the most detailed [`Report`](https://drive.google.com/file/d/1gwSO9Enmp2_QrMFgUFrtEVAthKgwKdty/view?usp=sharing) you will ever get. It has even the most minute details of our project.
The `submit` folder contains the project report, variours `SQL Queries` and `SQL Triggers`.

## Tech-Stack Used
- `Frontend` - HTML, CSS, BootStrap 5, Jinja Template.
- `Backend` - Python, Flask, MySQL Database.
- We have populated our database with real and good amount of data to test to the website properly. Data coherency has been taken utmost care of.
- Proper entities have been maintained in our [ER Diagram](https://drive.google.com/file/d/1gwWgqiIbi1ccUUxpN0GYY3s55nHbmFaf/view?usp=sharing).

![image](https://user-images.githubusercontent.com/76804249/189937796-1c29cdbc-a151-4b2a-a95f-8d3744407aa2.png)

We chose `Flask` as our backend becuase we needed the website to be working as quickly as possible to allign with our
project timeline. Also we chose `MySQL` as our database becuase we were working with it in our DBMS course in Undergrad.

## Steps to deploy the website ❓
- First clone this repository
- Then open the cloned folder
- We now need to restore the database from the dump.
- - Open the CMD in current folder and run the following command
```
mysql -u root -p online_store < Dump.sql
```
- Now create a virtual environment using the following command
```
py -m venv online_store
```
- Now activate this environment by running `.\online_store\Scripts\Activate.ps1`
- Now we need to pull up the project requirements. Run the below command
```
pip install -r .\requirements.txt
```
- This completes the setup process to run the website. Just run using running the `run.py` file 😀

# Demo of the website

## Login Screen
Firstly when we open the website we are shown the login screen.
- We are presented with three options
 - Use as Admin
 - Use as Seller
 - Use as a Customer
 
 ![image](https://user-images.githubusercontent.com/76804249/189930307-1b589e67-6929-42bd-8f95-26791a563861.png)

- Each role is then given a choice to Register or Login

![image](https://user-images.githubusercontent.com/76804249/189930533-d9417030-12ad-4fdb-b8cb-cbc4b78153d8.png)

- If the user chooses login then we show the authentication form

![image](https://user-images.githubusercontent.com/76804249/189930682-974ad142-c7c0-4bb3-b0b4-297e8048315e.png)

- If the entered password is incorrect then we show the error otherwise we login the user.

![image](https://user-images.githubusercontent.com/76804249/189930896-cb75eb5f-fa21-4806-ab96-5387abed6f79.png)

- If the user is not already register we ask the relevant details from him.

![image](https://user-images.githubusercontent.com/76804249/189931179-d0c77367-7732-4ec8-a270-895897884cb0.png)

## Shopping Screen
- Once the user is succesfully logged in we show him the product list

![image](https://user-images.githubusercontent.com/76804249/189931991-7129528d-059b-4705-b36d-c0d7760f40e5.png)

- He has the choice of adding the product to the cart. We give him confirmation once added a product succesfully.

![image](https://user-images.githubusercontent.com/76804249/189932723-824e8773-a96c-46f2-aebc-8fc5bb54e558.png)

- Then he can go to the cart and apply coupon code as well

![image](https://user-images.githubusercontent.com/76804249/189932935-66877493-52aa-4f86-91a0-8761e3af526a.png)

- We are then shown the price inclusive of discount and the payment and address is asked

![image](https://user-images.githubusercontent.com/76804249/189933944-768e09ba-e38e-4cc1-a4f9-de2378fbce53.png)

- We then show the user that order has been placed succesfully

![image](https://user-images.githubusercontent.com/76804249/189934185-e49aeae8-6b72-42b2-b92e-86e273146d43.png)

- If we login as seller than we can the products to the inventory

![image](https://user-images.githubusercontent.com/76804249/189934713-7e24517d-8ac5-4497-b457-131eb59b256b.png)

- If we login as Website Admin then we can do multiple things as shown

![image](https://user-images.githubusercontent.com/76804249/189935135-bddd315f-13c5-4816-947d-738a44108e5a.png)

- Say for example adding a new offer

![image](https://user-images.githubusercontent.com/76804249/189935575-259c4d78-50a2-4d58-9f5f-adb282dd0a03.png)


# Complete Description of the Project

## Scope of the Project
Our Project deals with the making and managing of an online retail store. In this project
our main objective is to make such a system which would help in the functioning of the
online retail system amongst the stakeholders involved in such a system. Our scope of
the project is mainly aiming to bridge the gap between people involved such as a
seller,customer , the person administering it and the delivery boys. We would have
different people to play different roles.
Here the Admin,Customer and the Seller all would be able to login to a page.
Specifically here we first take the Admin who would handle many requests and would
ensure the proper working amongst people other than the organization being involved in
the system. He would have all his details where he would have a name,ID,and a
password. He would be able to add sellers giving products in the market and adding
those products in the cart with their attributes. He would also be able to view the
product. The Admin can also add a delivery boy to add products and also has the
access to add offers for different orders as per their eligibility.
Then similarly a seller having their name, place of operation,password,email and phone
no would be able easily be able to sell the products.
The product sold would also have various attributes where the admin and customer
would be able to see it’s price,name, brand, measurement,unitand would also have an
ID.
Next we would have a customer who would have a name, password, email, mobile
number and also an ID who would have the liberty to give the feedback on the product
and is associated with the category and select the category. The customer now has the
power to give a rating to the delivery boy correspondimng to a order..
The Feedback would have a body to write the details as well as contain an ID to store it.
It would contain the date to be added and also the score to measure it.
We would have Categories containing the ID and the name to differentiate and the
products would also be added to a cart having the total cost and the value added with
it’s ID.
Finally the cart makes the orders so that it can finally go for purchasing where the order
would have it’s ID, the address it is being delivered to, the mode of payment and the
amount to be given. It would have the order date and also it’s time. The cart would also
have a final value as an attribute which is there after a offer is applied to it. Now offers
can be applied in the cart as well.The orders section would laos be assigned to a
particular delivery boy.
We would have a offers section as well which is mainly used to apply special discounts
to all the products that have been added in the product. The offer would contain a
promo code, an offer id,a maximum discount, minimum value and also a percentage
discount.
Next at last we have a deliver boy who carries out different orders throughout the
process. The delivery would have his password email id, phone number, as well as his
average rating. He would have an ID and also a name with first and last name. He
would be assigned to a order.
So all in all a person would be able sell his products to the customer where the process
would be managed by the admin and the order would be carried out by the delivery boy.
It would have all the added features to make the process more efficient and smooth.
We have also included Git for version control to ensure all members of the team have
the latest version of the database with them. We regularly update dumps of database on
Github.
Our final scope lies in identifying the products,users,admin ,orders ,sellers and delivery
boy and maintaining a proper cycle and interaction between all.

## Stake holders of the Project
There are multiple Stakeholders in this project mainly the project is centered around
customers and sellers along with it we also have admin and delivery boy as two more
of our stakeholders. Customers are important stakeholders who perform operations like
viewing products category wise, adding the products to cart, placing orders and giving
feedback on products. They can also add rating to the delivery boy corresponding to a
particular order.
Our other stakeholder seller sells various products which customers buy.
One other stakeholder here is the admin who maintains and adds data to our database
for online retail store like adding products, adding sellers along with that he can view the
orders customers have placed for processing them. The Admin also adds the delivery
boy while the delivery boy always gets assigned to a order when it is made.

## Assumptions in the Project
We have taken the following assumptions in our project.
1. First of all we have assumed that all orders will go through the cart and every
order will have a unique cart with unique cart ID and would be associated with
only one single customer. Also every customer will have one cart at a time to
place order.
2. Only a customer can add product feedback to a product by giving review and
rating to the products.
3. Each product will belong to some unique category and there are no categories
which don’t have any product.
4. Customer can view product directly also and can view it by selecting that
particular category also.
5. There can be multiple admins and each of them has the power to add
products,category and sellers.
6. Only admins can view details of all the orders placed by different customers while
a customer can view only his order
7. Each product can be sold by any of the multiple sellers and each seller can sell
multiple products
8. Seller can only know no of products of each type they have sold
9. We have also assumed each cart is associated with single order only and every
order is associated with single cart only
10. It is assumed in this project that all the products are sold at MRP and there is no
option of discount or coupon code or cashback. ASSUMPTION REMOVED.
11. We have made sure that offers are made according to a minimum price.It would
have a maximum discount and would have a percentage discount.
12. A cart can have a single offer only. But a single offer can be made to multiple
carts.
13.Only a single admin can add multiple offers.
14.Only a single admin can add multiple delivery boys.
15. A single delivery boy can be assigned to multiple orders
16. Multiple customers can give a particular rating value to multiple deliver boys
corresponding to multiple orders..
17.A customer can add a rating corresponding to its own order only

## Grants in the Project
1 GRANT FOR ADMIN
grant select,insert,update,alter
on category
to 'Admin1';
grant select,insert,update,alter
on delivery_boy
to 'Admin1';
grant select,insert,update,alter
on offer
to 'Admin1';
grant select,insert,update,alter
on product
to 'Admin1';
grant select,insert,update,alter
on seller
to 'Admin1';
grant select
on orders
to 'Admin1';
grant select
on customer
to 'Admin1';
EXPLAINATIONThis is the grant that has been created for the Admin. The Admin username is “Admin1”
as shown in the above SQL query.
As seen above in this grant we have given the administrator who is “Admin1” the
privilege to select,update,insert and alter the category entity as per his choice.
Now similarly the admin has the privelege to select,update,insert and alter the
delivery_boy,offer,product and seller as per his choice.
On orders the admin is has the privilege to only select the orders as given by the
customer.
The Admin has the privilege to only select a customer as well.
2 GRANT FOR SELLER
grant select,insert,update
on product
to 'Seller1','Seller2';
grant select
on orders
to 'Seller1','Seller2';
grant select
on offer
to 'Seller1','Seller2';
grant select
on sells
to 'Seller1','Seller2';
grant select
on category
to 'Seller1','Seller2';
EXPLAINATIONThis is the grant that has been created for two sellers.There are two usernames for two
sellers which are “Seller1” and “Seller2” respectively.
As seen above in this grant we have given both the sellers who are “Seller1” and
“Seller2” the privilege to select,update,insert and alter the product entity as per his
choice.
On the contrary the “Seller1” and “Seller2 have the privilege to only select the
orders,offer and category entity as given in the database.
Both the seller can also select the relationship table sells present in our database.
2 GRANT FOR DELIVERY BOY
grant select
on product
to 'Delivery_boy1','Delivery_boy2';
grant select
on orders
to 'Delivery_boy1','Delivery_boy2';
grant select
on offer
to 'Delivery_boy1','Delivery_boy2';
grant select
on product_feedback
to 'Delivery_boy1','Delivery_boy2';
grant select
on rates_order_delivery
to 'Delivery_boy1','Delivery_boy2';
EXPLAINATIONThis is the grant that has been created for two delivery boys.There are two usernames
for two delivery boys are “Delivery_boy1” and “Delivery_boy2” respectively.
As seen above in this grant we have given both the delivery boys who are
“Delivery_boy1” and “Delivery_boy2” the privilege to ONLY select product
feedback,offer,orders and product.
Both the delivery boys can also select the relationship table rates_order_delivery
present in our database.

## Entities with their Primary Key
There are numerous entities in the project and following are there keys:-
Customer:- It is the main person involved in the buying of the products who is able to
select the category and also gives the product feedback. He is also associated with the
cart for making the orders. The Customer has a name, an email, a phone number and
also has been given a password. The customer can give a rating value to a delivery boy
corresponding to a particular order Foreign Key- NA PRIMARY KEY-Customer_ID
Product:- This the element that is added by the admin,sold by the seller and finally
selected by the customer through the user. It would have the name, the ID and the
price. It would also have the brand,unit and the measurement. It is associated with cart
and has a category. Foreign Key- Category_ID, PRIMARY KEY-Product_ID
Admin:- It is the work of the administrator to add the products and the person selling
them. The Admin can also view what the orders are. The Admin can add offers as well
as delivery boys. The Admin has a name,ID and a password. Foreign KeyCategory_ID, PRIMARY KEY-Admin_ID
Category:- It is basically the section where the product belongs to. It would have the
category name as well as the category ID. The Admin can also view what the orders
are. It would have the name as well as the ID. Foreign Key- NA, PRIMARY
KEY-Category_ID
Seller:-The person involved in selling the products in the store. The seller is added by
the admin. The seller would have his name and an ID. The seller’s contact details have
been stored and his place of operation as well. A password also has been provided.
Foreign Key- Admin_ID, PRIMARY KEY-Seller_ID.
Product Feedback[WEAK ENTITY]:-It is the review and feedback given by the
customer. Every product would have feedback.The Feedback would have an ID. It
would also contain the date when it is added. Product would also contain the rating and
the body to determine what our review basically is. Foreign Key-NA, PRIMARY
KEY-Review_ID ∪ Product_ID
Orders:-This is one of the main entities where the main order takes place. Here the
products which are confirmed are finally put in the system. Here the cart would finally
make the orders. The order would contain the ID, the address from where it is coming. It
would also have the time and date of its delivery. One would also have the option to
choose the mode of payment and it’s amount. The order would be assigned to a
delivery boy while with regards to a particular order a delivery boy would be given a
rating.Foreign Key- Cart_ID, PRIMARY KEY-Order_ID.
Cart:- This would all the orders that are being stored by the customer. The cart would
make the orders. Cart would have the ID, the total no of products as well as the total
units each product has. The cart would also have the final amount as an attribute after
applying a particular offer. The offer would also be applied to the cart.Foreign Key-NA ,
PRIMARY KEY-Admin_ID
Offer:- These will be the offers which will be applied on the basis of certain condition. It
can be on the basis of a minimum price applied to the order. These offers would give
the users some amount thereby decreasing the cost of the cart. The offer will be applied
to the cart only. The offer will also have a promo code. So the attributes would be promo
code,offer ID, maximum discount,percentage discount and a min order value.Foreign
Key-Admin_ID , PRIMARY KEY-Offer_ID
Delivery_boy:- This is the person who would deliver the orders to the customer. He
would added by the admin and would also be liable to a rating by the customer with
regards to a particular order. He/she would be assigned to a order. The delivery boy
would have a first name, last name. In the form of contact the delivery boy would have a
email address and a mobile number. An ID would be assigned and a average rating and
password would be given.Foreign Key-Admin_ID , PRIMARY KEY-Delivery_Boy_ID

## RELATIONSHIPS ESTABLISHED,ENTITY PARTICIPATION AND RELATIONSHIP TYPES
We have built many relationships between entities here and a brief description of each
relationship along with participation and type is given below:-
1. customer selects category :- Here the relationship between customer
and category is M to N as each customer can select multiple categories and each
category can be selected by multiple customers. Here both customer and
category has partial participation as it is not necessary that every customer
selects some category and also it is not necessary for every category to be
selected by some customer so the participation is partial.
2. customer gives product_feedback :- Here the relationship
between customer and product_feedback is 1 to N as we know that a customer
can give product feedback for multiple products but we know that a single
product feedback can be given by only one customer. Here customer has partial
participation as it is not necessary for every customer to give product feedback
but it is necessary for every product feedback to given by some customer so
product feedback has complete participation. Here our product feedback is weak
entity and the relationship type is between the weak and strong entity so it was
necessary for weak entity to have complete participation.
3. category has product :- Here the relationship between category and
product is 1 to N as every category has multiple products but every each product
belongs to only one category. Here there is complete participation from both category
and product as each product belong to some category and also here we have assumed
that each category has atleast one product.
4. product has product feedback :- Here the relationship between
product and product feedback is 1 to N as every product has multiple feedbacks
but one product feedback belongs to only one product. Here there is partial
participation from product side as not every product has product feedback but
there is complete participation from product feedback side as every product
feedback is associated with some product.
5. seller sells product :- Here the relationship between seller and product
is m to n as every product can be sold by multiple seller and also every seller can
sell multiple products. Here there is complete participation from seller as well as
product because every seller sells some product and every product is sold by
some seller.
6. admin adds seller :- Here the relationship between admin and seller is 1
to N. As 1 admin can add multiple seller but 1 seller can be added by one admin
only only. Here there is partial participation by admin because we have assumed
not every admin adds seller also there is complete participation by seller as every
seller is added by some admin.
7. admin adds product :- Here the relationship between admin and
product is 1 to N. As one admin can add multiple products but one product is
added by single admin only. There is complete participation from product
because every product is added by some admin but there is partial participation
from admin because not every admin adds some product.
8. cart makes order :- Here the relationship between cart and order is 1 to
1. As we have assumed that one order can be made by single cart only and one
cart makes only single order. Here there is partial participation from the cart
because not every cart makes a order as some customer may leave some items
inc art and may not place a order but there is complete participation from order
because every order has been made by some cart.
9. admin admin_views orders :- Here the relationship between admin
and order is M to N. It is M to N as each order can be viewed by multiple admins
also each admin can view multiple orders. Here there is partial participation from
both admin and orders as not every admin views some order also not every order
is viewed by some admin.
10. customer is associated with product and cart :- This is a
ternery relationship in our online retail store.
Talking about these one by one we have taken some assumptions here
1. Between customer and cart the relation is one to one as we have
assumed and implemented in such a way that one customer will have only
cart and one cart will be related to only one customer and here there is
partial participation from customer as we have assumed not every
customer has a cart and there is complete participation from cart as every
cart is associated with some customer.
2. Between product and cart the relation is N to 1 as we have assumed one
product can be added to only single cart at a time for one user and one
cart can have multiple products. There is partial participation from product
as not every product may be added to cart but there is complete
participation from cart as there is 1 unique cart for one user so it will
always have product and participate.
3. Between customer and product the relationship is 1 to N as we have
assumed one person can add multiple products to cart but one product
can be added to cart by only single person at a time. There is partial
participation from both customer and product as not every customer adds
product to cart and not every product is added to cart by an customer
according to our implementation.
11. Offer is Applied to a Cart
Here the relationship between offer and cart is 1 to N. As we have assumed that
one order can be applied to mutiple carts only and only 1 cart can have only 1
offer only. Here there is partial participation from the cart because not every cart
would have a offer as some offer may not be applied to a cart and hence leave
some offers and there is partial participation from offer because not all offers can
be applied to carts as it is not necessary that offer can be made.
12. Admin adds offer :- Here the relationship between admin and offer
is 1 to N. As one admin can add multiple offers but one offer is added by single
admin only. There is complete participation from product because every offer is
added by some admin but there is partial participation from admin because not
every admin adds some offer.
13. Admin adds delivery boys :- Here the relationship between
admin and delivery boy is 1 to N. As one admin can add multiple delivery boys
but one delivery boy is added by single admin only. There is complete
participation from deliver boy because every delivery boy is added by some
admin but there is partial participation from admin because not every admin adds
some delivery boy.
14. delivery boy is assigned to orders :- Here the relationship
between delivery boy and order is 1 to N. As one delivery boy can be assigned
to multiple orders but one orderis can be assigned to a single delivery boy only.
There is complete participation from order because every order is assigned to
some order but there is partial participation from delivery boy because not every
delivery boy is assigned to a order.
15. Customer rates_order_delivery with respect to the
order and delivery boy:- This is another ternery relationship in our
online retail store.
Talking about these one by one we have taken some assumptions here
1. Between customer and delivery boy the relation is N to 1 as we have
assumed and implemented in such a way that M customers can give
multiple ratings to 1 delivery boy with respect to multiple orders and here
there is partial participation from customer as we have assumed not every
customer will give a rating to delivery boy and there is partial participation
from delivery boy as not every delivery boy will be rated by some
customer.
2. ** Between delivery boy and order the relation is 1 to N as we have
assumed that multiple customers can rate 1 delivery boy with respect to
mutiple orders.There is partial participation from delivery boy as not every
delivery boy can be assigned to an order and there is partial participation
from order as it is not necessary that every order has to be assigned to a
delivery boy.
3. Between customer and order the relationship is M to N as we have
assumed multiple customers can rate multiple orders say N with respect to
a particular delivery boy. There is partial participation from both customer
and order as not every customer adds rating with respect to order and not
every order is rated by an customer according to our implementation.

## Converting E-R into Relational Schemas
We converted E-R into relationship schemas as follows by following the rules related to
including foreign key where required and creating extra tables in schema for M to N
relationships and also for relationships with attributes. The schema we made is as
follows:-
product(Product_ID,Name,Price,Brand,Measurement,Unit,Admin_ID,Category_I
D)
customer(Customer_ID,First_Name,Last_Name,Email,Mobile No, Password)
category(Category_ID,Category_Name)
admin(Admin_ID, First Name, Last Name, Admin_Password)
seller(Seller_ID, First_Name, Last_Name, Email, Phone_Number, Password,
Place_Of_Operation,Admin ID)
cart(Cart ID,Total_Value, Total_Count,Final_Amount,Offer_ID)
orders(Order ID, Mode, Amount, Order_Time, State, City, House_Flat_No,
Pincode, Cart_ID, Date, Delivery_Boy_ID)
product_feedback(Review ID,Rating,
Review_Body,Product_ID,Customer_ID,Review_Date)
sells(Seller_ID,Product_ID, No_of_Product_Sold)
admin_views(Admin_ID, Order_ID, No_Of_Orders_Viewed)
selects(Customer ID,Category ID)
associated_With(Customer_ID, Cart_ID,Product_ID)
delivery_boy(Delivery_Boy_ID,First_Name,Last_Name,Password,Mobile_No,Email,Ave
rage_Rating,Admin_ID)
rates_order_delivery(Order_ID,Delivery_Boy_ID,Customer_ID,Rating_Given)
offer(Offer_ID,Promo_Code,Percentage_Discount,Min_OrderValue,Max_Discount,Admi
n_ID

## Explanation of SQL Queries
Please find the `SQL Queries` and `Triggers` in Submit folder and their explanation in the `Project Report` mentioned above.
                                                 
                                                    Made with 💖 by Our Team
