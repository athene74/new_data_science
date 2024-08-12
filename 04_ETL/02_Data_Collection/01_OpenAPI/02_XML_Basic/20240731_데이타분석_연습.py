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
                    'YM': ym,
                    'NAT_CD': country,
                    'ED_CD': 'E' # 외래 관광객
                }

                response = requests.get(url, params=params)
                xml_root = fromstring(response.text)

                if xml_root:

                    data.append([
                            pd.to_datetime(xml_root.find('body').find('items').find('item').find('ym').text, format='%Y%m'),
                            xml_root.find('body').find('items').find('item').find('natKorNm').text,
                            xml_root.find('body').find('items').find('item').find('num').text
                        ])
                    print(f'{count}건 데이터 수집중...')
                    count=count+1

    df = pd.DataFrame(data, columns=['날짜', '국가', '방문자수'])
    df = df.set_index('날짜')
    return df