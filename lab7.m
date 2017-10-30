E = 68.9e9 ; 
%Aluminum Alloy 1100: 68.9e9 GPa
%Nickel 200: 200e9 GPa
%Steel Alloy 4340: 200e9 GPs

AD = true;
BE = true;
CG = true;

Fad = [,];
Fbe = [,];
Fcg = [,];
dLab = [,];
dLbe = [,];
dLcg = [,];
i = 0;
j = 0;

A = [1 1 1;0 10 16; 24/(E * 4e-4) -80/(E * 4e-4) 20/(E * 4e-4)];
for p = 1:50
    i = i + 1;
    j = 0;
    for d_01 = 1:160
        j = j + 1;
        B = [p * 1000;d_01/10.0*p * 1000;0];
        solution = A\B;
        Fad(i,j) = solution(1,1);
        Fbe(i,j) = solution(2,1);
        Fcg(i,j) = solution(3,1);
        
        dLad = solution(1,1) * 4 / (E * 4e-4);
        dLbe = solution(2,1) * 5 / (E * 4e-4);
        dLcg = solution(3,1) * 2 / (E * 4e-4);
        
        dLadp(i,j) = dLad / 4.0;
        dLbep(i,j) = dLbe / 5.0;
        dLcgp(i,j) = dLcg / 2.0;
        
        if dLad / 4 > 0.1
           AD = false;
        end
        if dLbe / 5 > 0.1
           BE = false;
        end
        if dLcg / 2 > 0.1
           CG = false;
        end
    end
end

x = linspace(0,16,160);
plot(x, dLadp(50,:))
hold on
plot(x, dLbep(50,:))
plot(x, dLcgp(50,:))
grid on
legend('Fad','Fbe','Fcg')

if AD && BE && CG
   true
else
    false
end
