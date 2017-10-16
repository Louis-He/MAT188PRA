syms x1
syms t
v(t) = 14.4*(1-exp(sym(-t/2.72)));
s = @sfunc;
fplot(v,[0,15]);
hold on

a = linspace(0,15,1501);
b = a';
Rintegral = [];
for i = 1:1501
    Rintegral(i,1) = integral(@(x) 14.4.*(1-exp((-x/2.72))),0,b(i,1));
end
plot(a,Rintegral,'--')
title("The velocity and the position of the runner")
xlabel("time(s)")
ylabel("velocity(m/s) and position(m)")
legend(["velocity(m/s)","position(m)"])