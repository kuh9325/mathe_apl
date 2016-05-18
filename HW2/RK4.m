function x=RK4(h)
global a b y0
f = matlabFunction(formula); %symbolic -> function handle º¯È¯
x(1)=y0; n=(b-a)/h;
t=a:h:b;
for i=1:n
    k1=h*f(t(i),x(i));
    k2=h*f(t(i)+h/2,x(i)+k1/2);
    k3=h*f(t(i)+h/2,x(i)+k2/2);
    k4=h*f(t(i+1),x(i)+k3);
    x(i+1)=x(i)+(k1+2*k2+2*k3+k4)/6;
end
x=x';