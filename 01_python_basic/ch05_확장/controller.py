import sys
sys.path.append('D:\\hjnam\\project\\DataScience\\01_python_basic\\util')
import mod1, mod3

print(mod1.add(3,4))
print(mod1.sub(4,2))


from mod1 import add

print(add(3,4))

print(mod3.PI)
