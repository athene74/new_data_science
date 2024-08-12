import cx_Oracle
import time
import random

def simulate_data_insertion():
    conn = cx_Oracle.connect('open_source/1111@192.168.0.4:1521/xe')
    cursor = conn.cursor()

    product_ids = ['P001', 'P002', 'P003', 'P004', 'P005']
    product_names = ['제품1', '제품2', '제품3', '제품4', '제품5']

    while True:
        product_id = random.choice(product_ids)
        product_name = product_names[product_ids.index(product_id)]
        sales_amount = random.randint(1000, 5000)
        query = "INSERT INTO SHOPPING_DATA (TIMESTAMP_COLUMN, PRODUCT_ID, PRODUCT_NAME, SALES_AMOUNT) VALUES (SYSTIMESTAMP, :product_id, :product_name, :sales_amount)"
        cursor.execute(query, product_id=product_id, product_name=product_name, sales_amount=sales_amount)
        print(f"데이터 자동생성 => product_id: {product_id}, product_name: {product_name}, sales_amount: {sales_amount}  " )
        conn.commit()
        time.sleep(5)

    cursor.close()
    conn.close()

print("실시간 데이터 생성 시뮬레이터\n")
# 시뮬레이션 함수 실행
simulate_data_insertion()
