% 문자열로 입력받은 함수를 inline 함수로 변환하고 이를 다시 symbolic 함수로 변환하는 함수
function fs = formula
global ft
fi = inline(ft);
fs = inline2sym(fi);

% inline 함수를 symbolic 함수로 변환하는 함수
function f0 = inline2sym(fi)
str = argnames(fi);
[fil,~] = size(str);
Zax = str{1};
eval(['syms ',str{1}])
if fil>1
    for m = 2:fil
        eval(['Zax = [''',Zax,',',char(str{m}),'''];']);  
        eval(['syms ',str{m}])
    end 
end
eval(['f0 = fi(',Zax,');']);