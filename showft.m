function showft(x, varargin)
fprintf('�Է� ���� ���� �� ���� = %d \n', nargin);
if nargin >= 2
    ftn = length(varargin);
    for ind = 1:ftn
        f= varargin{ind};
        figure(ind)
        plot(x,eval(f))
        title(f); xlabel('x');
    end
else
    msgbox({'�Էº��� ���� ����:','2�� �̻�'},'����','warn');
end
end