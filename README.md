ECE_5470_Homework_2


Charlotte Meola

ECE 5470, Digital Image Processing 

Homework #2: Spatial Filtering

---------------------------------------------------------------------------------------
The MATLAB file "Meola_ECE_5470_HW_2.m" accomplishes the following, in order:

1.	Opens and displays a noisy image [input_image]

2.	Defines a Gaussian kernel size, 3x3 [size_kernel].

3.	Creates a function "gaussianKernel" that takes (1) the sigma size and (2) the size of the kernel as inputs and returns a Gaussian filter kernel [g_kernel].

4.	Calls "gaussianKernel" to get kernel value, [g_kernel].

5.	Creates a function called "spatialFiltering" that takes (1) an image [f] and (2) the Gaussian kernel [w] as an input and returns a sharpened output image. 
The function "spatialFiltering" accomplishes the following, in order: 

  a.	Applies zero padding to create larger image [pad_f].
  b.	Applies convolution of kernel and padded image [gGaussian].
  c.	Takes the Laplacian of the Gaussian image and returns the result [gLoG].
  d.	Sharpens the original image by using the formula g = f +c*gLoG

6.	Calls "spatialFiltering. " The final sharpened output is saved and displayed [g]. 

7.	Images resulting from every step is saved in a subplot figure [Results_Figure].

--------------------------------------------------------------------------------------
