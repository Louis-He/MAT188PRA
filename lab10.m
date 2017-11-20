grades = [62 52 71 80 83];
%grades = [82 55 60 56 79];
c_p = 0;
CGPA = 0;
a = 1;
for i = 1 : length(grades)
    if grades(i) >= 85
       CGPA = CGPA + 4.0;
       c_p = c_p + 1;
    elseif grades(i) >= 80
       CGPA = CGPA + 3.7;
       c_p = c_p + 1;
    elseif grades(i) >= 77
       CGPA = CGPA + 3.3;
       c_p = c_p + 1;
    elseif grades(i) >= 73
       CGPA = CGPA + 3.0;
       c_p = c_p + 1;
    elseif grades(i) >= 70
       CGPA = CGPA + 2.7;
       c_p = c_p + 1;
    elseif grades(i) >= 67
       CGPA = CGPA + 2.3;
       c_p = c_p + 1;
    elseif grades(i) >= 63
       CGPA = CGPA + 2.0;
    elseif grades(i) >= 60
       CGPA = CGPA + 1.7;
    elseif grades(i) >= 57
       CGPA = CGPA + 1.3;
    elseif grades(i) >= 53
       CGPA = CGPA + 1.0;
    elseif grades(i) >= 50
       CGPA = CGPA + 0.7;
    end
    a = a + 1;
end
CGPA / 5
c_p
