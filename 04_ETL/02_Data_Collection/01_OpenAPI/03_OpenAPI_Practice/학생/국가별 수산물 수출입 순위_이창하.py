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

access_key = 'SjZDkZeoRAdpLZ0/HQhz8jEPnoyfugEsOTfyRZJ456vvxVKHqR4DPd7T9pRBxiOnTCoCf2wMwcH5ypBMlVs5Iw=='

def get_request_url(year_start, year_end, month_end):
    count = 1
    url = 'http://apis.data.go.kr/1192000/select0100List/getselect0100List'

    data = []
    for year in range(year_start, year_end + 1):
        month_end_value = 12 if year < year_end else month_end
        for month in range(1, month_end_value + 1):
            ym = year * 100 + month

            params = {'serviceKey': access_key,
                          'type': 'json',
                          'baseDt': ym,
                          'imxprtSeNm': '수출',
                       'pageNo' : 1,
                      'numOfRows' : 10
            }

            response = requests.get(url, params=params)
            raw_json = response.json()

            if 'item' in raw_json['responseJson']['body']:
                item = raw_json['responseJson']['body']['item']

                for items in item:
                    data.append([
                            pd.to_datetime(items['stdyymm'], format='%Y%m'),
                            items['nationNm'],
                            items['rank']
                    ])
                    print(f'{count}건 데이터 수집중...')
                    count = count + 1

    df = pd.DataFrame(data, columns=['날짜', '국가', '순위'])
    df = df.set_index('날짜')
    return df
# foreign_countrys = ['일본','중국','미국','베트남','태국','프랑스','대만']
year_start = 2022
year_end = 2023
month_end = 12
# df = get_request_url(2018, 2024, 1, foreign_countrys)
df = get_request_url(year_start, year_end, month_end)

# 그래프 크기 설정
plt.figure(figsize=(20, 10))

df['순위'] = pd.to_numeric(df['순위'], errors='coerce')

unique_countries = df['국가'].unique()
num_countries = len(unique_countries)
colors = plt.colormaps.get_cmap('tab20')  # 'tab20' 컬러 맵 사용

# 색상 맵에서 고유 색상 생성
color_map = {country: colors(i / num_countries) for i, country in enumerate(unique_countries)}

linestyles = ['-', '--', '-.', ':']  # 기본 선 스타일 목록
num_linestyles = len(linestyles)

# 선 스타일 매핑
linestyle_map = {country: linestyles[i % num_linestyles] for i, country in enumerate(unique_countries)}

# 국가별 선 그래프 그리기
for country in df['국가'].unique():
    country_data = df[df['국가'] == country]
    plt.plot(country_data.index, country_data['순위'], label=country,color=color_map[country],linestyle=linestyle_map[country], linewidth=2)

# 그래프 축 레이블 및 타이틀 설정
plt.xlabel('날짜',fontsize=14)
plt.ylabel('순위',fontsize=14)
plt.title(f'{year_start}년 1월부터 {year_end}년 {month_end}월까지 국가별 수산물 수출 총금액 순위',fontdict={'fontsize': 20, 'fontweight': 'bold','color': 'b'})

# 범례 추가
plt.legend()

# x축 눈금 라벨 회전
plt.xticks(rotation=45)
plt.gca().invert_yaxis()
# 그래프 출력
plt.show()
