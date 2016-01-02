% Create a Gaussian pyramid
% Essentially this uses reduce for a total of levels times.
% Each image in one scale is half the size of the previous scale
% First scale is simply the original image
function [gaussout] = gauss_pyramid(im, levels)
    gaussout = cell(1,levels+1);
    gaussout{1} = im;
    subsample = im;
    for i = 2 : levels+1
        subsample = reduce(subsample);
        gaussout{i} = subsample;
    end
end
