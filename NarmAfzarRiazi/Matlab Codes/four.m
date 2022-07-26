
    S = imread('house.png') 
    C = splitlines(S);
    myScreen = cell2mat(S)
    x = 3;
    y = 7;
    newColor = 0; 
    findColor(S, x, y, newColor);

    for i=1:9 
        for j=1:13
           fprintf("%d\t",S(i,j))
        end
        fprintf("\n")
    end
    
function floodFill(myScreen,x,y,currColor,newColor) 
    % Base cases 
    if (x < 0 || x >= 9 || y < 0 || y >= 13) 
        return; 
    end
    if (myScreen(x,y) ~= currColor) 
        return; 
    end
    if (myScreen(x,y) == newColor) 
        return; 
    end
  
    % Replace the color at cell (x, y) 
    myScreen(x,y) = newColor; 
  
    % Recursively call for north, east, south and west 
    floodFill(myScreen, x+1, y, currColor, newColor); 
    floodFill(myScreen, x-1, y, currColor, newColor); 
    floodFill(myScreen, x, y+1, currColor, newColor); 
    floodFill(myScreen, x, y-1, currColor, newColor); 
end

function findColor(myScreen,x,y,newColor) 

    currColor = myScreen(x,y); 
    floodFill(myScreen, x, y, currColor, newColor); 
end 