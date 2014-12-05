import random

entrances = [(625, 0), (0, 125), (1000, 75), (0, 425), (1000, 375), (0, 925),
             (1000, 775), (425, 1000)];
exits = [(675, 0), (0, 75), (1000, 125), (0, 375), (1000, 425), (0, 875),
         (1000, 825), (375, 1000),
         # small streets
         (575, 275), (75, 575), (625, 575), (575, 725),
         (625, 1000), (825, 1000), (1000, 925)
         ];

## legitExitIndices = [0, 1, 2, 3, 4, 8, 9];

timeLimit = 180; # number of seconds
fps = 30; # frames per second
interval = 8; # seconds before next set of cars spawn
density = 5; # number of cars per second

with open("Traffic Script.txt", mode = "w") as f:
    for i in xrange(0, timeLimit, interval):
        for j in xrange(0, density):
            start = entrances[random.randint(0, len(entrances) - 1)];
            end = exits[random.randint(0, len(exits) - 1)];

            f.write("var path1:Array = map.graph.getShortestEdgePath"
                  "(new Vertex%s, new Vertex%s);\n"
                 %(start, end));
            f.write("if (path1) {\n");
            f.write("   spawn_times[%d] = new Car"
                  " (path1, map.graph.getVertexPathFromEdgePath(path1));\n"
                  % (i * fps));
            f.write("}\n\n")
##    for i in range(len(entrances)):
##        for j in range(len(exits)):
##            f.write("var path1:Array = map.graph.getShortestEdgePath"
##                  "(new Vertex%s, new Vertex%s);\n"
##                 %(entrances[i], exits[j]));
##            f.write("if (path1) {\n");
##            f.write("   trace(%d, %d);\n"
##                %(i, j));
##            f.write("   spawn_times[%d] = new Car"
##                  " (path1, map.graph.getVertexPathFromEdgePath(path1));\n"
##                  % (i * fps));
##            f.write("}\n\n")

# Old:

##points = ["A", "B", "C", "D", "E"];
##timeLimit = 180; # number of seconds
##interval = 10; # seconds before next set of cars spawn
##density = 5; # number of cars per second
##
##for i in xrange(0, timeLimit, interval):
##    minute = i / 60;
##    second = i % 60;
##    for j in xrange(0, density):
##        startPos = random.randint(0, len(points) - 1);
##        endPos = random.randint(0, len(points) - 2);
##        
##        start = points[startPos];
##        if (startPos <= endPos):
##            end = points[endPos + 1];
##        else:
##            end = points[endPos];
##        print("%d:%02d: car from point %s to point %s"
##              %(minute, second, start, end));
