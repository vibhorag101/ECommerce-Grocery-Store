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

