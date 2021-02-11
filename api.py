#Author: Paweł Zborowski s16217
import requests
import json
import unittest

data_end = '2021-02-10'
url = "http://api.nbp.pl/api/cenyzlota/2021-02-08/".format(data_end)
head = {'content-type': 'application/json'}
response = requests.request("GET", url)
dane = json.loads(response.text)
expexted = ['data', 'cena']
current = []

print(dane)
#Check Key
#_______________________________

for dictionary in dane:
    for key in dictionary:
        if key in expexted:
            current.append(key)

assert expexted == current

if expexted == current:
    print("true")
else:
    print("false")

#Check Value
#_______________________________

#print(key)

for dictionary in dane:
    for key in dictionary:
        if key == 'data':
            data = '2021-02-08'
        if key == 'cena':
            cena = '217.7'

print(data, cena)

#Check response
#______________________________________________
assert response.status_code == 200

if response.status_code == 200:
    print("true")
else:
    print("false")

#Check response (not correct) - because it's only availabe request "GET"
#______________________________________________
url = "http://api.nbp.pl/api/cenyzlota/2021-02-08/".format(data_end)
response = requests.request("DELETE", url)
assert response.status_code == 404

if response.status_code == 404:
    print("true")
else:
    print("false")

#Check response (not correct) without "cenyzlota in url"
#______________________________________________
url = "http://api.nbp.pl/api/2021-02-08/".format(data_end)
response = requests.request("GET", url)
assert response.status_code == 404

if response.status_code == 404:
    print("true")
else:
    print("false")

