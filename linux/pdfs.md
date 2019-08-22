## Examples
- Signing a page of a pdf document and reassembing the pieces

```
pdftk in.pdf cat 1-3 output begin.pdf
pdftk in.pdf cat 4 output to_sign.pdf
pdftk in.pdf cat 5-end output end.pdf
convert -units PixelsPerInch -density 300 to_sign.pdf to_sign.png
# Use png for create a signed pdf version of the page as signed.pdf
pdftk begin.pdf signed.pdf end.pdf cat output out.pdf

```

## ImageMagick

To modify pdf documents without having to physically print, modify and then scan them, first convert the original file into PNG images,
update the page that requires modifications, and then recombine.

    convert -units PixelsPerInch -density 300 input.pdf a.png
    
ImageMagick can also combine multiple png files (make sure they are combined in the correct order, e.g. not 1, 10, 11, 2, ...)

    convert *.png edited.pdf

## pdftk

The process above results in a large output because all pages are converted to images. In the future, it would make sense to use `pdftk`
and only modify the pages that are actually being edited (see example above).
