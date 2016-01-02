% Function that calculates a Laplacian pyramid
% Take an image in a Gaussian pyramid at a smaller scale (i+1) 
% and expand it
% Then subtract it with the i'th scale
% Image at the end of the pyramid is simply the last image in the
% Gaussian pyramid
function [pyramid] = lapl_pyramid(gauss_pyr)
    pyramid = cell(1,length(gauss_pyr));
    
    for i = 1 : length(gauss_pyr)-1
        % Expand i+1'th scale
        tmp = expand(gauss_pyr{i+1});
        
        % When expanding, we may get image dimensions that 
        % aren't quite the same when targetting a particular scale
        % As such, we need to make sure we are consistent
        rows = size(gauss_pyr{i},1);
        cols = size(gauss_pyr{i},2);
        tmp = tmp(1:rows,1:cols,:);
        
        % Take i'th scale and subtract with expanded i+1'th scale
        pyramid{i} = gauss_pyr{i} - tmp;
    end
    
    % Attach smallest scale from Gaussian pyramid in the end
    pyramid{end} = gauss_pyr{end};
end