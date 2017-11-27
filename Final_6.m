plot(robpos(:,2),robpos(:,end))
title('position of the robots')
xlabel('x-axis')
ylabel('y-axis')   
v = [];
a = [];
for t = 1:60
    v(t) = sqrt((robpos(t+1,2)-robpos(t,2))^2+((robpos(t+1,end)-robpos(t,end))^2));
    vx(t) = robpos(t+1,2)-robpos(t,2);
    vy(t) = robpos(t+1,end)-robpos(t,end);
    if t > 1
        a(t) = v(t) - v(t-1);
        ax(t) = vx(t) - vx(t-1);
        ay(t) = vy(t) - vy(t-1);
    end
end
t = linspace(1,60,60);
plot(t,v)
hold on
plot(t,a)
legend('velocity','acceleration')
xlabel('time(s)')
ylabel({'Velocity(m/s)','acceleration(m/s**2)'}) 

% ploynomial curve fitting
vxfit = polyfit(t,vx,4);
vyfit = polyfit(t,vy,3);

vxfit_x = 6.48721477811766e-07.*t^4 - 0.000117067573943751.*t^3 + 0.00703691201284210.*t^2 -0.153555493800963 .*t + 0.858668171894125;
