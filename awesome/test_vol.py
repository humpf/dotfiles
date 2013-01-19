import subprocess

a = subprocess.check_output('amixer -D pulse get Master | grep "Front Left:"', shell=True)
b = str(a)
c = b.find("[")
high = True
try:
    int(b[c+2])
except ValueError:
    high = False
if high:
    vol = int(b[c+1]+b[c+2])
else:
    vol = int(b[c+1])
print(vol)
