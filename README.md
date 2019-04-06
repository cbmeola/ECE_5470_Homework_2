ECE_5470_Homework_2

Charlotte Meola
ECE 5470, Digital Image Processing 

Homework #2: Spatial Filtering
---------------------------------------------------------------------------------------
The Python file "Meola_ECE_5470_HW_2.py" accomplishes the following, in order:

1.	Opens and displays a noisy image [input_image].

2.	Defines a Gaussian kernel of size 3x3 [gaussian_kernel].

3.	Creates a function "spatialFiltering" that takes an image [f] and kernel [w] as an input 
                  and returns a sharpened output image. 
                  The function "spatialFiltering" accomplishes the following, in order: 
         
         a.	Defines center of kernel [offset].
   
         b.	Loads the image pixel values into a matrix [f].
   
         c.	Applies zero padding to create larger image [pad_f].
   
         d.	Creates a function "gaussianFiltering" that takes a sigma size and size of kernel 
                           as an input and returns a Gaussian filtered output image [gGaussian].  
                           The function "gaussianFiltering" accomplishes the following:
          
                   i.	Applies convolution of kernel and padded image [gGaussian].
               
         e.	Takes the Laplacian of the Gaussian image and returns the result [gLoG].
   
         f.	Sharpens the original image by using the formula g = f +c*gLoG
   
4.	Final sharpened output is saved and displayed [g]. 

5.	Images resulting from every step are saved in a subplot figure [Rsesults_Figure].

--------------------------------------------------------------------------------------
