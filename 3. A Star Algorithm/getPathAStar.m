%% Function Name: getPathAStar
%
%Given a map with obstacles, this algorithm will return the best path using
%the A* algorithm.
%
% Inputs:
%     lenx = x-dimension of the map [m]
%     leny = y-dimension of the map [m]
%     objLoc = contains the locations of obstacles [m]
%       Format: [x1, y1; x2, y2; ...]
%     objSize = contains the size of the obstacles [m]
%     res = resolution of the map [cell/m]
%     startCart = start location of robot - Cartesian coords [m]
%     goalCart = goal location of robot - Cartesian coords [m]
%     w = weight factor for the A* algorithm
%     
% Outputs:
%     path = contains the [x,y] locations of each section in grid
%     coordinates
%
%---------------------------------------------------------
function path = getPathAStar(lenx, leny, objLoc, objSize, res, startCart, goalCart,w)
    map = createMap2(lenx, leny, objLoc,objSize, res);

    %In grid coordinates
    start = res*startCart;
    goal = res*goalCart;

    %Define number of nodes
    xmax = lenx*res;
    ymax = leny*res;

    %Calculate the Heuristic map of all nodes
    for x = 1:1:size(map,1)
        for y = 1:1:size(map,2)
            if(map(x,y) ~= inf)
                h(x,y) = w*norm(goal-[x,y]);
                g(x,y) = inf; %used to initialize g
            end
        end
    end

    %Set start as initial node, and set intitial values
    g(start(1),start(2)) = 0;
    f(start(1),start(2)) = h(start(1),start(2));

    %Nodes already explored
    closed = [];
    %Nodes to be explored
    %Format: x|y|g(n)|f(n)|cameFrom
    open = [start, g(start(1),start(2)), f(start(1),start(2)), 0];

    %Solve for optimum path
    solved = false; %Loop variable to check end condition

    while(~isempty(open))
        pause(0.001)

        %Find node in open set with smallest f(n)
        [minFn, minFnIndex] = min(open(:,4));

        %Set current node
        current = open(minFnIndex, :);

        %Check to see if goal is reached
        if(current(1:2) == goal)
            closed = [closed;current];
            solved = true;
            break;
        end

        %Remove current node from open set and add it to closed
        open(minFnIndex,:) = [];
        closed = [closed;current];

        %Check neighbors of the current node and follow the best one
        for x = current(1) - 1: 1: current(1) + 1
            for y = current(2) - 1: 1: current(2) + 1
                %First we check to see if this neighbor is out of range, has an
                %obstacle, or is the current node.
                if (x<1 || x>xmax || y<1 || y>ymax || isinf(map(x,y)) || (x == current(1) && y == current(2)))
                    continue
                end

                %Check to make sure it's not in closed
                isClosed = 0;
                for j = 1: 1: size(closed,1)
                    if(x == closed(j,1) && y == closed(j,2))
                        isClosed = 1;
                        break;
                    end
                end
                if(isClosed == 1)
                    continue
                end

                %Check to see if neighbor is already in open set
                isOpen = [];
                if(~isempty(open))
                    for j = 1: 1: size(open,1)
                        if(x == open(j,1) && y == open(j,2))
                            isOpen = j;
                            break;
                        end
                    end
                end

                g2 = g(current(1),current(2))+round(norm([current(1)-x,current(2)-y]),1);

                %Add any neighbors not in the open array, into the open array
                if(isempty(isOpen))
                    g(x,y) = g2;
                    newNode = [x,y,g(x,y), g(x,y)+h(x,y),size(closed,1)];
                    open = [open;newNode];
                    continue
                end

                %Skip if no better path is found
                if (g2 >= g(x,y))
                    continue
                end

                g(x,y) = g2;
                f2 = g2+h(x,y);
                open(isOpen, 3:5) = [g2, f2, size(closed,1)];
            end
        end
    end

    %Create the best path
    if(solved)
        j = size(closed,1);
        path = [];
        while(j > 0)
            x = closed(j,1);
            y = closed(j,2);
            j = closed(j,5);
            path = [x,y;path];
        end
    else
        disp('No path found');
    end
end