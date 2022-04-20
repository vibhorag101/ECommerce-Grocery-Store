from http.client import HTTPResponse
from flask import redirect, render_template, request
from pyparsing import nums
from market import my_sql
from market import app
import random


@app.route('/home/<user_id>')
def home(user_id):
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

    return render_template('home.html',list=my_list)

@app.route('/')
def temp():
    return 'HELLO'


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
                return render_template('IncorrectLogin.html',userDetails=c_tup)
            else:
                url_direct = '/home'+'/'+str(c_tup[0])
                return redirect(url_direct)
    return render_template('UserLogin.html')