% Referenced code from https://www.geeksforgeeks.org/how-to-extract-frames-from-a-video-in-matlab/

clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.

% Specify input video file name.
folder = pwd;
% baseFileName = 'mmc2.avi';
% baseFileName = 'mmc3.avi';
baseFileName = 'mmc4.avi';
fullFileName = fullfile(folder, baseFileName);

% Instantiate a video reader object for this video.
videoObject = VideoReader(fullFileName);
vid = read(videoObject);

% Setup other parameters
numberOfFrames = videoObject.NumberOfFrame;
ST = '.jpg';

% Extract and save all frames from the video
for x = 1 : numberOfFrames
    
Sx = num2str(x);
Strc = strcat(Sx, ST);
Vid = vid(:, :, :, x);
cd frames4
imwrite(Vid, Strc);
cd ..
end

% Finding centroids of sheep/sheepdog data  
for x = 1 : numberOfFrames
    
Sx = num2str(x);
Strc = strcat(Sx, ST);
cd frames4
[X, map] = imread(Strc);
imshow(X, map)

bw = imbinarize(X, 0.5725);
bw = imcrop(bw, [338.5100   41.5100  691.9800  603.9800]);
bw = imcomplement(bw);
cc = bwconncomp(bw, 8);
% s = regionprops(cc, 'Centroid');
s = regionprops(bw , 'Centroid');
X = imcrop(X, [338.5100   41.5100  691.9800  603.9800]);
imshow(X, map)
hold on
for k = 1:numel(s)
    centroid_k = s(k).Centroid;
    plot(centroid_k(1), centroid_k(2), 'b.');
end
hold off

cd ..
cd centroids4
writetable(struct2table(s), ['centroids_' num2str(Sx) '.csv'])
cd ..
end



