import MySQLdb
import time
import datetime
#import tkinter
#from tkinter import messagebox
from datetime import datetime 
import random

database = MySQLdb.connect("localhost","root","","db_jamur")
cursor = database.cursor()

sql2 = cursor.execute("select count(*) from tb_setpoint")
data = cursor.fetchone()

jml = data[0]
w = 1

#PILIH JAMUR
print("=====pilih_jamur======") 
while w < jml+1 :
        z = str(w)
        sql = cursor.execute("select nama_jamur from tb_setpoint where id_jamur ='"+z+"'")
        jamur = cursor.fetchone()
        t = str(jamur[0])
        print(w,t)
        w+=1
nm_jamur =  str(input("masukkan nama jamur : "))

# Pilih Sensor
print("=======Sensor======")
print("1.Suhu")
print("2.Kelembapan")

sensor = int(input("Sensor Yang Dipilih :"))

lama_pengecekan = input("Jangka Waktu : ")
jumlah_pengecekan = input("Jumlah Pengecekan : ")

a = cursor.execute(
    "select * from tb_setpoint where nama_jamur like '%"+nm_jamur+"%'")
b = cursor.fetchone()
id_jamur = str(b[0])

# Sensor Suhu
if sensor == 1:
    pilih_tabel = 'tb_suhu'
    nilai = 0
    jps = int(jumlah_pengecekan)
    wps = int(lama_pengecekan)
    nilai_max = jps
    while nilai < nilai_max:
        ph = str(random.randint(10, 37))
        t_end = time.time() + 60 * wps
        v = 0
        tbl_ph = []

        while time.time() < t_end:
            print("-----")
            v += 1

        waktu = str(datetime.now())
        inp_ph = id_jamur, waktu, ph
        tbl_ph.append(inp_ph)
        sq = "insert into "+pilih_tabel+" (id_jamur,waktu,suhu) values (%s,%s,%s)"
        inpt = cursor.executemany(sq, tbl_ph)
        print("Data Pengecekan Berhasil", tbl_ph)

        nilai += 1

# Sensor Kelembapan
if sensor == 2:
    pilih_tabel = 'tb_humidity'
    nilai = 0
    jps = int(jumlah_pengecekan)
    wps = int(lama_pengecekan)
    nilai_max = jps
    while nilai < nilai_max:
        ph = str(random.randint(10, 37))
        t_end = time.time() + 60 * wps
        v = 0
        tbl_ph = []

        while time.time() < t_end:
            print("-----")
            v += 1

        waktu = str(datetime.now())
        inp_ph = id_jamur, waktu, ph
        tbl_ph.append(inp_ph)
        sq = "insert into "+pilih_tabel+" (id_jamur,Waktu,kelembapan) values (%s,%s,%s)"
        inpt = cursor.executemany(sq, tbl_ph)
        print("Data Pengecekan Berhasil", tbl_ph)

        nilai += 1

database.commit()
database.close()
