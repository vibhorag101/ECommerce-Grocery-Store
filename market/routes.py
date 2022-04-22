from http.client import HTTPResponse
from socket import RDS_RDMA_DONTWAIT
from xml.dom.expatbuilder import FragmentBuilder
from flask import flash, redirect, render_template, request
from pyparsing import nums
from market import my_sql
from market import app
import random


## Change this function as for it to work according to product page add relevent html content...like getting brand,name,price as 
## get request from form and the POST request will be when user will freeze his order and will go to orders page


cart_id=0
total_val=0
total_count=0
customer_cart_list=[]

def reinitialize():
    global cart_id
    global total_count
    global total_val
    global customer_cart_list
    cart_id = StaticClass.giveCartId()
    total_val=0
    total_count=0
    customer_cart_list=[]

@app.route('/home/<user_id>')
def userEnter(user_id):
    my_list =[]
    cur = my_sql.connection.cursor()
    product_list = cur.execute("SELECT * FROM product")
    if product_list>0:
        product_all = cur.fetchall()
        for prod in product_all:
            temp_dict = {}
            for index in range(1,4):
                if(index==1):
                    temp_dict['Name']=prod[1]
                elif(index==2):
                    temp_dict['Price']=prod[2]
                else:
                    temp_dict['Brand']=prod[3]
            my_list.append(temp_dict)
    home(user_id)
    return render_template('home.html',list=my_list)

def home(user_id):
    global cart_id
    global total_count
    global total_val
    global customer_cart_list
    cur = my_sql.connection.cursor()
    if request.method=='POST':
        cur = my_sql.connection.cursor()
        cur.execute("INSERT INTO cart(Cart_ID,Total_Value,Total_Count) VALUES(%s, %s, %s)",(cart_id,total_val,total_count))
        my_sql.connection.commit()
        cur.close() 
        url_direct = '/order'+str(user_id)  
        return redirect(url_direct,list=customer_cart_list)
    else:
        purchaseDetails = request.args
        try:
            Name = purchaseDetails['Name']
            Brand = purchaseDetails['Brand']
            Price = purchaseDetails['Price']
            total_count=total_count+1
            total_val=total_val+int(Price)
            temp_dict = {}
            temp_dict['Name']=Name
            temp_dict['Brand']=Brand 
            temp_dict['Price']=Price
            customer_cart_list.append(temp_dict)
        except KeyError:
            tempError = "Error: KeyError"

@app.route('/order/<user_id>',methods=['GET','POST'])
def placeOrder(user_id):
    global customer_cart_list
    global cart_id
    if request.method=='POST':
        for item in customer_cart_list:
            product_name = item[0]
            cur = my_sql.connection.cursor()
            prod_list = cur.execute("SELECT * FROM product")
            if prod_list>0:
                prod_all = cur.fetchall()
                id = -1
            for tup in prod_all:
                if(tup[1]==product_name):
                    id = tup[0]
                    break
            cur.execute("INSERT INTO associated_with(Customer_ID,Cart_ID,Product_ID) VALUES(%s, %s, %s)",(user_id,cart_id,id))
            my_sql.connection.commit()
            cur.close()
        redirect('/placeOrder'+str(user_id))
    else:
        url_direct = '/home'+'/'+str(user_id)
        redirect(url_direct)
    return render_template('order.html',customer_cart_list)

@app.route('/')
def temp():
    return 'HELLO'

@app.route('/placeOrder/<user_id>')
def order_placing(user_id):
    return 'Hello from placing'

@app.route('/customerRegister',methods=['GET','POST'])
def customerRegister():
    if request.method=='POST':
        custDetails = request.form
        First_Name = custDetails['First_Name']
        Last_Name = custDetails['Last_Name']
        Email = custDetails['Email']
        Mobile_No = custDetails['Mobile_No']
        Password = custDetails['Password']
        cur = my_sql.connection.cursor()
        cur.execute("INSERT INTO customer(First_Name,Last_Name,Email,Mobile_No,Password) VALUES(%s, %s, %s, %s, %s)",(First_Name,Last_Name,Email,Mobile_No,Password))
        my_sql.connection.commit()
        cur.close()
    return render_template('customerRegister.html')

