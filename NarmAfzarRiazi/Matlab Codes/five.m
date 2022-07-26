

%alef
         x0 = 0;
         y0 = 1;
         h = 0.5;
         x = 0.1;
    
       solveEquationEulers(x0, y0, h, x);
  %be
  y0 = 0;
  n = 10;
  h2 = 1/n;

  solveEquationEulers2(x0,y0,h2,x)
  
  
  function test = Test(x,y)
  test = x^2 + y;
  end



function equation = Equation(x,y)
    equation = (x + y);
end

function solveEquationEulers(x0,y,h,x)
     temp = 0.0;
    while (x0 < x) 
        temp = y;
        y = y + h * Equation(x0, y);
        x0 = x0 + h;
    end
    fprintf("The solution of the differential equation at x = %s",x)
    fprintf(" is f(x, y) = %s \n",y)
    
end

function solveEquationEulers2(x0,y,h,x)
     temp = 0.0;
    while (x0 < x) 
        temp = y;
        y = y + h * Test(x0, y);
        x0 = x0 + h;
    end
    fprintf("The solution of the differential equation at x = %s",x)
    fprintf(" is f(x, y) = %s \n",y)
    
end
