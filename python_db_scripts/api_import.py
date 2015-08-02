

import json
import os
import sys
import csv

def logicConversion(properties): #Method for checking fields in the json data and changing those fields and other fields based on what they contain
    icon = {'iconUrl':'temp', 'iconSize': [10,10], 'iconAnchor':[25,25]}#Default icon settings
    if int(properties['CRASH SEV CNT']) > 0: #If crash has severe injuries
        properties['marker-color'] = '#FF3300' #Change the marker color
        properties['marker-size'] = 'large' #Change the marker size
        icon['iconSize']=[50,50] #Change the icon size
        properties['Injuries'] = 'Serious Injuries' #Add a field for injury text and place text in it
    elif int(properties['CRASH MIN CNT']) > 0: #If crash has minor injuries
        properties['marker-color'] = '#FFFF00' #Change the marker color
        properties['marker-size'] = 'medium' #Change the marker size
        icon['iconSize']=[25,25] #Change the icon size
        properties['Injuries'] = 'Minor Injuries' #Add a field for injury text and place text in it
    elif int(properties['CRASH FATAL CNT']) > 0: #If crash has fatal injuries
        properties['marker-color'] = '#000000'#Change the marker color
        properties['marker-size'] = 'large' #Change the marker size
        icon['iconSize']=[50,50] #Change the icon size
        properties['Injuries'] = 'Fatal Injuries' #Add a field for injury text and place text in it
    else: #If there are no injuries
        properties['marker-color'] = '#3366FF' #Change the marker color
        properties['marker-size'] = 'small' #Change the marker size
        properties['Injuries'] = 'No Injuries' #Add a field for injury text and place text in it

    if properties['MVMT'][0] == 'A': #Adds correct incident description text based on the code provided
        properties['MVMT'] = 'Overtaking and Lane Change'
        icon['iconUrl'] = '/images/1.png' #Also changed the icon depending on the incident code
    elif properties['MVMT'][0] == 'B':
        properties['MVMT'] = 'Head On'
        icon['iconUrl'] = '/images/2.png'
    elif properties['MVMT'][0] == 'C':
        properties['MVMT'] = 'Lost Control or Off Road (Straight Roads)'
        icon['iconUrl'] = '/images/3.png'
    elif properties['MVMT'][0] == 'D':
        properties['MVMT'] = 'Cornering'
        icon['iconUrl'] = '/images/4.png'
    elif properties['MVMT'][0] == 'E':
        properties['MVMT'] = 'Collision with Obstruction'
        icon['iconUrl'] = '/images/2.png'
    elif properties['MVMT'][0] == 'F':
        properties['MVMT'] = 'Rear End'
        icon['iconUrl'] = '/images/5.png'
    elif properties['MVMT'][0] == 'G':
        properties['MVMT'] = 'Turning Versus Same Direction'
        icon['iconUrl'] = '/images/6.png'
    elif properties['MVMT'][0] == 'H':
        properties['MVMT'] = 'Crossing (No Turns)'
        icon['iconUrl'] = '/images/7.png'
    elif properties['MVMT'][0] == 'J':
        properties['MVMT'] = 'Crossing (Vehicle Turning)'
        icon['iconUrl'] = '/images/8.png'
    elif properties['MVMT'][0] == 'K':
        properties['MVMT'] = 'Merging'
        icon['iconUrl'] = '/images/9.png'
    elif properties['MVMT'][0] == 'L':
        properties['MVMT'] = 'Right Against Turn'
        icon['iconUrl'] = '/images/9.png'
    elif properties['MVMT'][0] == 'M':
        properties['MVMT'] = 'Manoeuvring'
        icon['iconUrl'] = '/images/10.png'
    elif properties['MVMT'][0] == 'N':
        properties['MVMT'] = 'Pedestrians Crossing Road'
        icon['iconUrl'] = '/images/11.png'
    elif properties['MVMT'][0] == 'P':
        properties['MVMT'] = 'Pedestrians Other'
        icon['iconUrl'] = '/images/11.png'
    elif properties['MVMT'][0] == 'Q':
        properties['MVMT'] = 'Miscellaneous'
        icon['iconUrl'] = '/images/12.png'
    #properties['icon'] = icon

    light = '' #Stores information for the light string
    if properties['LIGHT'][0]=='B': #Sets the light string based on the light code given
        light = 'Bright Sun'
    elif properties['LIGHT'][0]=='O':
        light = 'Overcast'
    elif properties['LIGHT'][0]=='T':
        light = 'Twilight'
    elif properties['LIGHT'][0]=='D':
        light = 'Dark'

    if properties['LIGHT'][1] == 'O': #Add to the light string based on the second light code if one is given
        properties['LIGHT'] = light + " / Street Lights On"
    elif properties['LIGHT'][1] == 'F':
        properties['LIGHT'] = light + " / Street Lights Off"
    elif properties['LIGHT'][1] == 'N':
        properties['LIGHT'] = light + " / No Street Lights Present"
    else: #If no second code is given, just set the light field with the current light string
        properties['LIGHT'] = light
    return properties #Return the modified properties



os.chdir(os.path.dirname(os.path.abspath(__file__))) #Change the directory to the current source code location
rowID = 0 #Initilise the unique row ID

year = 2014 #Starting year for the data we are using
geoObjects = [] #Initilise the geoObjects storage list
while True: #Just keep looping until we hit 2016
    if year == 2016:
        break #Once we hit 2016, break as we have no more data
    #If given more time I would modifiy this to break on IOException rather than a specific year so I don't
    #need to change code each year
    rows = [] #Initilise rows storage
    headers = [] #Initilise headers storage
    i = 0
    with open('data\crash-data-'+str(year)+'.csv','r') as inputFile: #Open the current year file as inputFile
        for line in inputFile: #For each line in the inputFile
            if i == 0: #If we dont have headers
                headers = line.strip('\n').split(',') #THen get the headers
                headers.insert(0,'_id')
                i+=1 #Tells us we have the headers
            else:#Otherwise strip and split the line and store
                rows.append(line.strip('\n').split(','))
    inputFile.close() #Be a tidy kiwi and close the file
    idedData = [] #Stores just data after it has ben given id
    print "Loaded" #Tells us the file has been loaded
    print len(rows) #Tells us how many rows were loaded
    for row in rows: #For each row
        if 'Wellington City' in row: #Filter to just wellington data
            row.insert(0,rowID) #Give the row a unique id
            rowID = rowID +1 #Increment the current ID tracker
            idedData.append(row) #add the row to idedData
            

    
    for row in idedData:
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



