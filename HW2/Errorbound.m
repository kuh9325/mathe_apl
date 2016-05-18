function x = Errorbound(h)
global a b
t = a:h:b; L = Lsolve; M = Msolve;
x = eval(h*M*(exp(L*t-a)-1)/(2*L));
x = x';

function L = Lsolve
global a b
syms t y;
Y = diffor;
f = matlabFunction(formula);
df = diff(f,y);
t = a:0.01:b; % t의 범위에서의 최대값을 찾기 위해 0.01단위로 대입
y=subs(Y,t);
x = abs(subs(df,[t,y]));%기울기의 절대값이 최대값은 L임을 이용
L=max(x);

function M = Msolve
global a b
Y = diffor;
t = a:0.01:b; % t의 범위에서의 최대값을 찾기 위해 0.01단위로 대입
d2y = diff(Y,2);
x = eval(abs(subs(d2y,t)));
M = max(x);