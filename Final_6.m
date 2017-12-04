load('robpos.mat')
%part A
figure;
plot(robpos(:,2),robpos(:,end))
title('position of the robots')
xlabel('x-axis')
ylabel('y-axis')  
legend('path of the robots')
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
figure;
plot(t,v)
hold on
plot(t,a)
title('velocity and acceleration of the robots')
legend('velocity','acceleration')
xlabel('time(s)')
ylabel({'Velocity(m/s)','acceleration(m/s**2)'}) 

%Part B
% ploynomial curve fitting
vxfit = polyfit(t,vx,5);
vyfit = polyfit(t,vy,5);

vxfit_x = vxfit(1).*t.^5 + vxfit(2).*t.^4 + vxfit(3).*t.^3 + vxfit(4).*t.^2 + vxfit(5).*t + vxfit(6);
vyfit_y = vyfit(1).*t.^5 + vyfit(2).*t.^4 + vyfit(3).*t.^3 + vyfit(4).*t.^2 + vyfit(5).*t + vyfit(6);
vfit = sqrt(vxfit_x.^2 + vyfit_y.^2);

sxfit = []; syfit = [];axfit = []; ayfit = [];afit = [];
sxfit(1) = 0; syfit(1) = -3;
for i = 2:60
   sxfit(i) = sxfit(i-1) + vxfit_x(i-1);
   syfit(i) = syfit(i-1) + vyfit_y(i-1);
   axfit(i) = vxfit_x(i) - vxfit_x(i-1); 
   ayfit(i) = vyfit_y(i) - vyfit_y(i-1);
   afit(i) = axfit(i)^2 + ayfit(i)^2;
end

% plot fitting path [check purpose]
%
figure;
plot(robpos(:,2),robpos(:,end))
hold on
plot(sxfit,syfit)
title('position of the robots')
xlabel('x-axis(m)')
ylabel('y-axis(m)')
legend('Position(original)','Position(fitting)')
%}

% compare fitting velocity model to original 
figure;
hold on
plot(t,v)
plot(t,vfit)
title('velocity of the robots')
xlabel('time(s)')
ylabel('Velocity(m/s)')
legend('velocity(original)','velocity(fitting)')

% compare fitting acceleration model to original 
figure;
hold off
plot(t,a)
hold on
plot(t,afit)
title('acceleration of the robots')
xlabel('time(s)')
ylabel('Acceleration(m/s**2)')
legend('acceleration(original)','acceleration(fitting)')

%Part C
t = linspace(0,60,61);
sxc = 1.2.*sin((2.*pi)/60.*(t-15))+1.2;
syc = 1.2.*sin((2.*pi)/60.*t);
vc = []; vxc = []; vyc = []; ac = []; axc = []; ayc = [];
for t = 1:60
    vxc(t) = sxc(t+1)-sxc(t);
    vyc(t) = syc(t+1)-syc(t);
    vc(t) = sqrt(vxc(t)^2+vyc(t)^2);
    if t > 1
        ac(t) = vc(t) - vc(t-1);
        axc(t) = vxc(t) - vxc(t-1);
        ayc(t) = vyc(t) - vyc(t-1);
    end
end
t = linspace(1,60,60);
% path of the robot
figure;
plot(sxc,syc)
axis([0,2.4,-1.2,1.2])
title('path of the robots')
xlabel('x-axis(m)')
ylabel('y-axis(m)')
legend('Position')

% velocity of the robot
figure;
hold on
plot(t,vc)
title('Velocity of the robots')
xlabel('time(s)')
ylabel('Velocity(m/s)')
legend('velocity')

% acceleration of the robot
figure;
hold on
plot(t,ac)
title('acceleration of the robots')
xlabel('time(s)')
ylabel('Acceleration(m/s**2)')
legend('acceleration')
