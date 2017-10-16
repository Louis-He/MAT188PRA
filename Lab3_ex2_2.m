f = @cfunc;
integral(f,-6,4)

syms t
function y = cfunc(x)
y = sqrt(24-2.*x-x.^2);
end