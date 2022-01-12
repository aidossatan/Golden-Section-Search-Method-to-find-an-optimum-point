func =  @(x) x.^2-sin(x);
x_lower = -4;
x_upper = 6;
fL = func(x_lower);
fU = func(x_upper);

x1 = x_upper-0.618*(x_upper-x_lower);
x2 = x_lower+0.618*(x_upper-x_lower);
f1 = func(x1);
f2 = func(x2);

iteration = 0;
disp('iteration  x_lower  f(x_lower)  x_upper  f(x_upper)')
difference = inf;
while difference > 0.01
    disp([iteration', x_lower', func(x_lower)', x_upper', func(x_upper)',])
    if f1 < f2
        x_upper = x2;
        fU = f2;
        x1 = x_upper - 0.618*(x_upper-x_lower);
        x2 = x_lower + 0.618*(x_upper-x_lower);
        f1 = func(x1);
        f2 = func(x2);
    elseif f1 > f2
        x_lower = x1;
        fL = f1;
        x1 = x_upper - 0.618*(x_upper-x_lower);
        x2 = x_lower + 0.618*(x_upper-x_lower);
        f1 = func(x1);
        f2 = func(x2);
    else 
        x_lower = (x1+x2)/2;
        x_upper = x_lower;
    end
    
    difference = x_upper - x_lower;
    iteration = iteration + 1;
    x_optimum = (x_upper + x_lower)/2;
end

fprintf('The optimum point of the function is %5.4f', x_optimum)