from http.client import HTTPResponse
from xml.dom.expatbuilder import FragmentBuilder
from flask import flash, redirect, render_template, request, url_for
from pyparsing import nums
from market import my_sql
from market import app
import random
from datetime import datetime,date


cart_id=0
total_val=0
total_count=0
customer_cart_list=[]

@app.route('/admin/<admin_id>')
def adminRedirect(admin_id):
    return render_template('adminOption.html',admin_id=admin_id)

@app.route('/adminOrder/<admin_id>',methods=['GET', 'POST'])
def adminViewOrder(admin_id):
    my_list =[]
    cur = my_sql.connection.cursor()
    order_list = cur.execute("SELECT * FROM orders")
    if order_list>0:
        order_all = cur.fetchall()
        for order in order_all:
            temp_dict = {}
            for index in range(11):
                if(index==0):
                    temp_dict['Order_ID']=order[0]
                elif(index==1):
                    temp_dict['Mode']=order[1]
                elif(index==2):
                    temp_dict['Amount']=order[2]
                elif(index==9):
                    temp_dict['Date']=order[9]
            my_list.append(temp_dict)
    if request.method=='POST':
        return redirect('/admin/'+str(admin_id))
    return render_template('viewOrder.html',list=my_list)

@app.route('/adminOffer/<admin_id>',methods=['GET', 'POST'])
def adminAddOffer(admin_id):
    if request.method=='POST':
        offerDetails = request.form
        PC = offerDetails['Promo_Code']
        PD = offerDetails['Percentage_Discount']
        min_orderval = offerDetails['Min_OrderValue']
        max_discount = offerDetails['Max_Discount']
        cur = my_sql.connection.cursor()
        cur.execute("INSERT INTO offer(Promo_Code,Percentage_Discount,Min_OrderValue,Max_Discount,admin_id) VALUES(%s, %s, %s, %s,%s)",(PC,PD,min_orderval,max_discount,admin_id))
        flash('You have successfully added a Offer !')
        my_sql.connection.commit()
        cur.close()
    return render_template('addOffer.html',admin_id=admin_id)

@app.route('/adminDelivery_boy/<admin_id>',methods=['GET', 'POST'])
def adminAdd_Delivery_Boy(admin_id):
    if request.method=='POST':
        delivery_boy_Details = request.form
        First_Name = delivery_boy_Details['First_Name']
        Last_Name = delivery_boy_Details['Last_Name']
        Mobile_No = delivery_boy_Details['Mobile_No']
        Email = delivery_boy_Details['Email']
        Password = delivery_boy_Details['Password']
        cur = my_sql.connection.cursor()
        cur.execute("INSERT INTO delivery_boy(First_Name,Last_Name,Mobile_No,Email,Password,Average_Rating,Admin_ID) VALUES(%s, %s, %s, %s, %s,%s,%s)",(First_Name,Last_Name,Mobile_No,Email,Password,None,admin_id))
        flash('You have successfully added a delivery boy !')
        my_sql.connection.commit()
        cur.close()
    return render_template('addDelivery.html',admin_id=admin_id)

@app.route('/adminSeller/<admin_id>',methods=['GET', 'POST'])
def adminAdd_Seller(admin_id):
    if request.method=='POST':
        Seller_Details = request.form
        First_Name = Seller_Details['First_Name']
        Last_Name = Seller_Details['Last_Name']
        Email = Seller_Details['Email']
        Phone_Number = Seller_Details['Phone_Number']
        Password = Seller_Details['Password']
        Place_Of_Operation = Seller_Details['Place_Of_Operation']
        cur = my_sql.connection.cursor()
        cur.execute("INSERT INTO seller(First_Name,Last_Name,Email,Phone_Number,Password,Place_Of_Operation,Admin_ID) VALUES(%s, %s, %s, %s, %s,%s,%s)",(First_Name,Last_Name,Email,Phone_Number,Password,Place_Of_Operation,admin_id))
        flash('You have successfully added a seller !')
        my_sql.connection.commit()
        cur.close()
    return render_template('addSeller.html',admin_id=admin_id)

@app.route('/adminProduct/<admin_id>',methods=['GET', 'POST'])
def adminAdd_Product(admin_id):
    if request.method=='POST':
        Product_Details = request.form
        Name = Product_Details['Name']
        Price = Product_Details['Price']
        Brand= Product_Details['Brand']
        Measurement = Product_Details['Measurement']
        Category_ID = Product_Details['Category_ID']
        Unit = Product_Details['Unit']
        cur = my_sql.connection.cursor()
        cur.execute("INSERT INTO product(Name,Price,Brand,Measurement,Admin_ID,Category_ID,Unit) VALUES(%s, %s, %s, %s, %s,%s,%s)",(Name,Price,Brand,Measurement,admin_id,Category_ID,Unit))
        flash('You have successfully added a Product !')
        my_sql.connection.commit()
        cur.close()
    return render_template('addNewProducts.html',admin_id=admin_id)

@app.route('/sell/<seller_id>',methods=['GET', 'POST'])
def sell(seller_id):
    if request.method=='POST':
        ProdDetail = request.form
        Name = ProdDetail['Name']
        Brand = ProdDetail['Brand']
        Quantity = ProdDetail['Quantity']
        cur = my_sql.connection.cursor()
        prod_list = cur.execute("SELECT * FROM product")
        if prod_list>0:
            prod_all = cur.fetchall()
            c_tup = ()
            for tup in prod_all:
                if(tup[1]==Name and tup[3]==Brand):
                    c_tup = tup
                    break
            if c_tup==() or int(Quantity)<0:
                flash('Invalid Product details or Quantity')
            else:
                cur.execute("INSERT INTO sells(Seller_ID,Product_ID,No_of_Product_Sold) VALUES(%s, %s, %s)",(seller_id,tup[0],Quantity))
                my_sql.connection.commit()
                cur.close()
                flash('Product added successfully ')
    return render_template('addProduct.html')



