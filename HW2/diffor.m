%������ M���� ��ġ�� �ع��� �ƴ� �ؼ��� �ع��� ���Ͽ� �ذ��ؾ� ��. 
%�Է¹��� ���ڿ� �Լ��� dsolve ��ɾ ���� ó��
function fs = diffor
global ft y0
syms t y;
x1='Dy=';
str1=[x1 ft];
x2='y(0)=';
str2=[x2 num2str(y0)];
fs=dsolve(str1,str2);
