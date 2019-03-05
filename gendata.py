#!/usb/bin/python
import sys

file = sys.argv[1]

f = open(file, "r") 
for line in f:
    enter = line.split(" ")[6][:-1]
    enter =  float(enter)
    nextline=f.next()
    end = nextline.split(" ")[6][:-1]
    end= float(end)
    #sec flot times
    #print "%.6f" % (end - enter)
    #us times
    print "%f" % float((end - enter) * 1000000.0)
f.close()
