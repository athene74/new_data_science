# 목적: 시간정보 파라메터를 현재 시간 정보를 통해 자동 생성
# 목적: 파이썬 코드를 활용하여 OpenAPI 호출 자동화
# Step1: OpenAPI를 제공하는 사이트에서 제공하는 샘플 프로그램을 확보한다.
# 공공데이터포털 사이트에서 '한국전력거래소_발전원별 발전량(계통기준)' OPEN API를 내려받아 사용한다.

# 검증된 URL
# http://apis.data.go.kr/B552115/PwrAmountByGen/getPwrAmountByGen?serviceKey=

# 파라메터 세팅
# params ={키1:값1, .... , 키N:값N  }
#
# response = requests.get(url, params=params)
# print(response.content)
import requests
import json
import time
# access_key ='Yff2okQ2i8jEUaDanPqgbSuRzoFOaP0AfYzU7Mkhe4QP9tapdiZiOvmhk%2BZeOrBMrxJqbxU6M58b1OeuM%2FOKsg%3D%3D'
access_key = 'Yff2okQ2i8jEUaDanPqgbSuRzoFOaP0AfYzU7Mkhe4QP9tapdiZiOvmhk+ZeOrBMrxJqbxU6M58b1OeuM/OKsg=='
def get_request_url():
    url = 'http://apis.data.go.kr/B552115/PwrAmountByGen/getPwrAmountByGen'
    params = {'serviceKey': access_key ,
              'numOfRows' : 10,
              'pageNo' : 1,
              'dataType': 'JSON',
              'baseDate': base_date
    }
    response = requests.get(url, params=params)
    return response.text

base_date = time.strftime('%Y%m%d') # baseDate는 년원일(YYYYMMDD) 8자리로 입력할 때에만 응답한다.
# print(base_date)

raw_str_json = get_request_url()
print(raw_str_json)
print(type(raw_str_json)) # 응답받은 데이터는 문자열이기 때문에 JSON 타입으로 변경을 해야한다.

# 실데이터 추출을 위해 dict(json)타입으로 변경
raw_json = json.loads(raw_str_json)
print(type(raw_json))

# 실데이터 추출
print(raw_json['response']['body']['items']['item'])

