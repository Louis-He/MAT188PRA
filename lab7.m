E = 68.9e9 ; 
%Aluminum Alloy 1100: 68.9e9 GPa
%Nickel 200: 204e9 GPa
%Steel Alloy 4340: 207e9 GPa
p1 = 50;%plot choice, the weight of P

AD = true;
BE = true;
CG = true;

Fad = [,];
Fbe = [,];
Fcg = [,];
dLab = [,];
dLbe = [,];
dLcg = [,];

A = [1 1 1;0 10 16; 24/(E * 4e-4) -80/(E * 4e-4) 20/(E * 4e-4)];
for p = 1:50
    for d_01 = 1:160      
        B = [p * 1000;d_01 / 10.0 * p * 1000;0];
        solution = A\B;
        Fad(p,d_01) = solution(1);
        Fbe(p,d_01) = solution(2);
        Fcg(p,d_01) = solution(3);
        
        dLad = solution(1,1) * 4 / (E * 4e-4);
        dLbe = solution(2,1) * 5 / (E * 4e-4);
        dLcg = solution(3,1) * 2 / (E * 4e-4);
        
        dLadp(p,d_01) = dLad / 4.0;
        dLbep(p,d_01) = dLbe / 5.0;
        dLcgp(p,d_01) = dLcg / 2.0;
        
        if dLad / 4 > 0.001
           AD = false;
        end
        if dLbe / 5 > 0.001
           BE = false;
        end
        if dLcg / 2 > 0.001
           CG = false;
        end
    end
end

x = linspace(0,16,160);
plot(x, dLadp(p1,:))
hold on
plot(x, dLbep(p1,:))
plot(x, dLcgp(p1,:))
grid on
legend('Lad%','Lbe%','Lcg%')

if AD && BE && CG
   true
else
   false
end