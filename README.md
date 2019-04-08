ECE_5470_Homework_2



Charlotte Meola

ECE 5470, Digital Image Processing 

Homework #2: Spatial Filtering


---------------------------------------------------------------------------------------
The MATLAB file "Meola_ECE_5470_HW_2.m" accomplishes the following:

1.	Opens and displays an image containing some noise [input_image].


2.	Defines a Gaussian kernel size, 3x3 [size_kernel].


3.	Creates a function "getGaussianKernel" that takes (1) sigma and (2) the size of the kernel as inputs and returns a Gaussian filter kernel [g_kernel]. The function accomplishes the following:

                a. Uses element-by-element calculations to find Gaussian LPF via the equation, 
                          exp(-(x^2+y^2)/(2*sigma^2)).


4.	Calls "getGaussianKernel" to get kernel value, [g_kernel].


5.	Creates a function called "spatialFiltering" that takes (1) an image [f], (2) the Gaussian kernel [w], and (3) sigma as inputs and returns a sharpened output image, [g]. 
The function accomplishes the following, in order: 

                a. Applies zero padding to create larger image [f].
                b. Applies convolution of kernel and padded image [gGaussian].
                c. Defines the Laplacian of Gaussian filter matrix, [l_kernel].
                d. Takes the Laplacian of the Gaussian and returns the result [gLoG].
                e. Returns the sharpened image by using the formula g = f +c*gLoG.


6.	Calls "spatialFiltering. " The final sharpened output is saved and displayed [g]. 


7.	Images resulting from every step is saved in a subplot figure [Results_Figure].

--------------------------------------------------------------------------------------
