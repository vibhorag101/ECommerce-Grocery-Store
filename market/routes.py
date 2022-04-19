from flask import render_template, request
from market import my_sql
from market import app


@app.route('/home')
@app.route('/')
def home():
    return render_template('home.html')



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
        cur.execute("INSERT INTO customer(First_Name,Last_Name,Email,Mobile_No,Password) VALUES(%s %s)",First_Name,Last_Name,Email,Mobile_No,Password)
        my_sql.connection.commit()
        cur.close()
    return render_template('customerRegister.html')
