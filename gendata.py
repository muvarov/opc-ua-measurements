#!/usb/bin/python
import sys

file = sys.argv[1]
print "openning file %s" % file

f = open(file, "r") 
for line in f:
    enter = line.split(" ")[6][:-1]
    enter =  float(enter)
    nextline=f.next()
    end = nextline.split(" ")[6][:-1]
    end= float(end)
    print "%.6f" % (end - enter)
f.close()
