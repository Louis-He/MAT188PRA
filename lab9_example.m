domain_x = [-3:1:3];
domain_y = [-3:0.5:3];
[X,Y] = meshgrid(domain_x, domain_y);
Z = Y.^2-X.^2;
surf(X, Y, Z); 
xlabel('x');ylabel('y');zlabel('z'); 
