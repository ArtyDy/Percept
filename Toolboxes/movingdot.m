% Clear the workspace and the screen
sca;
close all;
clearvars;

data = load('coords.mat');
array =data.data;

array = array - array(end);

% Here we call some default settings for setting up Psychtoolbox
 PsychDefaultSetup(2);

% Get the screen numbers
screens = Screen('Screens');

% Draw to the external screen if avaliable
screenNumber = max(screens);

% Define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% Open an on screen window
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% Get the size of the on screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% Query the frame duration
ifi = Screen('GetFlipInterval', window);

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
time = 0;

% Sync us and get a time stamp
vbl = Screen('Flip', window);
waitframes = 1;

% Maximum priority level
topPriorityLevel = MaxPriority(window);
Priority(topPriorityLevel);
endpos = 0.75*screenYpixels;
startpos = 0.25*screenYpixels;

Screen('DrawDots', window, [xCenter startpos], 100, [1 1  1], [], 3);
vbl = Screen('Flip', window); 


 KbPressWait;
 WaitSecs(0.5);
 

 
 endreach =0;
 
 color = [1 1 1];
 
 
 squareYpos=startpos; 
% Loop the animation until a key is pressed
while ~KbCheck & ~endreach
    
    amplitude = screenYpixels *0.015*(yCenter/(yCenter +2* abs(squareYpos-yCenter))) ;

    % Position of the square on t his frame
    ypos =  amplitude;

    % Add this position to the screen center coordinate. This is the point
    % we want our square to oscillate around
    squareYpos = squareYpos + ypos;
    
    if squareYpos >= endpos
        endreach = 1;
    end
    if (squareYpos-startpos) > (endpos-startpos)
        color = [0 0 0]; 
    end 
    

    % Center the rectangle on the cent re of the screen
    centeredRect = CenterRectOnPointd(baseRect, xCenter, squareYpos);

    % Draw the rect to the screen
    Screen('DrawDots', window, [xCenter squareYpos], 100, color, [], 3);
    
      % Flip to the screen
    vbl  = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi); 
     
    % Increment the time 
    time = time + ifi;
    
    
     
  

end

Screen('DrawDots', window, [xCenter endpos], 100, color, [], 3    );
vbl = Screen('Flip', window); 

KbPressWait;

% Clear the screen
sca;