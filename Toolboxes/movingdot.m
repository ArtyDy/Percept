% Clear the workspace and the screen
sca;
close all;
clearvars;


data = load('coords.mat');
array =data.data;

array = array - array(end);
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

ntrys=10 ;
time=zeros(ntrys, 1 );
clickpos=zeros(ntrys, 2);

% cnds = [8 3 1 5 7 6 4 9 2 10];
cnds = [1 2 3 4 5 6 7 8 9 10];
trynr=1;
for cnd = cnds
    
    if cnd == 1
        fac=0.15;
        vec=arraydiff;
        bot = (1-fac)*screenYpixels;
        top = fac*screenYpixels;
        amp=bot-top;
        startpos=top;
        endpos=bot;
    elseif cnd == 2
        fac=0.20;
        vec=arraydiff;
        bot = (1-fac)*screenYpixels;
        top = fac*screenYpixels;
        amp=bot-top;
        startpos=top;
        endpos=bot;
    elseif cnd ==3
        fac=0.25;
        vec=arraydiff;
        bot = (1-fac)*screenYpixels;
        top = fac*screenYpixels;
        amp=bot-top;
        startpos=top;
        endpos=bot;
    elseif cnd ==4
        fac=0.15;
        vec=-arraydiff;
        bot = (1-fac)*screenYpixels;
        top = fac*screenYpixels;
        amp=bot-top;
        startpos=bot;
        endpos=top;
    elseif cnd ==5
        fac=0.2;
        vec=-arraydiff;
        bot = (1-fac)*screenYpixels;
        top = fac*screenYpixels;
        amp=bot-top;
        startpos=bot;
        endpos=top;
    elseif cnd ==6
        fac=0.25;
        vec=-arraydiff;
        bot = (1-fac)*screenYpixels;
        top = fac*screenYpixels;
        amp=bot-top;
        startpos=bot;
        endpos=top;
    elseif cnd ==7
        fac=0.2;
        vec=arraydifffast;
        bot = (1-fac)*screenYpixels;
        top = fac*screenYpixels;
        amp=bot-top;
        startpos=top;
        endpos=bot;
    elseif cnd ==8
        fac=0.2;
        vec=arraydiffslow;
        bot = (1-fac)*screenYpixels;
        top = fac*screenYpixels;
        amp=bot-top;
        startpos=top;
        endpos=bot;
    elseif cnd==9
        fac=0.2;
        vec=-arraydifffast;
        bot = (1-fac)*screenYpixels;
        top = fac*screenYpixels;
        amp=bot-top;
        startpos=bot;
        endpos=top;
    elseif cnd==10
        fac=0.2;
        vec=- arraydiffslow;
        bot = (1-fac)*screenYpixels;
        top = fac*screenYpixels;
        amp=bot-top;
        startpos=bot;
        endpos=top;
    end 
    vec=vec*amp/(array60(end)-array60(1));
    
    timer = 0;
    k=1;
    
%     Screen('DrawDots', window, [xCenter startpos], 150, [1 1  1],  [], 3);
    Screen('DrawLines', window, allCoords, lineWidthPix, white, [xCenter yCenter], 2);  
    vbl = Screen('Flip', window);
    
    
     [ seconds, keyCode ] = KbPressWait;
        
    keyCode = find(keyCode, 1);
    
    if keyCode == 27  
        break; 
    end
    WaitSecs(0.5);
    
    
    
    endreach =0;
    
    color = [1 1 1];
    
    
    squareYpos=startpos;
    
    while ~KbCheck 
            
        if k >= length(vec)
            endreach = 1;
        end
        if (squareYpos-startpos) > (endpos-startpos)
            color = [1 1 1];
        end
        
        if endreach ==1
            
            Screen('DrawDots', window, [xCenter endpos], 150, color, [], 3    );
            
            vbl = Screen('Flip', window);
            
        else
            amplitude=vec(k);
            
            ypos =  amplitude ;
            
            squareYpos = squareYpos + ypos;
            
            % Draw the rect to the screen
            Screen('DrawDots', window, [xCenter squareYpos], 150 , color, [], 3);
            
            vbl  = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
            
        end
        
        % Center the rectan gle on the cent re of the screen
        %     centeredRect = CenterRectOnPointd(baseRect, xCenter, squareYpos);
        
        
        
        % Flip to the screen
        
        
        % Increment the time
        timer = timer + ifi;
        
        
        k=k+1;
        
        
    end
    
    time(trynr)=timer;
    [clicks,x,y,whichButton] = GetClicks(window, 0);
    clickpos(trynr,1)=x*0.105;
    clickpos(trynr, 2)=y*0.315;
    trynr=trynr+1;
    WaitSecs(1);
end

% Screen('DrawDots', window, [xCenter endpos], 100, color, [], 3    );
% 
% 
% KbPressWait;

% Clear the screen
sca;