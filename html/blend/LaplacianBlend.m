% Function that blends two images together using Laplacian Pyramids
function [out] = LaplacianBlend(black, white, mask)
    % Cast each of the images to double as we will be doing alpha
    % matting
    
    black_img = double(black);
    white_img = double(white);
    mask_img = double(mask);
    
    % Figure out how many levels we need for the image pyramid
    % Ensures that smallest scale has resolution whose minimum dimension
    % (smallest row or column) is 16    
    min_size = min([size(black_img,1) size(black_img,2)]);
    depth = floor(log(min_size) / log(2)) - 4;
    
    % Create Gaussian pyramids for the two images and the mask
    gauss_pyr_mask = gauss_pyramid(mask_img, depth);
    gauss_pyr_black = gauss_pyramid(black_img, depth);
    gauss_pyr_white = gauss_pyramid(white_img, depth);
    
    % Create the Laplacian pyramids for the two images
    lapl_pyr_black = lapl_pyramid(gauss_pyr_black);
    lapl_pyr_white = lapl_pyramid(gauss_pyr_white);
    
    % Blend the two Laplacian pyramids together
    outpyr = blend(lapl_pyr_white, lapl_pyr_black, gauss_pyr_mask);
    
    % Create final blended image
    out = collapse(outpyr);
    
    % Cap and cast
    out(out < 0) = 0;
    out(out > 255) = 255;
    out = uint8(out);
end