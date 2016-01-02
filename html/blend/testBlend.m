clear all;
close all;

black = imread('black.jpg');
white = imread('white.jpg');
mask = imread('mask.png');

% Convert mask to alpha mask
maskr = double(mask(:,:,1)) / 255;

%%%% Show stitched image without any blurring

% First image - Mask pixels that belong to label 0
black_im = uint8(zeros(size(black)));
for i = 1 : 3
    b = black(:,:,i);
    out = zeros([size(black,1) size(black,2)]);
    out(maskr == 0) = b(maskr == 0);
    black_im(:,:,i) = out;
end

black_im = uint8(black_im);

% Second image - Mask pixels that belong to label 1
white_im = uint8(zeros(size(white)));
for i = 1 : 3
    b = white(:,:,i);
    out = zeros([size(white,1) size(white,2)]);
    out(maskr == 1) = b(maskr == 1);
    white_im(:,:,i) = out;
end

white_im = uint8(white_im);

% Stitch the two images together without blending
outStitch1 = black_im + white_im;

%%%% Now do Laplacian blending
outStitch2 = LaplacianBlend(black, white, mask);

% Show all the images individually
figure;
imshow(black);
title('First Image (Black)');
figure;
imshow(white);
title('Second Image (White)');
figure;
imshow(mask);
title('Mask used for blending');
figure;
imshow(outStitch1);
title('Output by simply placing the two together');
figure;
imshow(outStitch2);
title('Output after Laplacian Blending');