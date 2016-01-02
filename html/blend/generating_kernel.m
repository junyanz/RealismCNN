% Function that generates a 5 x 5 filtering kernel
% used for Laplacian Pyramidal blending
% a is usually 0.4
function [ker] = generating_kernel(a)
    w_1d = [0.25 - a/2 0.25 a 0.25 0.25 - a/2];
    ker = w_1d' * w_1d;
end