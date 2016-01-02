% Given a (blended) Laplacian pyramid, starting from the smallest scale,
% expand it, then add this previous scale.  Repeat this until we get to the
% original scale and this is the output
function [col_output] = collapse(lapl_pyr)
    lapl_pyr_copy = lapl_pyr;
    for i = length(lapl_pyr) : -1 : 2
        
        % Same Caveat for expanding is here
        tmp = expand(lapl_pyr_copy{i});
        rows = size(lapl_pyr_copy{i-1},1);
        cols = size(lapl_pyr_copy{i-1},2);
        tmp = tmp(1:rows, 1:cols, :);
        lapl_pyr_copy{i-1} = lapl_pyr_copy{i-1} + tmp;
    end

    col_output = lapl_pyr_copy{1};
end
