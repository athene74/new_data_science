import pandas as pd
import requests
import matplotlib.pyplot as plt
from matplotlib import font_manager, rc
from xml.etree.ElementTree import fromstring
import seaborn as sns

# 한글 폰트 설정
font_location = "C:\Windows\Fonts\malgun.ttf"
font_name = font_manager.FontProperties(fname=font_location).get_name()
rc('font', family=font_name)
plt.rcParams['axes.unicode_minus'] = False

access_key = '59487641466c6f653131365a7a776c69'

def get_request_url(start_date, days):
    data = []
    base_url = 'http://openapi.seoul.go.kr:8088/59487641466c6f653131365a7a776c69/xml/CardSubwayStatsNew'
    start_row = 1
    end_row = 700
    base_time = int(start_date)
    days = int(days)
    for i in range(days):
        url = f'{base_url}/{start_row}/{end_row}/{base_time}'

        response = requests.get(url)
        xml_root = fromstring(response.text)
        if xml_root:
            for row in xml_root.findall('row'):
                data.append([
                    pd.to_datetime(row.find('USE_YMD').text, format='%Y%m%d'),
                    row.find('SBWY_ROUT_LN_NM').text,
                    row.find('SBWY_STNS_NM').text,
                    int(row.find('GTON_TNOPE').text),
                    int(row.find('GTOFF_TNOPE').text)
                ])
        base_time += 1

    df = pd.DataFrame(data, columns = ['사용일자', '노선', '역이름', '총승차승객수', '총하차승객수'])
    # df = df.set_index('사용일자')
    print(df)
    return df

start_date = input('조회 시작일자를 입력하세요(예: 20240731): ')
days = input('시작일자로부터 조회할 날짜 수를 입력하세요(예: 7): ')

df = get_request_url(start_date, days)

line = input('조회할 지하철 노선 번호를 입력하세요(예: 1호선): ')

plt.figure(figsize = (20, 12))

df_line = df[df['노선'] == line]

sns.lineplot(df_line, x = '사용일자', y = '총승차승객수', hue = '역이름')

plt.xlabel('사용일자')
plt.ylabel('총승차승객수')
plt.title(f'사용일자별 {line} 총 승차 승객수')

plt.legend()

plt.xticks(rotation = 45)

plt.show()