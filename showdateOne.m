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
    msgbox({'출력변수 인자 4개 이하로 설정!''5번째 이상 출력변수: 내용 무'},'주의')
end
end