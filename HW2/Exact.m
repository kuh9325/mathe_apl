function x = Exact(h) % �ؼ��� �� ���� (symbolic �̿�)
global a b
f=diffor;
t = a:h:b;
x = eval(subs(f,t)); % symbolic �Լ��� x���� �����Ͽ� ġ�� ����
x = x.'; % ������ ���͸� ��ġ