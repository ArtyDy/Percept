% Clear the workspace and the screen
sca;
close all;
clearvars;

% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);
Screen('Preference', 'SkipSyncTests', 2);
Screen('Preference','SuppressAllWarnings',1);
Screen('Preference', 'VisualDebugLevel', 1 );
%
yCoords = [0 0 -40 40];
allCoords = [[ 0 0 0 0]; yCoords];
lineWidthPix = 4;

frame_angles = [-315 -320 -325 -330 -335 -340 -345 -350 -355 0 5 10 15 20 25 30 35 40 ];
rod_angles = [-7 -4 -2 -1 0 1 2 4 7];
% Get the screen numbers. This gives us a number for each of the screens
% attached to our computer.
% For help see: Screen Screens?
screens = Screen('Screens');

% Draw we select the maximum of these numbers. So in a situation where we
% have two screens attached to our monitor we will draw to the external
% screen. When only one screen is attached to the monitor we will draw to
% this.
% For help see: help max
screenNumber = max(screens);

% Define black (white will be 1 and black 0). This is because
% luminace values are (in general) defined between 0 and 1.
% For help see: help BlackIndex
black = BlackIndex(screenNumber);
white = WhiteIndex(screenNumber);
% Open an on screen window and color it black
% For help see: Screen OpenWindow?
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);
Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

% Get the size of the on screen window in pixels
% For help see: Screen WindowSize?
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% Get the centre coordinate of the window in pixels
% For help see: help RectCenter
[xCenter, yCenter] = RectCenter(windowRect);

% Make a base Rect of 200 by 200 pixels. This is the rect which defines the
% size of our square in pixels. Rects are rectangles, so the
% sides do not have to be the same length. The coordinates define the top
% left and bottom right coordinates of our rect [top-left-x top-left-y
% bottom-right-x bottom-right-y]. The easiest thing to do is set the first
% two coordinates to 0, then the last two numbers define the length of the
% rect in X and Y. The next line of code then centers the rect on a
% particular location of the screen.
baseRect = [0 0 200 200];

% Center the rectangle on the centre of the screen using fractional pixel
% values.
% For help see: CenterRectOnPointd
centeredRect = CenterRectOnPointd(baseRect, xCenter, yCenter);

% Set the color of our square to full red. Color is defined by red green
% and blue components (RGB). So we have three numbers which
% define our RGB values. The maximum number for each is 1 and the minimum
% 0. So, "full red" is [1 0 0]. "Full green" [0 1 0] and "full blue" [0 0
% 1]. Play around with these numbers and see the result.
rectColor = [1 1 1];

% Draw the square to the screen. For information on the command used in
% this line see Screen FillRect?

for i = [frame_angles(randperm(length(frame_angles))); rod_angles([randperm(length(rod_angles)) randperm(length(rod_angles))])]
        Screen('glPushMatrix', window);
        Screen('glTranslate', window, xCenter, yCenter);
        Screen('glRotate', window, i(1), 0, 0);
        Screen('glTranslate', window, -xCenter, -yCenter);
        Screen('FrameRect', window, [1 1 1], centeredRect, 5);
        Screen('glPopMatrix', window);
%         Screen('FrameRect', window, rectColor, centeredRect, 5);
       
        Screen('glPushMatrix', window)
        Screen('glTranslate', window, xCenter, yCenter);
        Screen('glRotate', window, i(2), 0, 0);
        Screen('glTranslate', window, -xCenter, -yCenter);
        Screen('DrawLines', window, allCoords, lineWidthPix, white, [xCenter yCenter], 2); 
        Screen('glPopMatrix', window);
        
        Screen('Flip', window);
        
        KbStrokeWait;
        
end
%         Screen('DrawLines', window, allCoords, lineWidthPix, white, [xCenter yCenter], 2); 
% Flip to the screen. This command basically draws all of our previous
% commands onto the screen. See later demos in the animation section on more
% timing details. And how to demos in this section on how to draw multiple
% rects at once.
% For help see: Screen Flip?


% Now we have drawn to the screen we wait for a keyboard button press (any
% key) to terminate the demo.
% For help see: help KbStrokeWait


% Clear the screen. "sca" is short hand for "Screen CloseAll". This clears
% all features related to PTB. Note: we leave the variables in the
% workspace so you can have a look at them if you want.
% For help see: help sca
sca;

