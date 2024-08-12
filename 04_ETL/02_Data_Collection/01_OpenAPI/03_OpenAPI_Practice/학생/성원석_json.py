import requests
import json
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import font_manager, rc

# 한글 폰트 설정
font_location = "C:\Windows\Fonts\malgun.ttf"
font_name = font_manager.FontProperties(fname = font_location).get_name()
rc('font', family = font_name)
plt.rcParams['axes.unicode_minus'] = False

access_key = '554761454d6c6f6537386a736c474f'

def get_request_url(input_time, start, end):
    data = []
    base_url1 = 'http://openapi.seoul.go.kr:8088/'
    base_url2 = '/json/bikeListHist'
    start_row = start
    end_row = end
    int_input_time = int(input_time)
    number = 1
    for i in range(10):
        url = f'{base_url1}{access_key}{base_url2}/{start_row}/{end_row}/{int_input_time}'

        response = requests.get(url)
        raw_json = json.loads(response.text)
        json_list = raw_json['getStationListHist']['row']
        data.extend(json_list)20240710

        int_input_time += 100
        print(f'현재까지 {number * (int(end) - int(start) + 1)}건 수집중')
        number += 1
    return data

input_time = input('기준일자로부터 일주일간의 데이터를 일단위로 조회합니다.\n검색할 기준일자와 시간을 입력하세요 (예: 2024073109): ')
input_start = input('검색할 데이터 시작 번호를 입력하세요: ')
input_end = input('검색할 데이터 끝 번호를 입력하세요(시작번호로부터 1000개까지 가능): ')

data = get_request_url(input_time, input_start, input_end)

df = pd.DataFrame(data)
df.rename(columns = {'rackTotCnt': '거치대개수', 'stationName': '대여소이름', 'parkingBikeTotCnt': '자전거주차총건수', 'shared': '거치율', 'stationLatitude': '위도', 'stationLongitude': '경도', 'stationId': '대여소ID', 'stationDt': '대여시간'}, inplace = True)
df['대여시간'] = pd.to_datetime(df['대여시간'].str.slice(0, 8), format = '%Y%m%d')
df['거치대개수'] = pd.to_numeric(df['거치대개수'])
df['자전거주차총건수'] = pd.to_numeric(df['자전거주차총건수'])
df['거치율'] = pd.to_numeric(df['거치율'])

print(df)

plt.figure(figsize=(10, 6))

plt.xlabel('대여시간')
plt.ylabel('자전거주차총대수')

# 국가별 선 그래프 그리기
for bikes in df['대여소이름'].unique():
    bike_data = df[df['대여소이름'] == bikes]
    plt.plot(bike_data['대여시간'], bike_data['자전거주차총건수'], label = bikes)

# 그래프 축 레이블 및 타이틀 설정
plt.xlabel('날짜')
plt.ylabel('자전거수')
plt.title('대여소별 자전거 주차 총 대수')

plt.legend()

plt.xticks(rotation = 45)

plt.show()