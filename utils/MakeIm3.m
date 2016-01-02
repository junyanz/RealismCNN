function [im] = MakeIm3(im)
% im3 = imread(name); 
if ndims(im) == 2
   im = repmat(im,[1,1,3]);  
end
end