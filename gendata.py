#!/usb/bin/python
import sys

file = sys.argv[1]
print "openning file %s" % file

f = open(file, "r") 
for line in f:
    enter =  float(line.split(" ")[4][:-1])
    nextline=f.next()
    end= float(nextline.split(" ")[4][:-1])
    print "%.6f" % (end - enter)
f.close()
