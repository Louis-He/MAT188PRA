syms t
g = 9.81;
w = 10 * g;
y0 = 1.6;
v0 = 10;

for theta = 0:90
    ax = 0;
    ay = g;
    
    vx(theta + 1) = cosd(theta) .* v0;
    vy(theta + 1) = -1 .* g .* t + sind(theta) .* v0;
    
    sx(theta + 1) = cosd(theta) .* v0 .* t + 1/2 .* ax .* t .^ 2;
    sy(theta + 1) = sind(theta) .* v0 .* t - 1/2 .* ay .* t .^ 2 + y0;
    
end

seq = [1,11,21,31,41,51,61,71,81,91];

for i = (1:10)
    fplot(sx(seq(i)), sy(seq(i)));
    hold on
end

axis([0 12 0 8])

legend(['angle = 0 deg'], ['angle = 10 deg'], ['angle = 20 deg'], ['angle = 30 deg'], ['angle = 40 deg'], ['angle = 50 deg'], ['angle = 60 deg'], ['angle = 70 deg'], ['angle = 80 deg'], ['angle = 90 deg']);
hold off 

xlabel('x-coordinate')
ylabel('y-coordinate')
title('The projectile Trajectory of different launch angle')
grid on;
