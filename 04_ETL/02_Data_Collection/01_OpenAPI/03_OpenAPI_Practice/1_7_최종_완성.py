import requests
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import font_manager, rc

# 한글 폰트 설정
font_location = "C:\Windows\Fonts\malgun.ttf"
font_name = font_manager.FontProperties(fname=font_location).get_name()
rc('font', family=font_name)
plt.rcParams['axes.unicode_minus'] = False

# access_key ='Yff2okQ2i8jEUaDanPqgbSuRzoFOaP0AfYzU7Mkhe4QP9tapdiZiOvmhk%2BZeOrBMrxJqbxU6M58b1OeuM%2FOKsg%3D%3D'
access_key = 'Yff2okQ2i8jEUaDanPqgbSuRzoFOaP0AfYzU7Mkhe4QP9tapdiZiOvmhk+ZeOrBMrxJqbxU6M58b1OeuM/OKsg=='

def get_request_url(year_start, year_end, month_end, foreign_countrys):
    count = 1
    url = 'http://openapi.tour.go.kr/openapi/service/EdrcntTourismStatsService/getEdrcntTourismStatsList'

    data = []
    for country in foreign_countrys:
        for year in range(year_start, year_end + 1):
            month_end_value = 12 if year < year_end else month_end
            for month in range(1, month_end_value + 1):
                ym = year * 100 + month

                params = {
                    'serviceKey': access_key,
                    '_type': 'json',
                    'YM': ym,
                    'NAT_CD': country,
                    'ED_CD': 'E' # 외래 관광객
                }

                response = requests.get(url, params=params)
                raw_json = response.json()

                if 'items' in raw_json['response']['body']:
                    items = raw_json['response']['body']['items']['item']

                    data.append([
                            pd.to_datetime(items['ym'], format='%Y%m'),
                            items['natKorNm'],
                            items['num']
                        ])
                    print(f'{count}건 데이터 수집중...')
                    count=count+1

    df = pd.DataFrame(data, columns=['날짜', '국가', '방문자수'])
    df = df.set_index('날짜')
    return df
#112:중국
#130:일본
#275:미국
foreign_countrys = [112,130,275]
year_start = 2019
year_end = 2024
month_end = 6
# df = get_request_url(2018, 2024, 1, foreign_countrys)
df = get_request_url(year_start, year_end, month_end, foreign_countrys)

# 그래프 크기 설정
plt.figure(figsize=(10, 6))

# 국가별 선 그래프 그리기
for country in df['국가'].unique():
    country_data = df[df['국가'] == country]
    plt.plot(country_data.index, country_data['방문자수'], label=country)

# 그래프 축 레이블 및 타이틀 설정
plt.xlabel('날짜')
plt.ylabel('여행자수')
plt.title(f'{year_start}년 1월부터 {year_end}년 {month_end}월까지 대한민국 관광객 방문자수')

# 범례 추가
plt.legend()

# x축 눈금 라벨 회전
plt.xticks(rotation=45)

# 그래프 출력
plt.show()
