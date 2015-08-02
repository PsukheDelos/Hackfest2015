

import json
import os
import sys
import csv

def logicConversion(properties):
    if int(properties['CRASH SEV CNT']) > 0:
        properties['marker-color'] = '#FF3300'
        properties['marker-size'] = 'large'
        properties['Injuries'] = 'Serious Injuries'
    elif int(properties['CRASH MIN CNT']) > 0:
        properties['marker-color'] = '#FFFF00'
        properties['marker-size'] = 'medium'
        properties['Injuries'] = 'Minor Injuries'
    elif int(properties['CRASH FATAL CNT']) > 0:
        properties['marker-color'] = '#000000'
        properties['marker-size'] = 'large'
        properties['Injuries'] = 'Fatal Injuries'
    else:
        properties['marker-color'] = '#3366FF'
        properties['marker-size'] = 'small'
        properties['Injuries'] = 'No Injuries'

    if properties['MVMT'][0] == 'A':
        properties['MVMT'] = 'Overtaking and Lane Change'
    elif properties['MVMT'][0] == 'B':
        properties['MVMT'] = 'Head On'
    elif properties['MVMT'][0] == 'C':
        properties['MVMT'] = 'Lost Control or Off Road (Straight Roads)'
    elif properties['MVMT'][0] == 'D':
        properties['MVMT'] = 'Cornering'
    elif properties['MVMT'][0] == 'E':
        properties['MVMT'] = 'Collision with Obstruction'
    elif properties['MVMT'][0] == 'F':
        properties['MVMT'] = 'Rear End'
    elif properties['MVMT'][0] == 'G':
        properties['MVMT'] = 'Turning Versus Same Direction'
    elif properties['MVMT'][0] == 'H':
        properties['MVMT'] = 'Crossing (No Turns)'
    elif properties['MVMT'][0] == 'J':
        properties['MVMT'] = 'Crossing (Vehicle Turning)'
    elif properties['MVMT'][0] == 'K':
        properties['MVMT'] = 'Merging'
    elif properties['MVMT'][0] == 'L':
        properties['MVMT'] = 'Right Against Turn'
    elif properties['MVMT'][0] == 'M':
        properties['MVMT'] = 'Manoeuvring'
    elif properties['MVMT'][0] == 'N':
        properties['MVMT'] = 'Pedestrians Crossing Road'
    elif properties['MVMT'][0] == 'P':
        properties['MVMT'] = 'Pedestrians Other'
    elif properties['MVMT'][0] == 'Q':
        properties['MVMT'] = 'Miscellaneous'

    light = ''
    if properties['LIGHT'][0]=='B':
        light = 'Bright Sun'
    elif properties['LIGHT'][0]=='O':
        light = 'Overcast'
    elif properties['LIGHT'][0]=='T':
        light = 'Twilight'
    elif properties['LIGHT'][0]=='D':
        light = 'Dark'

    if properties['LIGHT'][1] == 'O':
        properties['LIGHT'] = light + " / Street Lights On"
    elif properties['LIGHT'][1] == 'F':
        properties['LIGHT'] = light + " / Street Lights Off"
    elif properties['LIGHT'][1] == 'N':
        properties['LIGHT'] = light + " / No Street Lights Present"
    else:
        properties['LIGHT'] = light
    return properties



os.chdir(os.path.dirname(os.path.abspath(__file__)))
rowID = 0

year = 2012
geoObjects = []
while True:
    if year == 2016:
        break
    rows = []
    headers = []
    with open('data\crash-data-'+str(year)+'.csv','r') as inputFile:        
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
        if 'Wellington City' in row:
            row.insert(0,rowID)
            rowID = rowID +1
            wellingtonData.append(row)
            

    
    for row in wellingtonData:
        length = len(row)
        coords = [float(row[length-1]),float(row[length-2])]
        properties = {}
        for i in xrange(0,length-2):
            properties[headers[i]] = row[i]
        properties = logicConversion(properties)
        geojson_obj = {"type":"Feature","geometry":{"type":"Point","coordinates": coords},'properties':properties}
        geoObjects.append(geojson_obj)
    print len(geoObjects)
    year += 1

    
geoFileInput = {"type":"FeatureCollection", "features":geoObjects}
geoFile = open(os.path.abspath(os.path.join(os.path.dirname(__file__),'..','src','main','resources','public','data', 'CrashDataFormated.txt')), 'w+')
geoFile.write(json.dumps(geoFileInput))
geoFile.close()



