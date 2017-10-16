syms t
f(t) = -2*(t-2)^3+3*(t-2)+1;
f_prime(t) = diff(f);
fplot([f,f_prime],[0,4])
hold on
title('The position and the velocity of the dronw')
xlabel('time(s)')
ylabel('position(m) and velocity(m/s)')
legend('The drone flight position','the velocity of the drone')