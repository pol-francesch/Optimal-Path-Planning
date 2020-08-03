load exampleMaps.mat

%binaryOccupancyMap(your map, resolution (ie 2 cells/m))
map = binaryOccupancyMap(simpleMap,2);
show(map);

%To make sure that the map is properly sized relative to the robot, we
%"inflate"
robotRadius = 0.5; %[m]
mapInflated = copy(map);
inflate(mapInflated, robotRadius);
show(mapInflated);

%Create the path planner
prm = mobileRobotPRM;
prm.Map = mapInflated;
%More nodes => higher probability of finding a path, higher comp cost
prm.NumNodes = 20;  
prm.ConnectionDistance = 5; %max distance betwen nodes

%Define start and goal. CHeck the map for reference
start = [2 1]; %m
goal = [12 10]; %m

%Get results and display
path = findpath(prm, start, goal);
show(prm);