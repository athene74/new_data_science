import requests
import json
import pandas as pd

access_key ='IlZ7RtUxbjbhLasNibsu0BLs3Yn5mA2szeYP/nWPZbhdOAEGuD9NXzjKJjPvQLYPZ8D/sN8oqImmuuvmosCrGw=='
pd.set_option('display.max_rows', None)
pd.set_option('display.max_colwidth', None)

def get_request_url(number):
    url = 'http://apis.data.go.kr/B552584/EvCharger/getChargerInfo'
    data = []

    params = {'serviceKey': access_key , 'numOfRows' : 200, 'pageNo' : 1,
        'dataType' : 'JSON'
    }

    response = requests.get(url, params=params)
    raw_json = response.json()
    for i in range (0,number):
        i = i +1
        if 'item' in raw_json['items']:
            items = raw_json['items']['item']
            data.append([
                items[i],
            ])
            df = pd.DataFrame(data)
    print(df)

df = get_request_url(150)


# raw_str_json = get_request_url()
# print(raw_str_json)
# raw_json = json.loads(raw_str_json)
# print(raw_json['items']['item'])
#
# parsed_json = raw_json['items']['item']
#
# df = pd.DataFrame(parsed_json)
# df_selected = df[['statNm','addr','useTime']]
# df_selected = df_selected.set_index('addr')
#
# print(df_selected)