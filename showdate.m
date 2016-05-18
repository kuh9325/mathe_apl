function [t, varargout] = showdate
DateStr = date;
t = 'today: ';
varargout{1} = DateStr(8:11);
varargout{2} =  DateStr(4:6);
varargout{3} = DateStr(1:2);
end