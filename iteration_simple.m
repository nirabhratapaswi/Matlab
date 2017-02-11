function [x_mid] = iteration_simple(xfun, no_of_iter, start_x, end_x, assume_x)

start_x_exists = exist('start_x', 'var');
end_x_exists = exist('end_x', 'var');
assume_x_exists = exist('assume_x', 'var');

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

if assume_x_exists == 1
    x_mid = assume_x;
else
    x_mid = (x0 + x1) / 2;
end

disp('x_mid value:');
disp(x_mid);

for a = 1:no_of_iter
    
    x_mid = xfun(x_mid);
    
end
    