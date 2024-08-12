# 목적: 파이썬 코드를 활용하여 OpenAPI 호출 자동화
# Step1: OpenAPI를 제공하는 사이트에서 제공하는 샘플 프로그램을 확보한다.
# 공공데이터포털 사이트에서 '한국전력거래소_발전원별 발전량(계통기준)' OPEN API를 내려받아 사용한다.

# 검증된 URL
# http://apis.data.go.kr/B552115/PwrAmountByGen/getPwrAmountByGen?serviceKey=

#파라메터 세팅
# params ={키1:값1, .... , 키N:값N  }
#
# response = requests.get(url, params=params)
# print(response.content)
import requests


# 인코딩키가 되지 않으면 디코딩키로 할 것
# access_key ='Yff2okQ2i8jEUaDanPqgbSuRzoFOaP0AfYzU7Mkhe4QP9tapdiZiOvmhk%2BZeOrBMrxJqbxU6M58b1OeuM%2FOKsg%3D%3D'
access_key ='Yff2okQ2i8jEUaDanPqgbSuRzoFOaP0AfYzU7Mkhe4QP9tapdiZiOvmhk+ZeOrBMrxJqbxU6M58b1OeuM/OKsg=='
def get_request_url():
    url = 'http://apis.data.go.kr/B552115/PwrAmountByGen/getPwrAmountByGen'
    params = {'serviceKey': access_key ,
              'numOfRows' : 10,
              'pageNo' : 1,
              'dataType': 'JSON',
              'baseDate': 20240801
    }
    response = requests.get(url, params=params)

    return response.text

raw_str_json = get_request_url()
print(raw_str_json)