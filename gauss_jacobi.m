function [x, y, z] = gauss_jacobi(xfun, yfun, zfun, no_of_iter, x_init, y_init, z_init)

format long;

x_exists = exist('x_init', 'var');
y_exists = exist('y_init', 'var');
z_exists = exist('z_init', 'var');

if x_exists == 1
    x = x_init;
else
    x = 0;
end
if y_exists == 1
    y = y_init;
else
    y = 0;
end
if z_exists == 1
    z = z_init;
else
    z = 0;
end

xtemp = x;
ytemp = y;
ztemp = z;

for a = 1:no_of_iter
    x = xfun(ytemp, ztemp);
    y = yfun(ztemp, xtemp);
    z = zfun(xtemp, ytemp);
    xtemp = x;
    ytemp = y;
    ztemp = z;
end