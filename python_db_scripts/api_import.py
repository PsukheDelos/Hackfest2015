

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
            headers = line.strip('\n').split(',')
            headers.insert(0,'_id')
        else:
            rows.append(line.strip('\n').split(','))
inputFile.close()
wellingtonData = []
print "Loaded"
print len(rows)
for row in rows:
    row.insert(0,rowID)
    rowID = rowID +1
    wellingtonData.append(row)
        

geoObjects = []
for row in wellingtonData:
    length = len(row)
    coords = [float(row[length-1]),float(row[length-2])]
    properties = {}
    for i in xrange(0,length-2):
        properties[headers[i]] = row[i]
    geojson_obj = {"type":"Feature","geometry":{"type":"Point","coordinates": coords},'properties':properties}
    geoObjects.append(geojson_obj)

geoFileInput = {"type":"FeatureCollection", "features":geoObjects}
geoFile = open(os.path.abspath(os.path.join(os.path.dirname(__file__),'..','src','main','resources','public','data', '2015.txt')), 'w+')
geoFile.write(json.dumps(geoFileInput))
geoFile.close()



