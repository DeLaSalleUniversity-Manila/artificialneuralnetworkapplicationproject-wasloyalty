% Script for creating the Training data

% Clear screen and workspace
clc, clear all


OriginalLocation = uigetdir('C:\ ', 'Select the Reference Folder (Where the train data matlab file is)');

%global MatxC
%global trainData

%Positive Images
%cd C:\Positive
PositiveLocation = uigetdir('C:\ ', 'Enter Location of Positive Images');

cd(PositiveLocation);
% Local path 
%^Change the directory to the folder with the training samples
%Positive means the proper images


Positive = dir('*.jpg');
for k = 1:length(Positive)
    filename_red = Positive(k).name;
    I = imread(filename_red);
    red = I(:,:,1); % Red channel
    green = I(:,:,2); % Green channel
    blue = I(:,:,3); % Blue channel
    I = rgb2gray(I); % convert to grayscale
   
    P = imresize(I, [128 128]);
    R(:,k) = reshape(P,1,[]); % 
end
clear P I k

% NEGATIVE IMAGES
NegativeLocation = uigetdir('C:\ ', 'Enter Location of Negative Images');

cd(NegativeLocation)
%^Change the directory to the folder with the training samples
%Negative means the improper images


Negative = dir('*.jpg');
for C = 1:length(Negative)
    File_Negative = Negative(C).name;
    I = imread(File_Negative);
    red = I(:,:,1); % Red channel
    green = I(:,:,2); % Green channel
    blue = I(:,:,3); % Blue channel
    I = rgb2gray(I); 
    P = imresize(I, [128 128]);
    
    N(:,C) = reshape(P,1,[]); 
end
clear P I k



MatxA = [ones(1,length(Positive)) ; zeros(1,length(Positive))];
MatxB = [zeros(1,length(Negative)) ; ones(1,length(Negative))];

MatxC = [MatxA MatxB];




cd(OriginalLocation)

trainData = [R N];

%CPELEC1Project;
%CPELEC1ProjectAdvance;