# 목적: 파이썬 코드를 활용하여 OpenAPI 호출 자동화
# Step1: OpenAPI를 제공하는 사이트에서 제공하는 샘플 프로그램을 확보한다.
'''
CREATE TABLE WEATHER (
    DATE_TIME VARCHAR2(20),
    NX NUMBER,
    NY NUMBER,
    기온 NUMBER(5, 1),
    시간1_강수량 NUMBER(5, 1),
    강수형태 NUMBER,
    습도 NUMBER,
    풍속 NUMBER(5, 1),
    풍향 NUMBER,
    동서바람성분 NUMBER(5, 1),
    남북바람성분 NUMBER(5, 1)
);
'''

import requests
import time
import json
import pandas as pd
import cx_Oracle

# access_key =
access_key='Yff2okQ2i8jEUaDanPqgbSuRzoFOaP0AfYzU7Mkhe4QP9tapdiZiOvmhk+ZeOrBMrxJqbxU6M58b1OeuM/OKsg=='
# 가산동 격자 x, 격자 y 정보
nx = 58
ny = 125
def get_request_url():
    url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'
    params = {'serviceKey': access_key , 'numOfRows' : 10, 'pageNo' : 1,
        'dataType': 'JSON','base_date':base_date,'base_time':day_time,'nx':nx,'ny':ny
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

def preprocessed_df_to_oracle(df):
    conn = cx_Oracle.connect('open_source/1111@192.168.0.4:1521/xe')
    cur = conn.cursor()

# 바인딩 변수: sql에 사용되는 동적인 데이터
# values(:바인딩변수1, :바인딩변수2 ..., 바인딩변수N)
    sql_insert = '''
    insert into
    weather(DATE_TIME,NX,NY,기온,시간1_강수량,강수형태,습도,풍속,풍향,동서바람성분,남북바람성분)
    values(:DATE_TIME,:NX,:NY,:기온,:시간1_강수량,:강수형태,:습도,:풍속,:풍향,:동서바람성분,:남북바람성분)
    '''

    # 특정행의 첫번째 값
    DATE_TIME = df['DATE_TIME'].iloc[0]
    NX = int(df['NX'].iloc[0])
    NY = int(df['NY'].iloc[0])
    기온= df['기온'].iloc[0]
    시간1_강수량= df['시간1_강수량'].iloc[0]
    강수형태= df['강수형태'].iloc[0]
    습도= df['습도'].iloc[0]
    풍속= df['풍속'].iloc[0]
    풍향= df['풍향'].iloc[0]
    동서바람성분= df['동서바람성분'].iloc[0]
    남북바람성분= df['남북바람성분'].iloc[0]

    cur.execute(sql_insert, ( DATE_TIME,NX,NY,기온,시간1_강수량,강수형태,습도,풍속,풍향,동서바람성분,남북바람성분))
    # # cur.execute(sql_insert,
    #             {'DATE_TIME': DATE_TIME, 'NX': NX, 'NY': NY, '기온': 기온, '시간1_강수량': 시간1_강수량, '강수형태': 강수형태, '습도': 습도,
    #              '풍속': 풍속, '풍향': 풍향, '동서바람성분': 동서바람성분, '남북바람성분': 남북바람성분})
    conn.commit()
    cur.close()
    conn.close()


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

preprocessed_df_to_oracle(df_preprocessed)

