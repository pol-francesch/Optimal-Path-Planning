%% Function Name: createMap2
%
% Description: Returns a matrix representation of the map requested with
% walls and the obstacles.
%
% Inputs:
%     path = contains the [x,y] locations of each section [m] 
%     objLoc = contains the locations of obstacles [m]
%       Format: [x1, y1; x2, y2; ...]
%     objSize = contains the size of the obstacles [m]
%     lenx = x-dimension of the map [m]
%     leny = y-dimension of the map [m]
%     start = start location of robot [m]
%     goal = goal location of robot [m]
%     
% Outputs:
%
%---------------------------------------------------------
function plotOptPath(path, objLoc, objSize, lenx, leny, start, goal)
    hold on;
    axis equal;
    grid on;
    
    %Adding walls as rectangles [x y w h]
    margin = 0.1;
    rectangle('Position', [0,0,margin,leny], 'FaceColor', 'k');
    rectangle('Position', [lenx-margin,0,margin,leny], 'FaceColor', 'k');
    rectangle('Position', [0,0,lenx,margin], 'FaceColor', 'k');
    rectangle('Position', [0,leny-margin,lenx,margin], 'FaceColor', 'k');
    
    %Adding obstacles as rectangles
    for i = 1:1:size(objLoc,1)
        %Note that rectangle() plots position based on lower left corner.
        %But we are providing the center position.
        x = objLoc(i,1)-0.5*objSize;
        y = objLoc(i,2)-0.5*objSize;
        pos = [x, y, objSize, objSize];
        rectangle('Position', pos, 'FaceColor', 'k');
    end
    
    %Add start and goal
    plot(start(1), start(2), 'o');
    plot(goal(1), goal(2), '*');
    
    %Plot the path
    plot(path(:,1), path(:,2), 'r', 'LineWidth', 2);
    title("Path from start to goal");
    ylabel("y [m]");
    xlabel("x [m]");
    hold off;
end