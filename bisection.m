function [x0, x1] = bisection(xfun, no_of_iter, start_x, end_x)

start_x_exists = exist('start_x', 'var');
end_x_exists = exist('end_x', 'var');

x0 = -9999;
x1 = -9998;

if start_x_exists == 1
    x0 = start_x;
end
if end_x_exists == 1
    x1 = end_x;
end

disp('Initial value of x0:');
disp(x0);
disp('Initial value of x1:');
disp(x1);

if (xfun(x0) * xfun(x1)) > 0
    x0 = -9999;
    x1 = -9998;
end

count = 0;

while (xfun(x0) * xfun(x1)) > 0 && count < 19998
    x0 = x0 + 1;
    x1 = x1 + 1;
    count = count + 1;
end

disp('Usable value of x0:');
disp(x0);
disp('Usable value of x1:');
disp(x1);

x_mid = (x0 + x1) / 2;

disp('x_mid value:');
disp(x_mid);

for a = 1:no_of_iter
    
    if xfun(x_mid) > 0 && xfun(x1) < 0 && xfun(x0) > 0
        x0 = x_mid;
    elseif xfun(x_mid) > 0 && xfun(x0) < 0 && xfun(x1) > 0
        x1 = x_mid;
    elseif xfun(x_mid) < 0 && xfun(x0) < 0 && xfun(x1) > 0
        x0 = x_mid;
    elseif xfun(x_mid) < 0 && xfun(x1) < 0 && xfun(x0) > 0
        x1 = x_mid;
    end
    
    if (xfun(x0) * xfun(x1)) < 0
        x_mid = ( x0 + x1 ) / 2;
    else
        disp('Solution is not converging, both x0 and x1 are of the same sign');
        break;
    end
    
end
    