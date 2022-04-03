from flask import Flask, render_template, flash, redirect, url_for, request, session
import mysql.connector
import mysql.connector as mysql
import pyautogui as pag
from win10toast import ToastNotifier

toaster = ToastNotifier()
# enter your server IP address/domain name
HOST = "127.0.0.1"  # or "domain.com"
# database name, if you want just to connect to MySQL server, leave it empty
DATABASE = "hospital"
# this is the user you create
USER = "root"
# user password
PASSWORD = "4321"

app = Flask(__name__, template_folder='templates')


@app.route('/')
@app.route('/index.html')
def index():
    return render_template('index.html')


@app.route('/doctor.html')
def doc():
    return render_template('doctor.html')


@app.route('/patient.html')
def patient():
    return render_template('patient.html')


@app.route('/admin.html')
def admin():
    return render_template('admin.html')


@app.route('/doctor-add', methods=['GET', 'POST'])
def doctorAddDetails():
    if request.method == 'POST':
        d_id = request.form.get('doctor_id')
        d_name = request.form.get('doctor_name')
        d_age = request.form.get('doctor_age')
        d_gender = request.form.get('gender')
        d_address = request.form.get('doctor_address')
        print(d_gender, d_address, d_age, d_id, d_name)
        try:
            db_connection = mysql.connect(
                host=HOST, database=DATABASE, user=USER, password=PASSWORD, connection_timeout=60000)
            print("Connected to:", db_connection.get_server_info())
            mycursor = db_connection.cursor()
            sql = """insert into doctor (doctor_id,name,age,address,gender) values(%s, %s, %s, %s,%s)"""
            val = (d_id, d_name, d_age, d_address, d_gender)
            mycursor.execute(sql, val)
            db_connection.commit()
            if mycursor.rowcount > 0:
                toaster.show_toast(
                    "Status", "Doctor details added Successfully")

        except mysql.Error as err:
            toaster.show_toast("Error", "Please Enter the accurate details")
            print(err)
            print("Error Code:", err.errno)
            print("SQLSTATE", err.sqlstate)
            print("Message", err.msg)
    return render_template('doctor.html')


@app.route('/doctor-update', methods=['GET', 'POST'])
def doctorUpdateDetails():
    if request.method == 'POST':
        d_id = request.form.get('doctor_id')
        d_name = request.form.get('doctor_name')
        d_age = request.form.get('doctor_age')
        d_gender = request.form.get('gender')
        d_address = request.form.get('doctor_address')
        print(d_gender, d_address, d_age, d_id, d_name)
        try:
            db_connection = mysql.connect(
                host=HOST, database=DATABASE, user=USER, password=PASSWORD, connection_timeout=60000)
            print("Connected to:", db_connection.get_server_info())
            mycursor = db_connection.cursor()
            sql = """update doctor
                     set name=%s,
	                    age=%s,
                        gender=%s,
                        address=%s
                     where doctor_id=%s;"""
            val = (d_name, d_age, d_gender, d_address, d_id)
            mycursor.execute(sql, val)
            db_connection.commit()
            if mycursor.rowcount > 0:
                toaster.show_toast(
                    "Status", "Doctor details updated Successfully")

        except mysql.Error as err:
            toaster.show_toast(
                "Error", "Please Enter the valid/accurate details")
            print(err)
            print("Error Code:", err.errno)
            print("SQLSTATE", err.sqlstate)
            print("Message", err.msg)
    return render_template('doctor.html')


@app.route('/doctor-delete', methods=['GET', 'POST'])
def doctorDeleteDetails():
    if request.method == 'POST':
        d_id = request.form.get('doctor_id')
        d_name = request.form.get('doctor_name')
        print(d_id, d_name)
        try:
            db_connection = mysql.connect(
                host=HOST, database=DATABASE, user=USER, password=PASSWORD, connection_timeout=60000)
            print("Connected to:", db_connection.get_server_info())
            mycursor = db_connection.cursor()
            sql = """delete from doctor where doctor_id=%s and name=%s;"""
            val = (d_id, d_name)
            mycursor.execute(sql, val)
            db_connection.commit()
            if mycursor.rowcount > 0:
                toaster.show_toast(
                    "Status", "Doctor details deleted Successfully")

        except mysql.Error as err:
            toaster.show_toast(
                "Error", "Please Enter the valid/accurate details")
            print(err)
            print("Error Code:", err.errno)
            print("SQLSTATE", err.sqlstate)
            print("Message", err.msg)
    return render_template('doctor.html')


