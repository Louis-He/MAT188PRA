v = @cfunc;
integral(v,0,4)

syms t
function y = cfunc(x)
y = 3.*x.^2 + 1;
end