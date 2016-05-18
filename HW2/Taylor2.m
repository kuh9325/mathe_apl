function x = Taylor2(h) % 테일러 급수(2차항까지 전개)로 근사한 수치적 해 저장
global a b y0
syms t y
f = matlabFunction(formula); %symbolic -> function handle 변환
midf = diff(f,t)+diff(f,y)*f; %chain rule
df = matlabFunction(midf); % 미분함수
x(1) = y0; n = (b-a)/h;
t = a:h:b;
for i = 1:n
x(i+1) = x(i)+h*f(t(i), x(i))+h^2*df(t(i), x(i))/2;
end
x = x';