function output=averagefilter(image, varargin)
%AVERAGEFILTER 2-D mean filtering.
%   B = AVERAGEFILTER(A) performs mean filtering of two dimensional 
%   matrix A. Each output pixel contains the mean
%   value in the 3-by-3 neighborhood around the corresponding
%   pixel in the input image. 
%
%   B = AVERAGEFILTER(A, M, N) filters matrix A with M-by-N neighborhood.
%   
%   B = AVERAGEFILTER(A, M, N, PADDING) filters matrix A and with the 
%   predefinned image padding. Defaultly the matrix is padded with zeros to 
%   be compatible with IMFILTER. But the borders may appear distorted.
%   The PADDING parameter can be either a scalar or a string: 
%       'circular'    Pads with circular repetition of elements.
%       'replicate'   Repeats border elements of A.
%       'symmetric'   Pads array with mirror reflections of itself. 
%
%   Comparison
%   -------
%   There are different ways how to perform mean filtering in MATLAB. 
%   An effective way for small neighborhoods is to use IMFILTER:
%
%       I = imread('eight.tif');
%       meanFilter = fspecial('average', [3 3]);
%       J = imfilter(I, meanFilter);
%       figure, imshow(I), figure, imshow(J)
%
%   However, IMFILTER slows down with the increasing size of the 
%   neighborhood while AVERAGEFILTER processing time remains constant.
%   And once one of the neighborhood dimensions is over 21 pixels,
%   AVERAGEFILTER is faster. Anyway, both IMFILTER and AVERAGEFILTER give
%   the same results.
%
%   Remarks
%   -------
%   The output matrix type is the same as of the input matrix A.
%   If either dimesion of the neighborhood is even, the dimension is 
%   rounded down to the closest odd value. 
%
%   Example
%   -------
%       I = imread('eight.tif');
%       J = averagefilter(I, 3, 3);
%       figure, imshow(I), figure, imshow(J)
%
%   See also IMFILTER, FSPECIAL, PADARRAY.

% Parameter checking.
numvarargs = length(varargin);
if numvarargs > 3
    error('myfuns:somefun2Alt:TooManyInputs', ...
        'requires at most 3 optional inputs');
end
 
optargs = {3 3 0}; % set defaults for optional inputs
optargs(1:numvarargs) = varargin;
[m, n, padding] = optargs{:}; % use memorable variable names

if ~mod(m,2) m=m-1; end     % check for even window sizes
if ~mod(n,2) n=n-1; end

if (ndims(image)~=2)        % check for color pictures
    display('The input image must be a two dimensional array.')
    display('Consider using rgb2gray or similar function.')
    return
end

% Initialization.
[rows columns] = size(image);    % size of the bw image

% Pad the image. Always use double because uint8 would be too small. 
imageP=padarray(double(image), [(m+1)/2 (n+1)/2], padding, 'pre');
imageP=padarray(double(imageP), [(m-1)/2 (n-1)/2], padding, 'post');

% Calculate the look up table.
t = imageP; % Sum of numbers on the left and above the current cell

for x = 2:columns+n
    t(:,x) = imageP(:,x) + t(:,x-1);
end

for y = 2:rows+m
    t(y,:) = t(y,:) + t(y-1,:);
end

% Calculate the output.
output=image;   % use the same data type and size as is the input
winNum=m*n;     % the size of the window. Used for average calculation.

for x = 1:columns
    for y = 1:rows
        output(y,x) = (t(y+m,x+n) + t(y,x) - t(y+m,x) - t(y,x+n)) / winNum;
    end
end

