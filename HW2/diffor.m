%참값과 M값은 수치적 해법이 아닌 해석적 해법을 통하여 해결해야 함. 
%입력받은 문자열 함수를 dsolve 명령어를 통해 처리
function fs = diffor
global ft y0
syms t y;
x1='Dy=';
str1=[x1 ft];
x2='y(0)=';
str2=[x2 num2str(y0)];
fs=dsolve(str1,str2);
