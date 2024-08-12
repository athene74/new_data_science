# 목적: 파이썬 코드를 활용하여 OpenAPI 호출 자동화
# Step1: OpenAPI를 제공하는 사이트에서 제공하는 샘플 프로그램을 확보한다.

# 검증된 URL
# http://openapi.tour.go.kr/openapi/service/EdrcntTourismStatsService/getEdrcntTourismStatsList?serviceKey=VNH7QeBnhzad%2B45QS4DMbIvJp0s%2Fx2iY9vdKxLYJJJEHMFFHDLr8HZJHuPgfjWRTg22OklmBOuSWznNeJktguQ%3D%3D&_type=json&YM=202402&NAT_CD=100&ED_CD=D

#파라메터 세팅
# params ={키1:값1, .... , 키N:값N  }
#
# response = requests.get(url, params=params)
# print(response.content)
import requests
import json
import pandas as pd

# access_key ='Yff2okQ2i8jEUaDanPqgbSuRzoFOaP0AfYzU7Mkhe4QP9tapdiZiOvmhk%2BZeOrBMrxJqbxU6M58b1OeuM%2FOKsg%3D%3D'
access_key = 'Yff2okQ2i8jEUaDanPqgbSuRzoFOaP0AfYzU7Mkhe4QP9tapdiZiOvmhk+ZeOrBMrxJqbxU6M58b1OeuM/OKsg=='
def get_request_url():
    # http 뒤의 s를 빼줘야 함수가 정상동작함
    # url = 'https://apis.data.go.kr/B551893/fuel-cell-by-hour/list'
    url = 'http://apis.data.go.kr/B551893/fuel-cell-by-hour/list'
    params = {'serviceKey': access_key,
              'startD': 20240601,
              'endD': 20240630
              }
    response = requests.get(url, params=params)
    return response.text


raw_str_json = get_request_url()
# print(raw_str_json)
# print(type(raw_str_json))

# 실데이터 추출을 위해 dict(json)타입으로 변경
raw_json = json.loads(raw_str_json)
# print(type(raw_json))
# print(raw_json)

# for content_element in raw_json['reponse']['body']['content']:
#     print(content_element)

parsed_json = raw_json['reponse']['body']['content']

df= pd.DataFrame(parsed_json)
print(df)


df = pd.DataFrame(df, columns=['dgenYmd','ipptNam','qsum'])
df.columns=['날짜','발전소명','총량']
df = df.set_index("날짜") # 시계열 분석을 위해서 날짜 열을 행의 인덱스로 전환
print(df)
