
a = "20230331Rainy"
date = a[:8]
print('date: '+date)
year = a[:4]
print('year: '+year)
month = a[4:6]
print('month: '+month)
day = a[6:8]
print('day: '+day)
weather = a[8:]
print('weather: '+weather)
print('weather: ',weather)
"""
>>> "나는 사과를 3개 먹었다"
'나는 사과를 3개 먹었다'
>>> "나는 사과를 5개 먹었다"
'나는 사과를 5개 먹었다'
>>> "나는 사과를 %d개 먹었다" % 3
'나는 사과를 3개 먹었다'
>>> "나는 사과를 %d개 먹었다" % 5
'나는 사과를 5개 먹었다'
number = 3
>>> "나는 사과를 %d개 먹었다" % number
'나는 사과를 3개 먹었다'
number = 5
>>> "나는 사과를 %d개 먹었다" % number
'나는 사과를 5개 먹었다'
>>> "나는 사과를 %s개 먹었다" % "다섯"
'나는 사과를 다섯개 먹었다'
"""
a = "hobby"
a.count('b')