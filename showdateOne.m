function [t, varargout] = showdateOne
DateStr = date;
t = 'today: ';
varargout{1} = DateStr(8:11);
varargout{2} =  DateStr(4:6);
varargout{3} = DateStr(1:2);
outnum = nargout;
if outnum > 4
    for k=4:outnum-1
        vargargout{k} = 'No output';
    end
    msgbox({'��º��� ���� 4�� ���Ϸ� ����!''5��° �̻� ��º���: ���� ��'},'����')
end
end