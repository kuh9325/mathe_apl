function x=Meuler(h)
global a b y0
f = matlabFunction(formula); %symbolic -> function handle ��ȯ
x(1)=y0; n=(b-a)/h;
t=a:h:b;
for i=1:n
x(i+1)=x(i)+h/2*(f(t(i),x(i))+f(t(i+1),x(i)+h*f(t(i),x(i))));
end
x=x.';