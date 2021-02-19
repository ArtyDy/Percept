% Clear the workspace and the screen
sca;
close all;
clearvars;
sub='sub-00AD';
filepath= fullfile('..', 'Data', sub);
mkdir(filepath);

data = load('coords.mat');
array =data.data;

array = array - array(end);
for i=1:length(array)-1
    arraytest(i)=abs(array(i+1)-array(i));
end

for i=1:length(arraytest)-1
    arraytesttest(i)=arraytest(i+1)-arraytest(i);
end


k=1;
for i = 1:10:length(array)
    
    if i+10 < length(array)
        
        for j=i:i+10
            a(i)=0;
            a(j+1)=abs(array(j+1)-array(j));
        end
        b(k)=mean(a(i:i+9));
        k=k+1;
    else
        
        a(i)=0;
        a(i+1)=abs(array(i+1)-array(i));
        
        b(k)=a(i+1);
    end
        
end





% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);

Screen('Preference', 'SkipSyncTests', 2);
Screen('Preference','SuppressAllWarnings',1);
Screen('Preference', 'VisualDebugLevel', 1 );
 
% Get the screen numbers
screens = Screen('Screens');


% Draw to the external screen if avaliable
screenNumber = max(screens);

% Define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);


[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);
hertz = Screen('NominalFrameRate', window); 
[screenXpixels, screenYpixels] = Screen('WindowSize', window);
ifi = Screen('GetFlipInterval', window);

rhertz = FrameRate(window);
[xCenter, yCenter] = RectCenter(windowRect);
Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
topPriorityLevel = MaxPriority(window);
Priority(topPriorityLevel);

[xCenter, yCenter] = RectCenter(windowRect);
fixCrossDimPix = 40;
xCoords = [-fixCrossDimPix fixCrossDimPix 0 0];
yCoords = [0 0 -fixCrossDimPix fixCrossDimPix];
allCoords = [xCoords; yCoords];
lineWidthPix = 4;


meanac=0.00058656*screenYpixels;
meandec=-0.00056567*screenYpixels;

acdown=0.00057656;
ratiodown=1.107454;
meanacdown=0.00060685*screenYpixels;
meandecdown=-(0.00060685/ratiodown)*screenYpixels;

acup=0.00057656;
ratioup=1.339906;
meanacup=0.00064878*screenYpixels;
meandecup=-(0.00064878/ratioup)*screenYpixels;
% meanacup=0.053160*0.7*screenYpixels;
% meandecup=-0.039674*0.7*screenYpixels;
% 
% meanacdown=0.047124*0.7*screenYpixels;
% meandecdown=-0.042371*0.7*screenYpixels;


for i=1:64
    if i<=30
        array60diffdiff(i)=meanac;
    else
        array60diffdiff(i)=meandec;
    end
end

for i=1:65
    if i<=28
        array60updiffdiff(i)=meanacup;
    else
        array60updiffdiff(i)=meandecup;
    end
end

for i=1:65
    if i<=31
        array60downdiffdiff(i)=meanacdown;
    else
        array60downdiffdiff(i)=meandecdown;
    end
end

for i=1:58
    if i<=27
        array40diffdiff(i)=meanac;
    else
        array40diffdiff(i)=meandec;
    end
end

for i=1:59
    if i<=25
        array40updiffdiff(i)=meanacup;
    else
        array40updiffdiff(i)=meandecup;
    end
end

for i=1:59
    if i<=28
        array40downdiffdiff(i)=meanacdown;
    else
        array40downdiffdiff(i)=meandecdown;
    end
end

for i=1:70
    if i<=33
        array70diffdiff(i)=meanac;
    else
        array70diffdiff(i)=meandec;
    end
end

for i=1:71
    if i<=31
        array70updiffdiff(i)=meanacup;
    else
        array70updiffdiff(i)=meandecup;
    end
end

for i=1:71
    if i<=34
        array70downdiffdiff(i)=meanacdown;
    else
        array70downdiffdiff(i)=meandecdown;
    end
end

array60diff(1)=(arraytest(1)/array(1))*0.7*screenYpixels;

for i =1:length(array60diffdiff)
    array60diff(i+1)=array60diff(i) +array60diffdiff(i);
end

array60test(1)=0;

for i=1:length(array60diff)
    array60test(i+1)=array60test(i)+array60diff(i);
end

array60updiff(1)=(arraytest(1)/array(1))*0.7*screenYpixels;

