%part A
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

%Part B
% ploynomial curve fitting
vxfit = polyfit(t,vx,4);
vyfit = polyfit(t,vy,3);

vxfit_x = 6.48721477811766e-07.*t.^4 - 0.000117067573943751.*t.^3 + 0.00703691201284210.*t.^2 -0.153555493800963.*t + 0.858668171894125;
vyfit_y = -3.65664831812307e-06.*t.^3 + 0.000448610981891835.*t.^2 - 0.0275877310355124.*t + 0.481783300941877;
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
%{
plot(robpos(:,2),robpos(:,end))
hold on
plot(sxfit,syfit)
%}

% compare fitting velocity model to original 
hold off
plot(t,vx)
hold on
plot(t,vxfit_x)
plot(t,vy)
plot(t,vyfit_y)
plot(t,v)
plot(t,vfit)
title('velocity of the robots on different axis')
xlabel('time(s)')
ylabel('Velocity(m/s)')
legend('velocity_x(original)','velocity_x(fitting)','velocity_y(original)','velocity_y(fitting)','velocity(original)','velocity(fitting)')
%}

% compare fitting acceleration model to original 
%{
hold off
plot(t,a)
hold on
plot(t,afit)
title('acceleration of the robots on different axis')
xlabel('time(s)')
ylabel('Acceleration(m/s**2)')
legend('acceleration_x(original)','acceleration_x(fitting)','acceleration_y(original)','acceleration_y(fitting)','acceleration(original)','acceleration(fitting)')
%}

%Part C
t = linspace(0,60,61);
sxc = 1.2.*sin((2.*pi)/60.*(t-15))+1.2;
syc = 1.2.*sin((2.*pi)/60.*t);
vc = []; vxc = []; vyc = []; ac = []; axc = []; ayc = [];
for t = 1:60
    vxc(t) = sxc(t+1)-sxc(t);
    vyc(t) = syc(t+1)-syc(t);
    vc(t) = sqrt(vxc(t+1)^2+vyc(t+1)^2);
    if t > 1
        ac(t) = vc(t) - vc(t-1);
        axc(t) = vxc(t) - vxc(t-1);
        ayc(t) = vyc(t) - vyc(t-1);
    end
end
t = linspace(1,60,60);
% path of the robot
hold off
plot(sxc,syc)
axis([0,2.4,-1.2,1.2])
%}

%{
% velocity of the robot
hold off
plot(t,vxc)
hold on
plot(t,vyc)
plot(t,vc)
xlabel('time(s)')
ylabel('Velocity(m/s)')
legend('velocity_x','velocity_y','velocity')
%}

%{
% acceleration of the robot
hold off
plot(t,axc)
hold on
plot(t,ayc)
plot(t,ac)
xlabel('time(s)')
ylabel('Acceleration(m/s**2)')
legend('acceleration_x','acceleration_y','acceleration')
%}
