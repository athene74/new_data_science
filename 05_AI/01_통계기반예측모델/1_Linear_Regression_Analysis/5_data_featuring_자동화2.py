# 통계 모델: 선형회귀 분석 (Linear Regression Analysis)

import pandas as pd
from statsmodels.formula.api import ols
import operator
from itertools import combinations
from datetime import datetime
import time

start = datetime.fromtimestamp(time.time())
print("결과 예측하기")
house = pd.read_csv('Boston_house.csv',sep=',',header=0)
house.columns = house.columns.str.replace(' ','_')

match_dic={}
colums_list = ['AGE','B','RM','CRIM','DIS','INDUS','LSTAT',
               'NOX','PTRATIO','RAD','ZN','TAX','CHAS']

for num in range(1,len(colums_list)+1):
    combi_list = list(combinations(colums_list,num))
    for tup in combi_list:
        my_formula = 'Target ~ '
        for data in tup:
            my_formula+='%s + '%data
        my_formula = my_formula.strip().rstrip('+')
        lm = ols(my_formula, data=house).fit()
        dependent_variable = house['Target']
        # independent_variables = house[house.columns.difference(['quality','type','in_sample'])]
        independent_variables = house[list(tup)] # formula 에 들어간 columns만 골라서 고정 변수로 줌
        y_predicted = lm.predict(independent_variables)

        y_predicted_rounded = [round(score) for score in y_predicted]

        match_count=0
        for index in range(len(y_predicted_rounded)):
            if y_predicted_rounded[index] == round(dependent_variable.values[index]):
                match_count+=1
        print('\n>> '+my_formula.replace('quality ~ ',''))
        print('>> match count=',match_count)
        print('>> 정답률: %.2f %%'%(match_count/len(y_predicted_rounded)*100))
        match_dic['%s'%my_formula.replace('quality ~ ','')] = match_count/len(y_predicted_rounded)*100


# 최대값 찾기
match_dic = sorted(match_dic.items(), key=operator.itemgetter(1),reverse=True)
# print(match_dic)

print("\n\n 독립변수 최적화 분석 결과")
print('총 조합 갯수: %d'%len(match_dic))
print("MAX 조합: %s >> %.2f %%"%(match_dic[0][0],match_dic[0][1]))
end = datetime.fromtimestamp(time.time())
print(f'분석 시작: {start}')
print(f'분석 종료: {end}')
print(f'총 분석 시간: {end-start}')

#  독립변수 최적화 분석 결과
# 총 조합 갯수: 8191
# MAX 조합: Target ~ AGE + RM + DIS + ZN + CHAS  >> 16.01 %