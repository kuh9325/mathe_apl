function showft(x, varargin)
fprintf('입력 변수 인자 총 개수 = %d \n', nargin);
if nargin >= 2
    ftn = length(varargin);
    for ind = 1:ftn
        f= varargin{ind};
        figure(ind)
        plot(x,eval(f))
        title(f); xlabel('x');
    end
else
    msgbox({'입력변수 인자 개수:','2개 이상'},'주의','warn');
end
end