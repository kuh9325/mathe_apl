function x = Taylor2(h) % ���Ϸ� �޼�(2���ױ��� ����)�� �ٻ��� ��ġ�� �� ����
global a b y0
syms t y
f = matlabFunction(formula); %symbolic -> function handle ��ȯ
midf = diff(f,t)+diff(f,y)*f; %chain rule
df = matlabFunction(midf); % �̺��Լ�
x(1) = y0; n = (b-a)/h;
t = a:h:b;
for i = 1:n
x(i+1) = x(i)+h*f(t(i), x(i))+h^2*df(t(i), x(i))/2;
end
x = x';