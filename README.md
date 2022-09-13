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
our actual website which maintains the recording accordingly. if we do any basic change
some change happens in or database.

## Tech-Stack Used
- `Frontend` - HTML, CSS, BootStrap 5, Jinja Template.
- `Backend` - Python, Flask, MySQL Database.

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
- This completes the setup process to run the website 😀

## Demo of the website

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



-
