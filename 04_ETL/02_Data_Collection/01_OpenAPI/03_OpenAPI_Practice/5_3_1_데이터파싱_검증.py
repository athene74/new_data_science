response = {
  "response": {
    "header": {
      "resultCode": "00",
      "resultMsg": "OK"
    },
    "body": {
      "dataType": "JSON",
      "totalCount": "141368",
      "numOfRows": "1",
      "pageNo": "1",
      "items": {
        "item": [
          {
            "fuelPwr7": 110.121,
            "fuelPwr8": 3623.07,
            "fuelPwr5": -1466.35,
            "fuelPwr6": 16548.8,
            "fuelPwrTot": 57497.9,
            "baseDatetime": "20230328044500",
            "fuelPwr9": 0,
            "rn": 1,
            "fuelPwr3": 18204.9,
            "fuelPwr4": 20113.8,
            "fuelPwr1": 30.7481,
            "fuelPwr2": 328.881
          }
        ]
      }
    }
  }
}

print(type(response))
# print(response['response'])
print(response['response']['body']['items']['item'])