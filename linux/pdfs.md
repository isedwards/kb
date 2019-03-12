## ImageMagick

To sign documents without having to physically print, sign and then scanning them, first convert the original file into PNG images,
update the page that requires the signature, and then recombine.

    convert -units PixelsPerInch -density 300 input.pdf a.png
    
Add page as image in MS Word and add signature etc.  Save as pdf and then convert page to png using the same method as above
(replacing the original)

   convert *.png edited.pdf
