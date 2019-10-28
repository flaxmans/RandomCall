rotateMap = false;
% rotateMap "false" will produce a map from the student perspective
% rotateMap "true" will produce a map from the instructor perspective

% getting a different random number seed each time:
if exist('RandomSeedInfo.mat','file')
    load('RandomSeedInfo.mat');
    myseed = myseed + 1;
    interval = interval + 1;
else
    dum = clock;
    myseed = round(1000 * dum(6)); % use the seconds from the clock to seed
    interval = 45;
end
if interval > 90
    interval = 45;
end
save('RandomSeedInfo.mat', 'myseed', 'interval'); 
%disp(myseed)
%disp(interval)

% following code checks to see if it is Halloween and changes the image
% accordingly
dum = clock;
if dum(2) == 10 && dum(3) > 27 && dum(3) <= 31
    bot = 10;
    left = 10;
    incr = 60;
    w = 105;
    t = w;
    myimg = imread('weencat.jpg');
else
    bot = 10;
    left = 10;
    incr = 60;
    w = 85;
    t = 55;
    myimg = imread('cat.jpg');
end


rng(myseed); % seeds the RNG
seatMap = importdata('SeatMap.csv');  %get the seatmap into memory
if rotateMap
    seatMap = rotateMatrix(seatMap,180);
end
h = gcf;
figure(h);

% the following line creates the user input control button
% note that the command executed on the button is provided as a string (the
% final argument to this uicontrol function)
btn3 = uicontrol('Style', 'pushbutton', 'CData', myimg, 'Position', [left bot w t],'Callback', 'randomSeatSelector(1,1,seatMap,interval,rotateMap)');
