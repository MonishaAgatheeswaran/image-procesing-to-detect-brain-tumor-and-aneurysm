
% BW=SAUVOLA(IMAGE) performs local thresholding with Sauvola algorithm.
%      
% BW=SAUVOLA(IMAGE, M, N, THRESHOLD, PADDING) performs local thresholding
%   with M-by-N neighbourhood (default is 3-by-3), a threshold 
%   between 0 and 1 (default is 0.34) and predefined padding as specified 
%   by PADDARAY options (default is 'replicate').
%       
% Example:
%   imshow(sauvola(imread('eight.tif')));
%
% For method description see:
%   http://www.dfki.uni-kl.de/~shafait/papers/Shafait-efficient-binarization-SPIE08.pdf

function output=sauvola(image, varargin)
%% Initialization
% only want 4 optional inputs at most
numvarargs = length(varargin);
if numvarargs > 4
    error('myfuns:somefun2Alt:TooManyInputs', ...
     'Possible SAUVOLA parameters are: (image, m, n, threshold, padding)');
end
 
% set defaults for optional inputs
window = floor(min(size(image))/2);
optargs = {window window 0.34 'replicate'};
 
% now put these defaults into the valuesToUse cell array, 
% and overwrite the ones specified in varargin.
optargs(1:numvarargs) = varargin;
 
% Place optional args in memorable variable names
[m, n, k, padding] = optargs{:};

%% Convert to double
image=double(image);

%% Mean value
mean = averagefilter(image, m, n, padding);

%% Standard deviation
meanSquare = averagefilter(image.^2, m, n, padding);
deviation = (meanSquare - mean.^2).^0.5;

%% Sauvola
R=max(deviation(:));
threshold = mean.*(1+k*(deviation/R-1));
output=(image>threshold);
