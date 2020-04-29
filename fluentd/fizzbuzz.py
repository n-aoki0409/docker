#!/usr/bin/env python
import sys
input = file(sys.argv[-1])
output = file("/fluentd/etc/foobar.out", "a")
for line in input:
    fizzbuzz = int(line.split("\t")[0])
    s = ''
    if fizzbuzz%3 == 0:
        s += 'fizz'
    if fizzbuzz%5 == 0:
        s += 'buzz'
    if len(s) > 0:
        output.write(s+"\n")
    else:
        output.write(str(fizzbuzz)+"\n")
output.close