@app.route('/patient-add', methods=['GET', 'POST'])
def patientAddDetails():
    if request.method == 'POST':
        p_id = request.form.get('patient_id')
        p_name = request.form.get('patient_name')
        p_age = request.form.get('patient_age')
        p_gender = request.form.get('gender')
        p_address = request.form.get('patient_address')
        p_disease = request.form.get('disease')
        d_id = request.form.get('doctor_id')
        print(p_gender, p_address, p_age, p_id, p_name, p_disease, d_id)
        try:
            db_connection = mysql.connect(
                host=HOST, database=DATABASE, user=USER, password=PASSWORD, connection_timeout=60000)
            print("Connected to:", db_connection.get_server_info())
            mycursor = db_connection.cursor()
            sql = """insert into patient (patient_id,name,age,gender,address,disease,doctor_id) values(%s, %s, %s, %s,%s,%s,%s)"""
            val = (p_id, p_name, p_age, p_gender, p_address, p_disease, d_id)
            mycursor.execute(sql, val)
            db_connection.commit()
            if mycursor.rowcount > 0:
                toaster.show_toast(
                    "Status", "Patient details added Successfully")

        except mysql.Error as err:
            toaster.show_toast("Error", "Please Enter the accurate details")
            print(err)
            print("Error Code:", err.errno)
            print("SQLSTATE", err.sqlstate)
            print("Message", err.msg)
    return render_template('patient.html')


@app.route('/patient-update', methods=['GET', 'POST'])
def patientUpdateDetails():
    if request.method == 'POST':
        p_id = request.form.get('patient_id')
        p_name = request.form.get('patient_name')
        p_age = request.form.get('patient_age')
        p_gender = request.form.get('gender')
        p_address = request.form.get('patient_address')
        print(p_gender, p_address, p_age, p_id, p_name)
        try:
            db_connection = mysql.connect(
                host=HOST, database=DATABASE, user=USER, password=PASSWORD, connection_timeout=60000)
            print("Connected to:", db_connection.get_server_info())
            mycursor = db_connection.cursor()
            sql = """update patient
                     set name=%s,
	                    age=%s,
                        gender=%s,
                        address=%s
                     where patient_id=%s;"""
            val = (p_name, p_age, p_gender, p_address, p_id)
            mycursor.execute(sql, val)
            db_connection.commit()
            if mycursor.rowcount > 0:
                toaster.show_toast(
                    "Status", "Patient details updated Successfully")

        except mysql.Error as err:
            toaster.show_toast(
                "Error", "Please Enter the valid/accurate details")
            print(err)
            print("Error Code:", err.errno)
            print("SQLSTATE", err.sqlstate)
            print("Message", err.msg)
    return render_template('patient.html')


@app.route('/patient-delete', methods=['GET', 'POST'])
def patientDeleteDetails():
    if request.method == 'POST':
        p_id = request.form.get('patient_id')
        p_name = request.form.get('patient_name')
        print(p_id, p_name)
        try:
            db_connection = mysql.connect(
                host=HOST, database=DATABASE, user=USER, password=PASSWORD, connection_timeout=60000)
            print("Connected to:", db_connection.get_server_info())
            mycursor = db_connection.cursor()
            sql = """delete from patient where patient_id=%s and name=%s;"""
            val = (p_id, p_name)
            mycursor.execute(sql, val)
            db_connection.commit()
            if mycursor.rowcount > 0:
                toaster.show_toast(
                    "Status", "Patient details deleted Successfully")

        except mysql.Error as err:
            toaster.show_toast(
                "Error", "Please Enter the valid/accurate details")
            print(err)
            print("Error Code:", err.errno)
            print("SQLSTATE", err.sqlstate)
            print("Message", err.msg)
    return render_template('patient.html')


@app.route('/admin', methods=['GET', 'POST'])
def adminAuth():
    if request.method == 'POST':
        id = request.form.get('admin_id')
        password = request.form.get('admin_password')
        print(id, password)
        print(type(id))
        try:
            db_connection = mysql.connect(
                host=HOST, database=DATABASE, user=USER, password=PASSWORD, connection_timeout=60000)
            print("Connected to:", db_connection.get_server_info())
            mycursor = db_connection.cursor()
            sql = "select password from admin_auth where id="+"'"+id+"';"
            print(sql)
            mycursor.execute(sql)
            res = mycursor.fetchone()
            print(res[0])

            if res[0] == password:
                toaster.show_toast(
                    "Status", "Login successfully")
                response = 'doctor.html'
            else:
                toaster.show_toast(
                    "Login failed", "Id or password is incorrect!")
                response = 'admin.html'

        except mysql.Error as err:
            toaster.show_toast(
                "Error", "Please Enter the valid/accurate details")
            print(err)
            print("Error Code:", err.errno)
            print("SQLSTATE", err.sqlstate)
            print("Message", err.msg)
    return render_template(response)


if __name__ == "__main__":
    app.run(debug=True)