@app.route('/adminRegister',methods=['GET','POST'])
def adminRegister():
    if request.method=='POST':
        custDetails = request.form
        First_Name = custDetails['First_Name']
        Last_Name = custDetails['Last_Name']
        Password = custDetails['Password']
        cur = my_sql.connection.cursor()
        cur.execute("INSERT INTO admin(First_Name,Last_Name,Admin_Password) VALUES(%s, %s, %s)",(First_Name,Last_Name,Password))
        my_sql.connection.commit()
        cur.close()
    return render_template('adminRegister.html')

@app.route('/sellerRegister',methods=['GET','POST'])
def sellerRegister():
    if request.method=='POST':
        sellerDetails = request.form
        First_Name = sellerDetails['First_Name']
        Last_Name = sellerDetails['Last_Name']
        Email = sellerDetails['Email']
        Password = sellerDetails['Password']
        Mobile_No = sellerDetails['Phone_Number']
        POO = sellerDetails['Place_Of_Operation']
        cur = my_sql.connection.cursor()
        rand_admin = cur.execute("SELECT Admin_ID FROM admin")
        if rand_admin >0:
            rand_ad = cur.fetchall()
            F_key = random.choice(rand_ad)
            cur.execute("INSERT INTO seller(First_Name,Last_Name,Email,Phone_Number,Password,Place_Of_Operation,Admin_ID) VALUES(%s, %s, %s,%s,%s,%s, %s)",(First_Name,Last_Name,Email,Mobile_No,Password,POO, F_key))
        my_sql.connection.commit()
        cur.close()
    return render_template('sellerRegister.html')

# @app.route('/user-purchase',methods=['GET','POST'])
# def userPurchase():
#     u_list = []
#     temp_dict = {}
#     if request.method=='POST':
#         prod_details = request.form
        
@app.route('/UserLogin',methods=['GET','POST'])
def UserLogin():
    if request.method=='POST':
        userDetail = request.form
        Email = userDetail['Email']
        Password = userDetail['Password']
        cur = my_sql.connection.cursor()
        cust_list = cur.execute("SELECT * FROM customer")
        if cust_list>0:
            cust_all = cur.fetchall()
            c_tup = ()
            for tup in cust_all:
                if(tup[3]==Email):
                    c_tup = tup
                    break
            if c_tup==() or Password!=c_tup[5]:
                flash('Invalid Email or Password')
                # return render_template('IncorrectLogin.html',userDetails=c_tup)
            else:
                reinitialize()
                url_direct = '/home'+'/'+str(c_tup[0])
                return redirect(url_direct)
    return render_template('UserLogin.html')

## Edited from here on... Please make the relevent changes in front end

## For this function I made admin enter only f_name, l_name and password and not email as we don't have that in our database
@app.route('/AdminLogin',methods=['GET','POST'])
def AdminLogin():
    if request.method=='POST':
        userDetail = request.form
        First_Name = userDetail['First_Name']
        Last_Name = userDetail['Last_Name']
        Password = userDetail['Password']
        cur = my_sql.connection.cursor()
        cust_list = cur.execute("SELECT * FROM admin")
        if cust_list>0:
            cust_all = cur.fetchall()
            c_tup = ()
            for tup in cust_all:
                if(tup[1]==First_Name and tup[2]==Last_Name):
                    c_tup = tup
                    break
            if c_tup==() or Password!=c_tup[3]:
                flash('Invalid Email or Password')
                # return render_template('IncorrectLogin.html',userDetails=c_tup)
            else:
                url_direct = '/home'+'/'+str(c_tup[0])
                return redirect(url_direct)
    return render_template('AdminLogin.html')

## This is exactly similar as User login
@app.route('/SellerLogin',methods=['GET','POST'])
def SellerLogin():
    if request.method=='POST':
        userDetail = request.form
        Email = userDetail['Email']
        Password = userDetail['Password']
        cur = my_sql.connection.cursor()
        cust_list = cur.execute("SELECT * FROM seller")
        if cust_list>0:
            cust_all = cur.fetchall()
            c_tup = ()
            for tup in cust_all:
                if(tup[3]==Email):
                    c_tup = tup
                    break
            if c_tup==() or Password!=c_tup[5]:
                flash('Invalid Email or Password')
                # return render_template('IncorrectLogin.html',userDetails=c_tup)
            else:
                url_direct = '/home'+'/'+str(c_tup[0])
                return redirect(url_direct)
    return render_template('SellerLogin.html')

class StaticClass:
    
    cart_id = 500

    @staticmethod
    def giveCartId():
        StaticClass.cart_id +=1
        return StaticClass.cart_id