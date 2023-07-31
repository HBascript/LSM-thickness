# LSM-thickness
Matlab script for the evaluation of the layer thickness based on LSMM data
The script evaluates the thickness of transparent layers out of captured images in the "film thickness" mode. You must first generate a "*.bmp" or "*-tif" file in the LEXT software by using the export function of the software and saving the data in the respective format.
Start the script "Solthickness.m" and run it. It can be necessary that you add the path of the MatLab script to your MatLab protocol (window appears, confirm).
Before you can use the script correctly you must know the refractive index of your layer.
A window appears, here you must navigate to the path of your images. Select the image.
"fit in progress..." appears
The program delivers two fitted images (choose the more smooth!) - you can save it in different formats
Based on the image data, the mean fit and its standard deviation and the median fit and its standard deviation are calculated.
