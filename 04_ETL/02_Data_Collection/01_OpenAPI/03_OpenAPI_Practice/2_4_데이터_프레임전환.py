# 목적: 시간정보 파라메터를 현재 시간 정보를 통해 자동 생성


import requests
import json
import time
import pandas as pd
# access_key ='Yff2okQ2i8jEUaDanPqgbSuRzoFOaP0AfYzU7Mkhe4QP9tapdiZiOvmhk%2BZeOrBMrxJqbxU6M58b1OeuM%2FOKsg%3D%3D'
access_key = 'Yff2okQ2i8jEUaDanPqgbSuRzoFOaP0AfYzU7Mkhe4QP9tapdiZiOvmhk+ZeOrBMrxJqbxU6M58b1OeuM/OKsg=='
# 가산동 격자 x, 격자 y 정보
nx = 58
ny = 125
def get_request_url():
    url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'
    params = {'serviceKey': access_key,
              'dataType': 'json',
              'base_date': base_date,
              'base_time': day_time,
              'nx': 55,
              'ny': 127
              }
    response = requests.get(url, params=params)
    return response.text

base_date = time.strftime('%Y%m%d')
# print(base_date)
day_time = time.strftime("%H%M")
# print(day_time)


raw_str_json = get_request_url()
print(raw_str_json)
print(type(raw_str_json)) # 응답받은 데이터는 문자열이기 때문에 JSON 타입으로 변경을 해야한다.

# 실데이터 추출을 위해 dict(json)타입으로 변경
raw_json = json.loads(raw_str_json)
print(type(raw_json))

# 실데이터 추출
print(raw_json['response']['body']['items']['item'])
parsed_jasion = raw_json['response']['body']['items']['item']
df = pd.DataFrame(parsed_jasion)
print(df)