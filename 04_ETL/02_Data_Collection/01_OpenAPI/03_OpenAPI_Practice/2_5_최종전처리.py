# 목적: 파이썬 코드를 활용하여 OpenAPI 호출 자동화
# Step1: OpenAPI를 제공하는 사이트에서 제공하는 샘플 프로그램을 확보한다.

import requests
import time
import json
import pandas as pd
# access_key ='Yff2okQ2i8jEUaDanPqgbSuRzoFOaP0AfYzU7Mkhe4QP9tapdiZiOvmhk%2BZeOrBMrxJqbxU6M58b1OeuM%2FOKsg%3D%3D'
access_key = 'Yff2okQ2i8jEUaDanPqgbSuRzoFOaP0AfYzU7Mkhe4QP9tapdiZiOvmhk+ZeOrBMrxJqbxU6M58b1OeuM/OKsg=='
# 가산동 격자 x, 격자 y 정보
nx = 58
ny = 125
def get_request_url():
    url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'
    params = {'serviceKey': access_key , 'numOfRows' : 10, 'pageNo' : 1,
        'dataType': 'json','base_date':base_date,'base_time':day_time,'nx':nx,'ny':ny
    }
    response = requests.get(url, params=params)
    # response.content # => response.content는 한글이 인코딩된 형식이므로
    #                       response.text 를 응답받기로함
    return response.text

def preprocess_df(df):

    df.insert(0,'date_time', df['baseDate']+df['baseTime'])

    p_df = pd.pivot(df, index='date_time', columns=['category'],values='obsrValue') # 하나의 행으로 데이터를 피봇
    nx = df.loc[0,'nx']
    ny = df.loc[0,'ny']
    date_time = df.loc[0,'baseDate'] + ' ' + df.loc[0,'baseTime']
    p_df.insert(0,'date_time',[date_time])
    p_df.insert(1,'nx',[nx])
    p_df.insert(2,'ny',[ny])

    p_df.rename(columns={
        'date_time':'DATE_TIME', 'nx':'NX', 'ny': 'NY', 'PTY':'강수형태',
        'REH':'습도','RN1':'시간1_강수량','T1H':'기온',
        'UUU':'동서바람성분','VEC':'풍향','VVV':'남북바람성분','WSD':'풍속'
       }, inplace=True) # 열의 이름을 해석

    redefined_columns = ['DATE_TIME','NX', 'NY', '기온', '시간1_강수량', '강수형태',
                         '습도', '풍속', '풍향', '동서바람성분', '남북바람성분'] # 열의 순서를 재조정 (펜시검색문법 활용)
    p_df = p_df[redefined_columns]
    return p_df

# 현재 시간 설정
base_date = time.strftime("%Y%m%d")
# print(base_date)
day_time = time.strftime("%H%M")
# print(day_time)

raw_str_json = get_request_url()
# print(raw_str_json)

if raw_str_json:
    raw_json = json.loads(raw_str_json)

# print(raw_json)

parsed_json = raw_json['response']['body']['items']['item']

# print(parsed_json)
df = pd.DataFrame(parsed_json)
print(df)

df_preprocessed =  preprocess_df(df)
print(df_preprocessed)

file_name = f'초단기날씨현황_조회_{base_date}_{day_time}.csv'
df_preprocessed.to_csv(file_name, index=False, encoding='cp949')

