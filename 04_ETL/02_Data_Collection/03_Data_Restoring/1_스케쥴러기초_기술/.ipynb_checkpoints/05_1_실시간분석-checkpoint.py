import cx_Oracle
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import time
from matplotlib import font_manager,rc
# 한글 폰트
font_location = "C:\Windows\Fonts\malgun.ttf"
font_name = font_manager.FontProperties(fname=font_location).get_name()
rc('font',family=font_name)
def get_data_from_oracle():
    conn = cx_Oracle.connect('open_source/1111@192.168.0.4:1521/xe')
    query = "SELECT * FROM (SELECT * FROM SHOPPING_DATA ORDER BY TIMESTAMP_COLUMN DESC) WHERE ROWNUM <= 10 ORDER BY TIMESTAMP_COLUMN"
    df = pd.read_sql(query, con=conn)
    conn.close()
    return df

def plot_realtime_data():
    plt.ion()  # Interactive mode on
    fig, ax = plt.subplots()

    while True:
        df = get_data_from_oracle()
        ax.clear()
        sns.lineplot(x='TIMESTAMP_COLUMN', y='SALES_AMOUNT', data=df, ax=ax, marker='o')
        ax.set(title='실시간 매출 데이터', xlabel='시간', ylabel='매출 금액')
        plt.xticks(rotation=45)
        plt.draw()
        plt.pause(5)

# 실시간 데이터 시각화 함수 실행
plot_realtime_data()