for i =1:length(array60updiffdiff)
    array60updiff(i+1)=array60updiff(i) +array60updiffdiff(i);
end

array60uptest(1)=0;

for i=1:length(array60updiff)
    array60uptest(i+1)=array60uptest(i)+array60updiff(i);
end

array60downdiff(1)=(arraytest(1)/array(1))*0.7*screenYpixels;

for i =1:length(array60downdiffdiff)
    array60downdiff(i+1)=array60downdiff(i) +array60downdiffdiff(i);
end

array60downtest(1)=0;

for i=1:length(array60downdiff)
    array60downtest(i+1)=array60downtest(i)+array60downdiff(i);
end

array40diff(1)=(arraytest(1)/array(1))*0.7*screenYpixels;

for i =1:length(array40diffdiff)
    array40diff(i+1)=array40diff(i) +array40diffdiff(i);
end

array40test(1)=0;

for i=1:length(array40diff)
    array40test(i+1)=array40test(i)+array40diff(i);
end

array40updiff(1)=(arraytest(1)/array(1))*0.7*screenYpixels;

for i =1:length(array40updiffdiff)
    array40updiff(i+1)=array40updiff(i) +array40updiffdiff(i);
end

array40uptest(1)=0;

for i=1:length(array40updiff)
    array40uptest(i+1)=array40uptest(i)+array40updiff(i);
end

array40downdiff(1)=(arraytest(1)/array(1))*0.7*screenYpixels;

for i =1:length(array40downdiffdiff)
    array40downdiff(i+1)=array40downdiff(i) +array40downdiffdiff(i);
end

array40downtest(1)=0;

for i=1:length(array40downdiff)
    array40downtest(i+1)=array40downtest(i)+array40downdiff(i);
end

array70diff(1)=arraytest(1);

for i =1:length(array70diffdiff)
    array70diff(i+1)=array70diff(i) +array70diffdiff(i);
end

array70test(1)=0;

for i=1:length(array70diff)
    array70test(i+1)=array70test(i)+array70diff(i);
end

array70updiff(1)=(arraytest(1)/array(1))*0.7*screenYpixels;

for i =1:length(array70updiffdiff)
    array70updiff(i+1)=array70updiff(i) +array70updiffdiff(i);
end

array70uptest(1)=0;

for i=1:length(array70updiff)
    array70uptest(i+1)=array70uptest(i)+array70updiff(i);
end

array70downdiff(1)=(arraytest(1)/array(1))*0.7*screenYpixels;

for i =1:length(array70downdiffdiff)
    array70downdiff(i+1)=array70downdiff(i) +array70downdiffdiff(i);
end

array70downtest(1)=0;

for i=1:length(array70downdiff)
    array70downtest(i+1)=array70downtest(i)+array70downdiff(i);
end



% g=(hertz+1)/10; 
g=6;
b = b*10/g;

array60(1)=array(1);
array60(g+1)=array(11);
array60(2*g+1)=array(21);
array60(3*g+1)=array(31);
array60(4*g+1)=array(41);
array60(5*g+1)=array(51);
array60(6*g+1)=array(61);
array60(7*g+1)=array(71);
array60(8*g+1)=array(81);
array60(9*g+1)=array(91);
array60(10*g+1)=array(101);
array60(11*g+1)=array(111);
array60(11*g+2)=array(112);

k=1;
for i = 1:g:11*g
    for j=i+1:i+g-1
        array60(j)=array60(g*(k-1)+1)-b(k)*(j-i);
    end
    k=k+1;
end

array60=abs(array60-array60(1));

for i = 1:length(array60)-1 
    arraydiff(i+1)=array60(i+1)-array60(i);
end

for i = 1:length(arraydiff)-1
    arraydiffdiff(i+1)=arraydiff(i+1)-arraydiff(i);
end

arraydifffast(1)=0;
k=2;
for i = 3:2:length(arraydiff)
    arraydifffast(k)=arraydiff(i)+arraydiff(i-1);
    k=k+1;
end

arraydiffslow(1)=0;
k=2;
for i=1:length(arraydiff)
    arraydiffslow(k)=arraydiff(i)/2;
    arraydiffslow(k+1)=arraydiff(i)/2;
    k=k+2;
end 

% Sync us and get a time stamp
vbl = Screen('Flip', window);
waitframes = 1;


