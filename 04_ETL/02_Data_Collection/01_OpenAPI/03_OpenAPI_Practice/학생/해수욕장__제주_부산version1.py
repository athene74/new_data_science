import json

import pandas as pd
import requests
import folium
import webbrowser
sido_list = ['부산','제주']

access_key = 'YwOrYEOIliUQ/VEhUytYA759Gc2ZG5kQBJGt2GJWsxJG48Df4bU/uP77VZpLkMa5FO8jeZ3969zdY/5u7+wq6g=='
#PARAM값은 크롬프라우저에 나오는데로 하는거야
def get_request_url(sido_list):
    url = 'http://apis.data.go.kr/1192000/service/OceansBeachInfoService1/getOceansBeachInfo1'
    raw_json =[]
    for sido in sido_list:
        params = {
                    'serviceKey': access_key,
                    'resultType': 'json',
                    'SIDO_NM': sido,
                    'pageNo': 1,
                    'numOfRows': 10
                }
        print(sido)
        response = requests.get(url, params=params)
#    return response.text
        raw_json.append(response.json())
    return raw_json

raw_json = get_request_url(sido_list)
for result in raw_json:
    df = pd.DataFrame(result['getOceansBeachInfo']['item'])
    new_df = df.rename(columns={'num': '번호', 'sido_nm': '지역', 'gugun_nm': '지역', 'sta_nm': '해수욕장이름',
                                'beach_wid': '풍량', 'beach_len': '면적', 'beach_knd': '재질', 'link_addr': '주소',
                                'link_nm': '링크', 'beach_img': '이미지', 'link_tel': '전화번호', 'lat': '위도', 'lon': '경도'})
    print(new_df)
m2 = folium.Map(location=[33.135295259204085,126.13634802436648],
                width=1000,
                height=650
                    )
lat = new_df['위도'].astype(float)
print(lat.dtypes)
lon = new_df['경도'].astype(float)
print(lon.dtypes)
for _, row in new_df.iterrows():
    folium.Marker(
        [row['위도'], row['경도']],  # 위도와 경도를 리스트 형태로 전달
        tooltip=row['해수욕장이름']
    ).add_to(m2)
map_file = 'm2.html'
m2.save(map_file)
webbrowser.open(map_file)
