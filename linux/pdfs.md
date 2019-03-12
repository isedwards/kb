## ImageMagick

To modify pdf documents without having to physically print, modify and then scan them, first convert the original file into PNG images,
update the page that requires modifications, and then recombine.

    convert -units PixelsPerInch -density 300 input.pdf a.png
    
Add the page as an image in MS Word document and then make changes (e.g. adding a signature etc).  Save as pdf and then convert page to png using the same method as above (replacing the original version)

Combine the pages (make sure they are combined in the correct order, e.g. not 1, 10, 11, 2, ...)

    convert *.png edited.pdf

## pdftk

The process above results in a large output because all pages are converted to images. In the future, it would make sense to use `pdftk`
and only modify the pages that are actually being edited.
