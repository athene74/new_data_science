import cx_Oracle
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
from matplotlib import font_manager,rc
# 한글 폰트
font_location = "C:\Windows\Fonts\malgun.ttf"
font_name = font_manager.FontProperties(fname=font_location).get_name()
rc('font',family=font_name)
def fetch_sales_data():
    conn = cx_Oracle.connect('open_source/1111@192.168.0.4:1521/xe')
    query = "SELECT PRODUCT_NAME, SUM(SALES_AMOUNT) AS TOTAL_SALES FROM SHOPPING_DATA GROUP BY PRODUCT_NAME"
    df = pd.read_sql(query, con=conn)
    conn.close()
    return df

def update(frame):
    sales_data = fetch_sales_data()

    # Clear previous data
    ax1.clear()
    ax2.clear()

    # Plot pie chart
    ax1.pie(sales_data['TOTAL_SALES'], labels=sales_data['PRODUCT_NAME'], autopct='%1.1f%%', startangle=140)
    ax1.set_title('제품별 판매 현황')

    # Plot bar chart
    ax2.bar(sales_data['PRODUCT_NAME'], sales_data['TOTAL_SALES'], color=['blue', 'green', 'red', 'purple', 'orange'])
    ax2.set_xlabel('Product Name')
    ax2.set_ylabel('Total Sales')
    ax2.set_title('제품별 판매 금액')

# Setup plot
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(15, 7))

# Initialize the animation
ani = FuncAnimation(fig, update, interval=5000)  # Update every 5000 milliseconds (5 seconds)

plt.tight_layout()
plt.show()
