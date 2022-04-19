from http.client import HTTPResponse
from flask import render_template
from market import app


@app.route('/register')
def home():
    return render_template('register.html')