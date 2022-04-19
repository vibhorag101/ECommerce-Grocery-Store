import yaml
from flask import Flask, render_template, request
from flask_mysqldb import MySQL


app = Flask(__name__)
# from market import routes

# Configure database
db = yaml.load (open('database.yaml'))
app.config['MYSQL_HOST'] = db['mysql_host']
app.config['MYSQL_USER'] = db['mysql_user']
app.config['MYSQL_PASSWORD'] = db['mysql_password']
app.config['MYSQL_DB'] = db['mysql_db']
mysql = MySQL(app)
