

import datetime
import pymongo as pmg
import json
import os
import sys
import csv


os.chdir(os.path.dirname(os.path.abspath(__file__)))
rowID = 0
headers = []
rows = []
with open('data\crash-data-2015.csv','r') as inputFile:
    for line in inputFile:
        if headers == []:
            headers = line.split(',')
            headers.insert(0,'_id')
        else:
            rows.append(line)
inputFile.close()
wellingtonData = []
print "Loaded"
print len(rows)
for row in rows:
    if 'Wellington City' in row:
        string = '"' + str(rowID) + '",'+row
        rowID = rowID +1
        wellingtonData.append(string)

csvdata = csv.DictReader(wellingtonData, headers, delimiter=',')

client= pmg.MongoClient()
try:
    db = client['CrashData']
    collection = db['2015']
    for row in csvdata:
        del row[None]
        collection.insert_one(row)
    print client.database_names()

    
except Exception as e:
    client.drop_database('CrashData')
    print e
finally:
    client.close()
        
    
