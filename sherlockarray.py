#solution to https://www.hackerrank.com/challenges/sherlock-and-array

def main():
    noOfTestCases = int(raw_input())
    for i in xrange(noOfTestCases):
        lstLen = int(raw_input())
        arr = [int(x) for x in raw_input().split()]
        forwardSum = calculateSum(arr, lstLen)
        reverseSum = calculateSum(arr[::-1],lstLen)
        reverseSum = reverseSum[::-1]
        foundFlag = False
        for j in xrange(lstLen):
            if forwardSum[j] == reverseSum[j]:
                foundFlag = True
                break
        if foundFlag:
            print "YES"
        else:
            print "NO"

def calculateSum(arr, size):
    tempArr = [0] * size
    for i in xrange(size):
        if i == 0:
            tempArr[i] = 0
        else:
            tempArr[i] = tempArr[i-1] + arr[i-1]
    return tempArr

if __name__ == '__main__':
    main()