% cnds = [8 3 1 5 7 6 4 9 2 10];
cnds = [1 2 3 4 5 6 1 7 8 4 9 10];
% xp_cnds = [8,1,7,10,4,5,1,4,4,4,3,9,1,7,9,5,8,9,1,3,1,4,4,4,6,1,5,6,10,4,5,1,5,5,10,9,1,7,1,5,6,4,1,4,4,1,8,5,2,4,1,5,2,6,3,1,10,9,4,4,6,10,4,3,7,8,4,3,3,4,1,4,9,8,6,7,7,1,9,10,2,10,9,7,1,7,6,8,2,8,8,1,8,6,3,1,10,9,3,6,2,4,7,2,6,1,4,3,10,10,2,8,7,2,5,2,3,2,1,9];
xp_cnds = [ 1 2 3 4 5 6 7 8 9 10 1 2 3 4 5 6 7 8 9 10 1 2 3 4 5 6 7 8 9 10];
ntrys=length(xp_cnds) ;
time=zeros(ntrys, 1 );
terror=zeros(ntrys, 1);
clickpos=zeros(ntrys, 2);
realtimes=zeros(ntrys, 1);
% yerror=zeros(ntrys, 1);
% str_cnds = [DB DM DL UL UM UB DF DS UF US];
trynr=1;
btop=0.2*screenYpixels;
bbot=0.8*screenYpixels;
bamp=bbot-btop;
% array60diff=array60diff*bamp/(array60test(end)-array60test(1));
realtimes= [1.10000000000000;1.10000000000000;1.10000000000000;1.10000000000000;1.10000000000000;1.10000000000000; 1.20000000000000;1.00000000000000; 1.20000000000000;1.00000000000000];
xp_realtimes=realtimes(xp_cnds);
HideCursor();

for cnd = xp_cnds
   
    
    
    if cnd == 1
        fac=0.05;
        vec=array60downdiff;
        bot = 0.65*screenYpixels;
        top = fac*screenYpixels;
        amp=bot-top; % 60%
        startpos=top+rand*0.15*screenYpixels;
        endpos=startpos+amp;
        vec=vec*amp/(array60downtest(end)-array60downtest(1));
        hidestep=32;
    elseif cnd == 2
        fac=0.05;
        vec=array60downdiff;
        bot = (1-fac)*screenYpixels;
        top = fac*screenYpixels;
        amp=(array60downtest(end)-array60downtest(1)); % 72% screenYpixels
        startpos=0.05*screenYpixels+rand*0.1*screenYpixels;;
        endpos=startpos+amp;
        hidestep=32;
%         vec=vec*amp/(array60downtest(end)-array60downtest(1));
    elseif cnd ==3
        fac=0.05;
        vec=array60downdiff;
        top = 0.05*screenYpixels;
        bot = 0.55*screenYpixels;
        amp=bot-top; % 50%
        startpos=0.05*screenYpixels+rand*0.2*screenYpixels;
        endpos=startpos+amp;
        hidestep=32;
        vec=vec*amp/(array60downtest(end)-array60downtest(1));
    elseif cnd ==4
        fac=0.2;
        vec=-array60updiff;
        bot = (1-fac)*screenYpixels;
        top = fac*screenYpixels;
        amp=bot-top; % 60%
        startpos=0.95*screenYpixels-rand*0.15*screenYpixels;
        endpos=startpos-amp;
        vec=vec*amp/(array60uptest(end)-array60uptest(1));
        hidestep=29;
    elseif cnd ==5
        fac=0.2;
        vec=-array60updiff;
        bot = (1-fac)*screenYpixels;
        top = fac*screenYpixels;
        amp=(array60uptest(end)-array60uptest(1)); % 68 % %
        startpos=0.95*screenYpixels-rand*0.1*screenYpixels;
        endpos=startpos-(array60uptest(end)-array60uptest(1));
        hidestep=29;
%         vec=vec*amp/(array60uptest(end)-array60uptest(1));
    elseif cnd ==6
        fac=0.25;
        vec=-array60updiff;
        bot = (1-fac)*screenYpixels;
        top = fac*screenYpixels;
        amp=bot-top; % 50 %
        startpos=0.95*screenYpixels-rand*0.2*screenYpixels;
        endpos=startpos-amp;
        vec=vec*amp/(array60uptest(end)-array60uptest(1));
        hidestep=29;
    elseif cnd ==7
        fac=0.15;
        vec=array70downdiff;
        bot = (1-fac)*screenYpixels;
        top = fac*screenYpixels;
        amp=array70downtest(end)-array70downtest(1); % 70 %
        startpos=0.05*screenYpixels+0.1*rand*screenYpixels;
        endpos=startpos+(array70downtest(end)-array70downtest(1));
