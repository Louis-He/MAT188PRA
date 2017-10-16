for a = [1:0.1:2]
   x = linspace(0,6,61);
   y = 1000/a.*exp(0.5.*a.*x);
   plot (x,y)
   hold on
end
xlabel('Time(hour)')
ylabel('Bacteria population, P(t)')
legend('a=1.0','a=1.1','a=1.2','a=1.3','a=1.4','a=1.5','a=1.6','a=1.7','a=1.8','a=1.9','a=2.0')
