xpts=[-2,-1,0,1,2];
ypts=[-17,6,5,4,3];
coefs2=polyfit(xpts,ypts,2);
coefs3=polyfit(xpts,ypts,3);
coefs4=polyfit(xpts,ypts,4);
coefs5=polyfit(xpts,ypts,5);

x = linspace(-2.5,2.5,501);
y2 = polyval(coefs2,x);
y3 = polyval(coefs3,x);
y4 = polyval(coefs4,x);
y5 = polyval(coefs5,x);

plot(x,y2,x,y3,x,y4,x,y5);
hold on
plot(xpts,ypts,'rx');
xlabel('x')
ylabel('y')

legend('2nd Order Curve Fit','3rd Order Curve Fit','4th Order Curve Fit','5th Order Curve Fit','known points')
