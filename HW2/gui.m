function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 18-Jul-2015 00:27:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
global a b
a = 0; b = 2;
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)
% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using test.
if strcmp(get(hObject,'Visible'),'off')
        hold on
        plot(a:0.1:b,Exact(0.1),'k');
        plot(a:0.2:b,Euler(0.2),'g');
        plot(a:0.1:b,Euler(0.1),'m');
        legend('Exact','Euler (h=0.2)','Euler (h=0.1)');
end

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
axes(handles.axes1);
cla;
global a b
popup_sel_index = get(handles.popupmenu1, 'Value');
switch popup_sel_index
    case 1
        h=0.2;
        set(handles.uitable1,'columnname', ...
            {'t' 'Exact' 'Euler'  'Error' 'Errorbound' });
        set(handles.uitable1,'data', ...
            [[a:h:b]' Exact(h) Euler(h) abs(Exact(h)-Euler(h)) Errorbound(h)]);
        hold on
        plot(a:0.1:b,Exact(0.1),'k');
        plot(a:0.2:b,Euler(0.2),'g');
        plot(a:0.1:b,Euler(0.1),'m');
        legend('Exact','Euler (h=0.2)','Euler (h=0.1)');
    case 2
        h=0.1;
        set(handles.uitable1,'columnname', ...
            {'t' 'Exact' 'Euler(h=0.1)'  'Error' 'Errorbound' });
        set(handles.uitable1,'data', ...
            [[a:h:b]' Exact(h) Euler(h) abs(Exact(h)-Euler(h)) Errorbound(h)]);
        hold on
        plot(a:0.1:b,Exact(0.1),'k');
        plot(a:0.2:b,Euler(0.2),'g');
        plot(a:0.1:b,Euler(0.1),'m');
        legend('Exact','Euler (h=0.2)','Euler (h=0.1)');
    case 3
        h=0.2;
        set(handles.uitable1,'columnname', ...
            {'t' 'Exact' 'Euler'  'Error' 'Taylor' 'Error' });
        set(handles.uitable1,'data', ...
            [[a:h:b]' Exact(h) Euler(h) abs(Exact(h)-Euler(h)) ...
            Taylor2(h) abs(Exact(h)-Taylor2(h))]);
        hold on
        plot(a:h:b,Exact(h),'k');
        plot(a:h:b,Euler(h),'g');
        plot(a:h:b,Taylor2(h),'r');
        legend('Exact','Euler','2th Taylor');
    case 4
        h=0.2;
        set(handles.uitable1,'columnname', ...
            {'t' 'Exact' 'Midpoint'  'Error' 'Taylor' 'Error' });
        set(handles.uitable1,'data', ...
            [[a:h:b]' Exact(h) Midpoint(h) abs(Exact(h)-Midpoint(h)) ...
            Taylor2(h) abs(Exact(h)-Taylor2(h))]);
        hold on
        plot(a:h:b,Exact(h),'k');
        plot(a:h:b,Midpoint(h),'b');
        plot(a:h:b,Taylor2(h),'r');
        legend('Exact','Midpoint','2th Taylor');
    case 5
        h=0.2;
        set(handles.uitable1,'columnname', ...
            {'t' 'Exact' 'Midpoint'  'Error' 'Meuler' 'Error' });
        set(handles.uitable1,'data', ...
            [[a:h:b]' Exact(h) Midpoint(h) abs(Exact(h)-Midpoint(h)) ...
            Meuler(h) abs(Exact(h)-Meuler(h))]);
        hold on
        plot(a:h:b,Exact(h),'k');
        plot(a:h:b,Midpoint(h),'b');
        plot(a:h:b,Meuler(h),'y');
        legend('Exact','Midpoint','Modified Euler');
    case 6
        % h값이 2개 이상이므로 행렬을 테이블에 저장하는 구조
        h1 = 0.1; h2 = 0.05; h3 = 0.025;
        h = min([h1,h2,h3]); % 포괄적인 범위를 위한 코드
        n = (b-a)/h+1;
        n1 = h1/h; n2 = h2/h; n3 = h3/h;
        Exa = Exact(h); Eul = Euler(h); 
        Mid = Midpoint(h); RK = RK4(h);
        for i = 1:n % 해당 h구간에 데이터 없으면 출력하지 않는 구조
            if rem(i,n1) ~= 1 && n1 ~= 1
                RK(i,1) = NaN;
            end
            if rem(i,n2) ~= 1 && n2 ~= 1
                Mid(i,1) = NaN;
            end
            if rem(i,n3) ~= 1 && n3 ~= 1
                Exa(i,1) = NaN;
                Eul(i,1) = NaN;
            end
        end
        set(handles.uitable1,'columnname', ...
            {'tvalue' 'Rvalue' 'RK4|(h=0.1)' 'Error1' ... % 줄바꿈을 위해 '|' 사용
            'Midpoint|(h=0.05)' 'Error2' 'Euler|(h=0.025)' 'Error3' });
        set(handles.uitable1,'data', [ [a:h:b]' Exa RK abs(Exa-RK) Mid ...
            abs(Exa-Mid) Eul abs(Exa-Eul)]);
        hold on
        plot(a:h1:b,RK4(h1),'c');
        plot(a:h2:b,Midpoint(h2),'b');
        plot(a:h3:b,Euler(h3),'g');
        legend('RK4','Midpoint','Euler');
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

global ft a b y0
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
ft = 'y+exp(t)-1'; a =0; b =2; y0= 1; %초기 설정값




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)



% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
xmin=eval((get(handles.edit1,'string')));
xmax=eval((get(handles.edit2,'string')));
ymin=eval((get(handles.edit3,'string')));
ymax=eval((get(handles.edit4,'string')));
axis([xmin xmax ymin ymax]);



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ft a b y0
% 함수 문자열은 그대로, t의 최대 최소 수치와 초기값은 double로 변환
ft = get(handles.edit5,'String');
a =eval(get(handles.edit6,'String'));
b = eval(get(handles.edit7,'String'));
y0 = eval(get(handles.edit8,'String'));
% 팝업 선택시에 갱신 (재귀 참조)
popupmenu1_Callback(hObject, eventdata, handles)



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
