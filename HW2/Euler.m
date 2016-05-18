function x=Euler(h)
global a b y0
f = matlabFunction(formula); %symbolic -> function handle º¯È¯
x(1)=y0; n=(b-a)/h;
t=a:h:b;
for i=1:n
x(i+1)=x(i)+f(t(i),x(i))*h;
end
x=x.';
