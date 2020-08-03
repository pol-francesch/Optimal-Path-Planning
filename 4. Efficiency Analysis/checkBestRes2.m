clear
%Define map properties and obstacle locations
objLoc = [3,9; 6,6; 2,2; 4,5]; %[m,m]
lenx = 11; %[m]
leny = 11; %[m]
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
w = 1;

%Set the resolutions we want to check through
%For w=1, we go until 50. For all others we go until 100
res = 2:2:50; %[cell/m]


%We want to calculate the amount of time it takes to run the A* algorithm
%for different resolutions. We also want to check if the solution exists,
%and whether it is valid.
time = [];
pathGrid = [];
distance = [];
timeAvg = [];
distanceAvg = [];

%Run the A* algorithim for a set of resolutions. We repeat multiple times
%to get a good time and distance estimate. For w=1, we only repeat 10
%times. For all others, we do 50.
for j = 1:1:10
    for i = 1:1:size(res,2)
        tic;
        resolution = res(i);
        pathGrid = getPathAStar(lenx, leny, objLoc, objSize, resolution, start, goal,w);
        distance(i) = getDistance(pathGrid / res(i));
        time(i) = toc;
    end
    if (j==1)
        timeAvg = time;
        distanceAvg = distance;
    else
        for i = 1:1:size(time)
            timeAvg(i) = (timeAvg(i)+time(i))/2;
            distanceAvg(i) = (distanceAvg(i)+distance(i))/2;
        end
    end
    j
end

%Plot Average time
yyaxis left
plot(res, timeAvg);
title("Resolution vs Average Time and Distance to Find Solution");
ylabel("Time [s]");

%Plot results from path
yyaxis right
plot(res, distanceAvg);
ylabel("Distance [m]");
xlabel("Resolution [cell/m]");

legend("Resolution vs Time", "Resolution vs Distance");



