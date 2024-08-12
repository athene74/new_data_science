import json
import seaborn as sns
import requests
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import font_manager, rc

# 한글 폰트 설정
font_location = "C:\Windows\Fonts\malgun.ttf"
font_name = font_manager.FontProperties(fname=font_location).get_name()
rc('font',family=font_name)
plt.rcParams['axes.unicode_minus'] = False


def get_request_url(year, month, date_start, date_end):
    count = 1
    data_list = []
    url = 'https://open.jejudatahub.net/api/proxy/1aD5taat1attaa51Db1511b51ab9Da19/erre7p77ee1p23707oob2t7o7pe27ror'

    # 날짜 범위에 대해 반복
    for date in range(date_start, date_end + 1):
        ymd = (year * 100 + month) * 100 + date
        params = {'searchDate': ymd}
        response = requests.get(url, params=params)
        raw_json = response.json()

        if 'data' in raw_json:
            data = raw_json['data']

            # 필요한 필드를 추출해서 리스트에 추가
            for item in data:
                data_list.append([
                    item.get('observatoryName', ''),
                    pd.to_datetime(item.get('baseDate', ''), format='%Y%m%d'),
                    float(item.get('averageTemperature', 0)),
                    float(item.get('lowestTemperature', 0)),
                    int(item.get('lowestTemperatureTime', 0)),
                    float(item.get('highestTemperature', 0)),
                    int(item.get('highestTemperatureTime', 0)),
                    float(item.get('dailyRainfall', 0)),
                    float(item.get('maximumWindSpeed', 0)),
                    int(item.get('maximumWindSpeedTime', 0)),
                    float(item.get('averageWindSpeed', 0)),
                    float(item.get('maximumWindSpeedDirection', 0))
                ])
            print(f'{count}건 데이터 수집중...')
            count += 1

    # DataFrame으로 변환하고, '기준일자'를 인덱스로 설정
    df = pd.DataFrame(data_list, columns=[
        '관측소명', '기준일자', '평균기온', '최저기온', '최저기온 시간',
        '최고기온', '최고기온 시간', '일일 강수량', '최대 풍속',
        '최대 풍속 시간', '평균 풍속', '최대 풍속 방향'
    ])
    df = df.set_index('기준일자')
    return df

# 예시 호출
year = 2024
month = 7
date_start = 1
date_end = 15

df = get_request_url(year, month, date_start, date_end)
print(df)
print(type(df))







# sns.barplot(data= df, x = "observatoryName", y = "averageTemperature")
#
# plt.title('관측기간별 평균온도')
# plt.xlabel('관측기관')
# plt.ylabel('평균온도')
# plt.grid(True)
# plt.show()
#
# #print(df.head())