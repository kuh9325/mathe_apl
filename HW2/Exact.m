function x = Exact(h) % 해석적 해 저장 (symbolic 이용)
global a b
f=diffor;
t = a:h:b;
x = eval(subs(f,t)); % symbolic 함수에 x값을 대입하여 치역 생성
x = x.'; % 생성된 벡터를 전치