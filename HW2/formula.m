% ���ڿ��� �Է¹��� �Լ��� inline �Լ��� ��ȯ�ϰ� �̸� �ٽ� symbolic �Լ��� ��ȯ�ϴ� �Լ�
function fs = formula
global ft
fi = inline(ft);
fs = inline2sym(fi);

% inline �Լ��� symbolic �Լ��� ��ȯ�ϴ� �Լ�
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