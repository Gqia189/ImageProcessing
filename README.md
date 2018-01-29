# Matlab-imagaing-the-universe
This project centres on the image processing of a set of raw image data from Hubble telescope. A example of a set of image is shown below:

![ScreenShot](https://github.com/Gqia189/Matlab-imagaing-the-universe/blob/master/raw.PNG)

Each image represents the same region of space but has been taken using a different light filter (the filters allow Hubble to record the photons emitted for a particular band of light, centred on a specified wave length).
Some of the images have poor contrast so we will “normalise” them to make full use of the uint8 range of values (0 to 255). After normalising an image the specified background colour will be set to 0 and the peak brightness will be set to 255.
An example of normalising the above images is shown below. The exact result obtained depends on what values were selected to represent the background (dark value) and peak (bright value) for each image.

![ScreenShot](https://github.com/Gqia189/Matlab-imagaing-the-universe/blob/master/normalised.PNG)

Each image represents a colour band, centred on a particular wavelength. We can colour each greyscale image using either true colour (corresponding to the wave length of light at the centre of the band that was used to take the image) or a user specified colour.

![ScreenShot](https://github.com/Gqia189/Matlab-imagaing-the-universe/blob/master/Coloured.PNG)

Note that not all images will benefit from using true colour. For example some wave lengths are outside the range of human vision (roughly speaking the visible spectrum corresponds to wave lengths in the 400 to 700 nanometre range). We can still visualise features outside the visible range by manually assigning a visible colour to any images that used filters outside the visible spectrum. We can also observe features related to a particular wavelength more distinctly if we colour wave lengths that are close together using very different colours.

The separate coloured images can be combined into a single image representing a region of space. Here is a composite created from the four separate colour images from the previous page.

![ScreenShot](https://github.com/Gqia189/Matlab-imagaing-the-universe/blob/master/Output/combined.jpg)

This image is then rotated:

![ScreenShot](https://github.com/Gqia189/Matlab-imagaing-the-universe/blob/master/Output/rotated.jpg)

Then cropped:

![ScreenShot](https://github.com/Gqia189/Matlab-imagaing-the-universe/blob/master/Output/crop.jpg)
