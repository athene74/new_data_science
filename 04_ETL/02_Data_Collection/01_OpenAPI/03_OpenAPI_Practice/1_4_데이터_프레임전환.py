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
    url = 'http://openapi.tour.go.kr/openapi/service/EdrcntTourismStatsService/getEdrcntTourismStatsList'
    params = {'serviceKey': access_key ,
              '_type' : 'json',
              'YM' : 202305,
              'NAT_CD':100,
              'ED_CD':'D'
              }
    response = requests.get(url, params=params)
    return response.text

raw_str_json = get_request_url()
print(raw_str_json)
print(type(raw_str_json)) # 응답받은 데이터는 문자열이기 때문에 JSON 타입으로 변경을 해야한다.

raw_json = json.loads(raw_str_json)
print(type(raw_json))

print(raw_json['response']['body']['items']['item'])

data = []
# [
#   [ ] : 행데이터
#]
#
parsed_json = raw_json['response']['body']['items']['item']
# 분석할 데이터 컬럼 선택
data.append([
    pd.to_datetime(parsed_json['ym'], format="%Y%m"), # 시계열 데이터 문자열을 날짜 타입으로 변경
    parsed_json['natKorNm'], parsed_json['num']
])

df = pd.DataFrame(data=data, columns=['날짜','국가','여행자수'])
df = df.set_index("날짜") # 시계열 분석을 위해서 날짜 열을 행의 인덱스로 전환
print(df)
