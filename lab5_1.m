xpts=[0,5,10,15,20];
ypts=[200,152,118,93,74];
coefs4 = polyfit(xpts,ypts,4);

xpts2=xpts';
ypts2=ypts';
exponential = fit(xpts2,ypts2,'exp1');

x = linspace(0,25,251);
y4 = polyval(coefs4,x);

plot(xpts,ypts,'rx');
hold on
plot(x,y4);
hold on 
plot(exponential);

xlabel('Time(min)')
ylabel('Penicillin concentration(?g/ml)')
legend(['data'],['poly-fit'],['exp-fit'])
