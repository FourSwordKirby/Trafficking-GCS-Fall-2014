import random

points = ["A", "B", "C", "D", "E"];
timeLimit = 180; # number of seconds
interval = 10; # seconds before next set of cars spawn
density = 5; # number of cars per second

for i in xrange(0, timeLimit, interval):
    minute = i / 60;
    second = i % 60;
    for i in xrange(0, density):
        startPos = random.randint(0, len(points) - 1);
        endPos = random.randint(0, len(points) - 2);
        
        start = points[startPos];
        if (startPos <= endPos):
            end = points[endPos + 1];
        else:
            end = points[endPos];
        print("%d:%02d: car from point %s to point %s" %(minute, second, start, end));
