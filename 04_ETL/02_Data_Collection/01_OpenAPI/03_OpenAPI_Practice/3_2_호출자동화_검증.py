# 목적: 파이썬 코드를 활용하여 OpenAPI 호출 자동화
# Step1: OpenAPI를 제공하는 사이트에서 제공하는 샘플 프로그램을 확보한다.

# 검증된 URL
# http://openapi.tour.go.kr/openapi/service/EdrcntTourismStatsService/getEdrcntTourismStatsList?serviceKey=

#파라메터 세팅
# params ={키1:값1, .... , 키N:값N  }
#
# response = requests.get(url, params=params)
# print(response.content)
import requests
import json
# 인코딩키가 되지 않으면 디코딩키로 할 것
# access_key ='Yff2okQ2i8jEUaDanPqgbSuRzoFOaP0AfYzU7Mkhe4QP9tapdiZiOvmhk%2BZeOrBMrxJqbxU6M58b1OeuM%2FOKsg%3D%3D'
access_key ='Yff2okQ2i8jEUaDanPqgbSuRzoFOaP0AfYzU7Mkhe4QP9tapdiZiOvmhk+ZeOrBMrxJqbxU6M58b1OeuM/OKsg=='
def get_request_url():
# http 뒤의 s를 빼줘야 함수가 정상동작함
#   url = 'https://apis.data.go.kr/B551893/fuel-cell-by-hour/list'
    url = 'http://apis.data.go.kr/B551893/fuel-cell-by-hour/list'
    params = {'serviceKey': access_key,
              'startD': 20240601,
              'endD': 20240630
              }
    response = requests.get(url, params=params)
    return response.text

raw_str_json = get_request_url()
print(raw_str_json)