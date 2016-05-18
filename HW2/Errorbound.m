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
t = a:0.01:b; % t�� ���������� �ִ밪�� ã�� ���� 0.01������ ����
y=subs(Y,t);
x = abs(subs(df,[t,y]));%������ ���밪�� �ִ밪�� L���� �̿�
L=max(x);

function M = Msolve
global a b
Y = diffor;
t = a:0.01:b; % t�� ���������� �ִ밪�� ã�� ���� 0.01������ ����
d2y = diff(Y,2);
x = eval(abs(subs(d2y,t)));
M = max(x);