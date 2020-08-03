clear
%Define map properties and obstacle locations
objLoc = [0.5,3;1.5,3;2.5,3;3.5,3;4.5,3;5.5,3;6.5,3;9.5,5;8.5,5;7.5,5;6.5,5;10.5,5]; %[m,m]
objLoc2 = [0.5,3;1.5,3;2.5,3;3.5,3;4.5,3;5.5,3;6.5,3;7.5,3;...
           10.5,6;9.5,6;8.5,6;7.5,6;6.5,6;5.5,6;4.5,6;...
           4.5,5; 6,8];
objLoc1 = [1.5,3;5,9;9,8; 5,5];
objLoc3 = [3,9; 6,6; 2,2; 4,5];
lenx = 11; %[m]
leny = 11; %[m]
res = 10; %[cell/m]
%We use obsSize as the obstacle size+robot size+safety margin. This
%allows us to more easily integrate it and the path looks a lot nicer
%on the plot.
objSize = 1; %[m]

%Set start and end 
start = [1,1]; %[m]
goal = [10,10]; %[m]

%We add a weight which we can adjust to check how greedy our algorithm will
%be.
%Note: w = 0 results in Djikstra algorithm
w = sqrt(2);

%Run A* with fancy plot
path = getPathAStar_FancyPlot(lenx, leny, objLoc2, objSize, res, start, goal,w);

%Run A* with normal plot
%pathGrid = getPathAStar(lenx, leny, objLoc2, objSize, res, start, goal,w);

%Plot using cartesian coords
%path = pathGrid / res;
%plotOptPath(path, objLoc2, objSize, lenx, leny, start, goal);