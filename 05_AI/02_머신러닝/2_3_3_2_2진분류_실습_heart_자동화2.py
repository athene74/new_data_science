import pandas as pd
import statsmodels.api as sm
import numpy as np
import warnings
from itertools import combinations
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
import sys
import seaborn as sns

warnings.filterwarnings('ignore')

penguins = sns.load_dataset('penguins')
# heart = pd.read_csv('heart.csv', sep=',', header=0)

penguins.dropna(inplace=True)
penguins.replace('Adelie', 0, inplace=True)
penguins.replace('Gentoo', 1, inplace=True)
penguins.replace('Chinstrap', 2, inplace=True)

feature = penguins[penguins.columns.difference(['species','island','sex'])]
label = penguins['species']
# feature = heart[heart.columns.difference(['target'])]
# label = heart['target']

len = len(penguins.columns.difference(['species','island','sex']))

best = []
max = 0

for num in range(1, len + 1) :
    combi = list(combinations(penguins.columns.difference(['species','island','sex']), num))

    for tup in combi :
        try :
            feature = penguins[list(tup)]
            train_input, test_input, train_target, test_target = train_test_split(
                feature, label,stratify=label, random_state=42)

            mean = np.mean(train_input, axis=0)
            std = np.std(train_input, axis=0)

            train_scaled=(train_input-mean)/std

            test_scaled = ((test_input) - mean) / std

            kn = KNeighborsClassifier()

            kn.fit(train_input, train_target)

            kn.score(train_input, train_target)

            kn.fit(train_scaled, train_target)

            current_score = kn.score(test_scaled, test_target)
            # 현재 테스트 중인 모델 성능과 사용한 Feature 출력
            sys.stdout.write(f'\r현재 테스트 중: 성능: {current_score*100}%, 사용한 Feature: {tup}')
            sys.stdout.flush()

            if current_score > max :
                max = current_score
                best = tup
                print(f'\n모델 성능 갱신: {max*100}%, 사용한 Feature: {tup}')

        except Exception as e:
            pass

print('\n<최종 분석 결과>')
print(f'최종 모델 성능: {max*100:.2f}%, 사용한 Feature: {best}')