def reinitialize():
    global cart_id
    global total_count
    global total_val
    global customer_cart_list
    cart_id = StaticClass.giveCartId()
    total_val=0
    total_count=0
    customer_cart_list=[]

@app.route('/home/<user_id>', methods=['GET', 'POST'])
def userEnter(user_id):
    my_list =[]
    global cart_id
    global total_count
    global total_val
    global customer_cart_list
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
    if request.method=='POST':
        cur = my_sql.connection.cursor()
        OID = 3
        f_amt = total_val
        cur.execute("INSERT INTO cart(Cart_ID,Total_Value,Total_Count,Offer_ID,Final_Amount) VALUES(%s, %s, %s, %s, %s)",(cart_id,total_val,total_count,OID,f_amt))
        my_sql.connection.commit()
        cur.close()
        url_direct = '/order'+'/'+str(user_id)
        return redirect(url_direct)
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
            flash('Product has been added successfully to the cart !')
        except KeyError:
            tempError = "Error: KeyError"
    return render_template('home.html',list=my_list)

@app.route('/order/<user_id>',methods=['GET','POST'])
def placeOrder(user_id):
    global customer_cart_list
    global cart_id
    global total_val 
    if request.method=='POST':
        OfferDetails = request.form
        P_code = OfferDetails['Promo_Code']
        cur = my_sql.connection.cursor()
        if(P_code=='Coupon_Code'):
            cur.execute("UPDATE cart SET Offer_ID = %s WHERE Cart_ID = %s",(None,cart_id))
            my_sql.connection.commit()
            cur.close()
        else:
            offer_list = cur.execute("SELECT * FROM offer")
            if offer_list>0:
                offer_all = cur.fetchall()
                deduct = 0
                my_tup=()
            for tup in offer_all:
                if(tup[1]==P_code):
                    my_tup=tup
                    if(int(total_val)>int(tup[3])):
                        dval = (int(total_val)*float(tup[2]))/100
                        if(float(dval)>int(tup[4])):
                            deduct=int(tup[4])
                        else:
                            deduct=dval
                    break
            if(deduct==0):
                cur.execute("UPDATE cart SET Offer_ID = %s WHERE Cart_ID = %s",(None,cart_id))
                my_sql.connection.commit()
                cur.close()
            else:
                cur.execute("UPDATE cart SET Offer_ID = %s WHERE Cart_ID = %s",(my_tup[0],cart_id))
                total_val=total_val-deduct
                cur.execute("UPDATE cart SET Final_Amount = %s WHERE Cart_ID = %s",(total_val,cart_id))
                my_sql.connection.commit()
                cur.close()
        for item in customer_cart_list:
            product_name = item['Name']
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
        return redirect('/placeOrder'+'/'+str(user_id))
    return render_template('order.html',list=customer_cart_list)

@app.route('/HomePage')
@app.route('/')
def homePage():
    return render_template('homepage.html')

@app.route('/loginRegisterSeller')
def loginRegisterSeller():
    return render_template('loginregisterSeller.html')

@app.route('/loginRegisterUser')
def loginRegisterUser():
    return render_template('loginregisterUser.html')

@app.route('/loginRegisterAdmin')
def loginRegisterAdmin():
    return render_template('loginregisterAdmin.html')

@app.route('/placeOrder/<user_id>',methods=['GET','POST'])
def order_placing(user_id):
    global total_val
    if request.method=='POST':
        orderDetails = request.form
        HNO = orderDetails['HNO']
        City = orderDetails['City']
        State = orderDetails['State']
        Pincode = orderDetails['Pincode']
        Mode = orderDetails['Mode']
        curr_date = date.today()
        now = datetime.now()
        current_time = now.strftime("%H:%M:%S")
        cur = my_sql.connection.cursor()
        rand_delivery_boy = cur.execute("SELECT Delivery_Boy_ID FROM delivery_boy")
        if rand_delivery_boy >0:
            rand_boy = cur.fetchall()
            boy_key = random.choice(rand_boy)
        cur.execute("INSERT INTO orders(Mode,Amount,City,State,Order_Time,House_Flat_No,Pincode,Cart_ID,Date,Delivery_Boy_ID) VALUES(%s, %s, %s, %s, %s,%s,%s,%s,%s,%s)",(Mode,total_val,City,State,current_time,HNO,Pincode,cart_id,curr_date,boy_key))
        flash('Your Order has been placed Successfully !')
        my_sql.connection.commit()
        cur.close()
    return render_template('orderDetails.html',total_val=total_val)

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
        flash('You have registered successfully !')
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
        flash('You have registered successfully !')
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
            flash('You have registered successfully !')
        my_sql.connection.commit()
        cur.close()
    return render_template('sellerRegister.html')
        
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
            else:
                reinitialize()
                url_direct = '/home'+'/'+str(c_tup[0])
                return redirect(url_direct)
    return render_template('UserLogin.html')

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
            else:
                url_direct = '/admin'+'/'+str(c_tup[0])
                return redirect(url_direct)
    return render_template('AdminLogin.html')

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
            else:
                url_direct = '/sell'+'/'+str(c_tup[0])
                return redirect(url_direct)
    return render_template('SellerLogin.html')

class StaticClass:
    
    cart_id = random.randint(1000,100000)

    @staticmethod
    def giveCartId():
        StaticClass.cart_id +=1
        return StaticClass.cart_id