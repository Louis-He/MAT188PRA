x = [-2:0.1:2];
y = [-2:0.1:2];
[X, Y]=meshgrid(x, y);
G = X.*exp(-X.*X-Y.*Y);
surfc(X,Y,G);
title("plot of x*e^(-x^2-y^2)");
xlabel('x');ylabel('y');zlabel('z');

y1 = -2;
G1 = x.*exp(-x.*x-y1.*y1);
plot(x,G1);
title("plot of x*e^(-x^2-y^2), y = -2");
xlabel('x');ylabel('z');

x1 = -1;
G1 = x1.*exp(-x1.*x1-y.*y);
plot(y,G1);
title("plot of x*e^(-x^2-y^2), x = -1");
xlabel('y');ylabel('z');

y2 = 0;
G1 = x.*exp(-x.*x-y2.*y2);
plot(x,G1);
title("plot of x*e^(-x^2-y^2), y = 0");
xlabel('x');ylabel('z');

[maxx, maxpos] = max(G);
[maximum, pos] = max(maxx);
maxpos(pos)
pos
maximum

[minx, minpos] = min(G);
[minimum, pos] = min(minx);
minpos(pos)
pos
minimum