%         vec=vec*amp/(array80test(end)-array80test(1));
        hidestep=35;
    elseif cnd ==8
        fac=0.25;
        vec=array40downdiff;
        bot = (1-fac)*screenYpixels;
        top = fac*screenYpixels;
        amp=array40downtest(end)-array40downtest(1); % 50 %
        startpos=0.05*screenYpixels+rand*0.2*screenYpixels;
        endpos=startpos+(array40downtest(end)-array40downtest(1));
        hidestep=29;
%         vec=vec*amp/(array40test(end)-array40test(1));
    elseif cnd==9
        fac=0.15;        
        vec=-array70updiff;
        bot = (1-fac)*screenYpixels;
        top = fac*screenYpixels;
        amp=(array70uptest(end)-array70uptest(1)); % 70 %
        startpos=0.95*screenYpixels-rand*0.1*screenYpixels;
        endpos=startpos-(array70uptest(end)-array70uptest(1));
        hidestep=32;
%         vec=vec*amp/(array80test(end)-array80test(1));
    elseif cnd==10
        fac=0.25;
        vec= -array40updiff;
        bot = (1-fac)*screenYpixels;
        top = fac*screenYpixels;
        amp=array40uptest(end)-array40uptest(1); % 50 %
        startpos=0.95*screenYpixels-rand*0.2*screenYpixels;
        endpos=startpos-(array40uptest(end)-array40uptest(1));
        hidestep=26;
%         vec=vec*amp/(array40test(end)-array40test(1));
    end  
    
    
    timer = 0;
    k=1;
    

    Screen('DrawLines', window, allCoords, lineWidthPix, [0 1 0], [xCenter yCenter], 2); 
    vbl = Screen('Flip', window);
    [ secs, keyCode, deltasecs ] = KbWait(-1,[], GetSecs +1);
    keyCode = find(keyCode, 1);
    
    if keyCode == 27  
        break; 
    end

    
    vbl = Screen('Flip', window);
    WaitSecs(0.25+1.25*rand);
    Screen('DrawDots', window, [xCenter startpos], 20, [1 1 1], [], 3    );
            
    vbl = Screen('Flip', window);
    KbPressWait;
    
    WaitSecs(0.5);
    endreach =0;
    
    color = [1 1 1];
    
    
    squareYpos=startpos;
    compteur=0;
    
    
    while ~KbCheck 
            
        if k >= length(vec)
            endreach = 1;
        end
        
        
            
%         if abs(squareYpos-startpos) > 0.6*amp
%             color = [0 1 0];
%         end
        if k > hidestep+1
            color = [0 0 0];
        end
        
        if endreach ==1
            
            Screen('DrawDots', window, [xCenter endpos], 20, [0 0 0], [], 3    );
            
            vbl = Screen('Flip', window);
            
        else
            amplitude=vec(k);
            
            ypos =  amplitude ;
            
            squareYpos = squareYpos + ypos;
            
            % Draw the rect to the screen
            Screen('DrawDots', window, [xCenter squareYpos], 20 , color, [], 3);
            
            vbl  = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
            
        end
        
        % Center the rectan gle on the cent re of the screen
        %     centeredRect = CenterRectOnPointd(baseRect, xCenter, squareYpos);
        
        
        
        % Flip to the screen
        
        
        % Increment the time
        timer = timer + ifi;
        
        
        k=k+1;
        
        compteur=compteur+1;
    end
    
    time(trynr)=timer;
    terror(trynr)=-(xp_realtimes(trynr)-time(trynr));
%     [clicks,x,y,whichButton] = GetClicks(window, 0);
%     yerror(trynr)=endpos-y;
%     clickpos(trynr,1)=x*0.105;
%     clickpos(trynr, 2)=y*0.315;
    vbl = Screen('Flip', window);
    trynr=trynr+1;
    WaitSecs(1.5+rand);
end

ShowCursor();
filename_t = fullfile(filepath, [sub,'_control_terror_partial.mat']);
filename_t2 = fullfile(filepath, [sub, '_control_time_partial.mat']);
% filename_y = strcat(sub, [sub,'_yerror.mat']);
save(filename_t, 'terror');
save(filename_t2, 'time');
% save(filename_y, 'yerror');
Screen('Preference', 'VisualDebugLevel', 4);
% Screen('DrawDots', window, [xCenter endpos], 100, color, [], 3    );
% 
% 
% KbPressWait;

% Clear the screen
sca;