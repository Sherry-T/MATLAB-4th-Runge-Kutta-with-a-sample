function y = fun(t,x)
  global w; global s; global gr;
  y=[x(2) ; -x(1)/s^2*x(2)^2/(x(1)^2/s^2+1)-(gr/s-w^2)*x(1)/(x(1)^2/s^2+1)];
  % 《分析力学》课本p46页例3-5中方程(g)
end
