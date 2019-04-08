%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Meola_ECE_5470_Homework_2.m

% Charlotte Meola
% ECE 5470, Digital Image Processing 
% Homework #2: Spatial Filtering

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all;
clear all;
clc;

% 1.Opens and displays an image [input_image].
input_image = imread('input_image.png');


% 2. Defines a Gaussian kernel size, 3x3 [size_kernel].
hsize = [3 3]; 


% Defines sigma for use in finding kernels.
sigma = 2; 
input_image = rgb2gray(input_image);


% 4.Calls "getGaussianKernel" to get kernel matrix, [g_kernel].
% While sigma = 1.3:
g_kernel = getGaussianKernel(hsize, 1.3);


% 6. Calls "spatialFiltering. " The final sharpened output is saved and displayed [g]. 
g = spatialFiltering(input_image,g_kernel,sigma);


% 7. Images resulting from every step is saved in a subplot figure [Results_Figure].
saveas(gcf,'Results_Figure.png')

% Saves and displays the final image, g:
figure(2)
imshow(g, []); saveas(gcf,'output_image.jpg')



% 5.	Creates a function called "spatialFiltering" that takes (1) an 
% image [f] and (2) the Gaussian kernel [w] and (3) sigma as inputs and 
% returns a sharpened output image, [g]. 

 function g = spatialFiltering(f,w,sigma)
    
    % Get size for filter kernel:
    size_w = size(w);

    % Dislpay original image:
    subplot(2,3,1),imshow(f),title('Original Image, f')

    % 5b.	Applies convolution of kernel and image [gGaussian].
    gGaussian = convn(f, w)
    [M N]= size(gGaussian);
    
    % Display Gaussian of original image:
    subplot(2,3,3),imshow(gGaussian, []),title('Gaussian (Smoothed) Image, gGaussian')


    % Use the Laplacian kernel to create the Laplacian of Gaussian image:     
    %l_kernel = [0, 1, 0; 1, -4, 1; 0, 1, 0];
     l_kernel = [-1, -1, -1; 
                 -1, 8,  -1; 
                 -1, -1, -1];
    
     % Display LoG flter kernel as image:
    subplot(2,3,4),imshow(abs(l_kernel), []),title('Laplacian of Gaussian Filter Kernel')

    % 5c. Takes the Laplacian of the Gaussian image and returns the result [gLoG].
    gLoG = imfilter(gGaussian, l_kernel)
    
    % The Laplacian of Gaussian gets edges, but also enhances noise.
    % Remove noise further by applying another smoothing filter to LoG image:
    gLoG= imfilter(gLoG, w);

    % Display LoG image result:
    subplot(2,3,5),imshow(gLoG, []),title('Laplacian of Gaussian Image, LoG')

    %Unpad the image to get the same size matrices f
    n = 1;
    gLoG = gLoG(n+1:end-n,n+1:end-n); 

    % 5d. Sharpens the original image by using the formula g = f +c*gLoG.
     g = uint8((gLoG)) +  uint8(f);
    
    % Display final result, sharpened image:
    subplot(2,3,6),imshow(g, []),title({'Sharpened Image, g', 'g = f + gLoG'})


 end % End of "spatialFiltering" function.

  
 
 
% 3.  Creates a function "getGaussianKernel" that takes (1) the sigma size 
% and (2) the size of the kernel as inputs and returns a 
% Gaussian filter kernel [g_kernel].

function g_kernel = getGaussianKernel(size_w, sigma)
    
    % Get size of kernel:
    s = size_w(1);
    t = size_w(2);

    % Allocate space for Gaussian kernel:
    g_kernel = zeros(s, t);

    % Uses element-by-element calcualation for Gaussian LPF:
    % Loop over all rows and columns:
    for ii=1:s
        for jj=1:t            
            % Use Gaussian kernel equation:
            new = exp(-(ii^2+jj^2)/(2*sigma^2));
            
            % Save value in kernel matrix:
            g_kernel(ii,jj)= new;
            
        end
    end    

    % Display Gaussian filter kernel:
    subplot(2,3,2),imshow((g_kernel), []),title('Gaussian Filter Kernel')
        
      
end % End of "getGaussianKernel" function.