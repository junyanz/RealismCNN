laplacianBlend
==============

MATLAB script that blends two images together using Laplacian Pyramidal blending given an alpha mask separating the two images

**Author: Ray Phan (ray@bublcam.com)**

# Introduction

This is a simple MATLAB script that performs Laplacian Pyramidal blending between two images, given an alpha mask. The alpha mask in this case is simply a binary image where black pixels (zero - 0) correspond to what belongs from the first image, and white pixels (one - 1) correspond to what belongs from the second image.  Using the alpha mask, the two images are blended together into a single image that appears natural.

Given two images denoted as ``black`` and ``white``, and with an alpha mask that denotes which pixels from the ``black`` or ``white`` image that should appear in the final image, the images and the alpha mask are broken down into a multi-resolution pyramid, known as a Gaussian pyramid.  After, Laplacian pyramids for both images are constructed.  For each scale, these simply take the image in the Gaussian pyramid at this scale and subtracts its results from the expanded version of the image at the next smallest scale.  This captures the high frequency information at each scale in order to better blend the edges together in the final blended image.  The smallest scale in the Laplacian pyramid however is the smallest scaled image from the Gaussian pyramid.

Using the Laplacian pyramids for both images, a simple alpha masking operation is performed at each scale, and then propagated upwards towards the final master scale.  After, a blended Laplacian pyramid is created and the final step is to collapse the pyramid to generate a blended image.  This is done by taking the smallest scale of the blended Laplacian pyramid, expanding the image so that it matches the dimensions of the second smallest scale and adding those results to the second smallest scale in the Laplacian pyramid.  This procedure is repeated until the original scale is reached, thus resulting in our blended image.

# Sources of inspiration

This code is essentially a transcription of an assignment done from a course on [Coursera](http://www.coursera.org) offered by the [Georgia Institute of Technology](http://www.gatech.edu), known as [Computational Photography](https://www.coursera.org/course/compphoto).

Prof. Irfan Essa was the instructor of the course and gave an awesome lecture on how this kind of blending works.  To better understand the theory behind Laplacian Pyramids, Gaussian Pyramids and the entire blending procedure, take a look [at these slides](https://www.dropbox.com/s/nuntpy76kdboz0j/ESSA-03-3-Pyramids.pdf?dl=1).

# Requires

Any version of MATLAB with the Image Processing Toolbox installed. Specifically, ``imread``, ``imshow`` and ``imfilter`` is what is required.  Alternatively, this should be Octave friendly so you can use that environment if you like.  

# How to run the code

Assuming that you already have two images that you wish to blend on hand (``black`` and ``white``), as well as the alpha mask that delineates which pixels to include in the final image (``mask``), you would simply run the script using the following:

    out = LaplacianBlend(black, white, mask);
    
However, if you are in doubt, I have included a sample test script so you can run it and see what the results are.

# Assumptions

No error checking is involved with this code.  This assumes that both the ``black`` and ``white`` images are the same size and are in colour (RGB image).  ``mask`` should also be an RGB image where each alpha value requested from either image is either 0 or 255 and should be replicated across all channels.

Should you require a monochromatic version of the code, simply replicate the monochromatic intensities as an RGB image.  You could use the ``cat`` command before you run the script:

     imRGB = cat(3, im, im, im); % im is the monochromatic matrix of intensitie values
     
# What is included in this repository

1.  The Laplacian Blending script (LaplacianBlend.m)
2.  Any helper MATLAB function script files that are needed to get this to work (Gaussian Pyramid, Laplacian Pyramid, Blending, etc.)
3.  An example test script used to illustrate the blending (testBlend.m)
4.  A sample pair of images and an associated alpha mask used for the test script in (3).  These images were provided by the Computational Photography Coursera course.

# License
This code is protected under the MIT License.  You may feel free to use the code in any way, shape, or form and can modify it to your heart's content.  You may also include the code in any applications that you develop without releasing any of your code publicly (as per the GPL).  The only thing I request is that you cite where the source came from and give me credit whenever you decide to use it.  Thanks!
