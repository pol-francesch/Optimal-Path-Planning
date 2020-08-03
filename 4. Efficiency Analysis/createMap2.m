%% Function Name: createMap2
%
% Description: Returns a matrix representation of the map requested with
% walls and the obstacles.
%
% Inputs:
%     lenx = x-dimension of the map [m]
%     leny = y-dimension of the map [m]
%     objLoc = contains the locations of obstacles [m]
%       Format: [x1, y1; x2, y2; ...]
%     objSize = contains the size of the obstacles [m]
%     res = resolution of the map [cell/m]
%     
% Outputs:
%     map = matrix representation of the map with walls. Obstacles = inf
%
%---------------------------------------------------------
function map = createMap2(lenx, leny, objLoc, objSize, res)
    %Make matrix representing map
    map = zeros(lenx*res, leny*res);

    %Adding walls
    map(:,1) = inf;
    map(:, lenx*res) = inf;
    map(1,:) = inf;
    map(leny*res, :) = inf;
    
    %Recalculate size for this grid
    sizeGrid = (objSize/2)*res;
    %Add objects
    for i = 1:1:size(objLoc,1)
        xbounds = [objLoc(i,1)*res-sizeGrid,objLoc(i,1)*res+sizeGrid];
        ybounds = [objLoc(i,2)*res-sizeGrid,objLoc(i,2)*res+sizeGrid];
        
        for j = xbounds(1):1:xbounds(2)
            for k = ybounds(1):1:ybounds(2)
                if((j > 1 && j < lenx*res+1) && (k > 1 && k < leny*res+1))
                    map(j,k) = inf;
                end
            end
        end
    end
    
    %Plotting to test
%      surf(map');
%      colormap(gray);
%      view(2);
end