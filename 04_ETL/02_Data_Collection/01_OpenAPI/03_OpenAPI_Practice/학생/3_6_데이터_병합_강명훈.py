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
import time

# access_key = 'FkaKMCtafz%2Bd9EsoSI707Bd3bkXhQ08xozVQoHyVLB2j97qqLzn4VFarSthh65PmeQ55uYVCm6fbIQ80UrKz6w%3D%3D'
access_key = '4353745148'

def preprocess_df(df):

    # df.insert(0,'date_time', df['sdate']+df['stdHour'])
    #
    # p_df = pd.pivot(df, index='date_time', columns=['category'],values='obsrValue') # 하나의 행으로 데이터를 피봇
    # date_time = df.loc[0,'sdate'] + ' ' + df.loc[0,'stdHour']
    # p_df.insert(0,'date_time',[date_time])
    #
    p_df = df
    p_df.rename(columns={
        'sdate':'날짜','unitName':'휴게소명', 'xValue':'x좌표', 'yValue': 'y좌표',
        'weatherContents':'현재일기내용','tempValue':'현재기온'
       }, inplace=True) # 열의 이름을 해석

    redefined_columns = ['날짜','휴게소명','x좌표', 'y좌표', '현재기온',
                          '현재일기내용'] # 열의 순서를 재조정 (펜시검색문법 활용)
    p_df = p_df[redefined_columns]
    return p_df





# print(raw_str_json)
# print(type(raw_str_json)) # 응답받은 데이터는 문자열이기 때문에 JSON 타입으로 변경을 해야한다.



def get_request_url(mod_date):
    count = 1
    url = 'https://data.ex.co.kr/openapi/restinfo/restWeatherList'

    data = []
    for date in range(1,mod_date+1):

        base_date = int(time.strftime("%Y%m%d")) - date # 달이 바뀌어 0일이 되었을 경우 예외처리가 필요
        params = {'key': access_key,
                  'type': 'json',
                  'sdate': str(base_date),
                  'stdHour': day_time
                  }
        response = requests.get(url, params=params)
        raw_json = response.json()
        for lines in range(raw_json['count']):

            if 'list' in raw_json:
                lists = raw_json['list']
                data.append([
                        lists[lines]['sdate'],lists[lines]['unitName'],
                        lists[lines]['xValue'],lists[lines]['yValue'],
                        lists[lines]['tempValue'],lists[lines]['weatherContents']
                ])


        print(f'{count}건 데이터 수집중...')
        count=count+1

    df = pd.DataFrame(data, columns=['sdate', 'unitName', 'xValue','yValue','tempValue','weatherContents'])
    # df = df.set_index('sdate')
    df_preprocessed = preprocess_df(df)
    df_preprocessed = df_preprocessed.set_index('날짜')
    return df_preprocessed

day_time = time.strftime("%H")

mod_date = 5
#
mix_data = get_request_url(mod_date)

print(mix_data)