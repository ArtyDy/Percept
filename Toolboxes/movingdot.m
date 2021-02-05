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
 
% Get the screen numbers
screens = Screen('Screens');


% Draw to the external screen if avaliable
screenNumber = max(screens);

% Define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% Open an on screen window
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);
hertz = Screen('NominalFrameRate', window); 

      

% g=(hertz+1)/10; 
g=5;
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

k=1
for i = 1:g:11*g
    for j=i+1:i+g-1
        array60(j)=array60(g*(k-1)+1)-b(k)*(j-i);
    end
    k=k+1;
end


% Get the size of the on screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% Query the frame duration
ifi = Screen('GetFlipInterval', window);

rhertz = FrameRate(window);

% Get the centre coordinate of the window
[xCenter, yCenter] = RectCenter(windowRect);

Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

% Make a base Rect of 200 by 200 pixels
baseRect = [0 0 200 200];

% Set the color of the rect to red
rectColor = [1 0 0];

% Our square will oscilate with a sine wave function to the left and right
% of the screen. These are the parameters for the sine wave
% See: http://en.wikipedia.org/wiki/Sine_wave

 


% frequency = 0.2;
% angFreq = 2 * pi * frequency;
% startPhase = 0;


% Sync us and get a time stamp
vbl = Screen('Flip', window);
waitframes = 1;


% Maximum priority level
topPriorityLevel = MaxPriority(window);
Priority(topPriorityLevel);
endpos = 0.85*screenYpixels;
startpos = 0.15*screenYpixels;
amp=endpos-startpos;
array60=array60*amp/(array60(1)-array60(end));
 

 
array60=abs(array60-array60(1));
arraydiff(1)=0;

for i = 1:length(array60)-1
    arraydiff(i+1)=array60(i+1)-array60(i);
end



Screen('DrawDots', window, [xCenter startpos], 150, [1 1  1], [], 3);
vbl = Screen('Flip', window); 


KbPressWait;
WaitSecs(0.5);
 

 
endreach =0;
 
color = [1 1 1];
 
 
squareYpos=startpos; 
% Loop the animation until a key is pressed
time = 0;
k=1;
while ~KbCheck 
    
%     amplitude = screenYpixels *0.015*(yCenter/(yCenter +2* abs(squareYpos-yCenter))) ;
    

    % Position of the square on t his frame
    

    % Add this position to the screen center coordinate. This is the point
    % we want our square to oscillate around
    
    
    if k >= length(arraydiff)
        endreach = 1;
    end
    if (squareYpos-startpos) > (endpos-startpos)
        color = [1 1 1];   
    end 
    
    if endreach ==1
        
        Screen('DrawDots', window, [xCenter endpos], 150, color, [], 3    );
        
        vbl = Screen('Flip', window); 
        
    else 
        amplitude=arraydiff(k);
        
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
    time = time + ifi;
    
    
    k=k+1; 
  

end

% Screen('DrawDots', window, [xCenter endpos], 100, color, [], 3    );
% 
% 
% KbPressWait;

% Clear the screen
sca;