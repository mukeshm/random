#!/bin/python

# solution to https://www.hackerrank.com/challenges/flatland-space-stations
import sys


nc,m = raw_input().strip().split(' ')
nc,m = [int(nc),int(m)]
st = map(int,raw_input().strip().split(' '))

ca = [False] * nc

def main():
    for i in st:
        ca[i] = True
    a1 = checkSt(nc,ca)
    a2 = checkSt(nc,ca[::-1])
    a2 = a2[::-1]
    sum =0
    for i in xrange(nc):
        sum = max(sum, min(a1[i],a2[i]))
    print sum

def checkSt(n, ca):
    a1 = [0] * n
    for i in xrange(n):
        if ca[i]:
            a1[i] = 0
        elif i == 0:
            a1[i] = n
        else:
            a1[i] = a1[i-1] + 1
    return a1

if __name__ == '__main__':
    main()
