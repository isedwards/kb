### [Common bootstrap mistakes](https://www.toptal.com/twitter-bootstrap/the-10-most-common-bootstrap-mistakes)

> We can activate a modal dialog without writing any JavaScript just by setting `data-toggle="modal"`
> on a controller element like a button or anchor, and pass additional parameters using `data-`
> attributes.
>
> In the code below, we are targeting HTML code with the ID `#myModal`. We have specified that the
> modal won’t close when user clicks outside the modal by using the `data-backdrop` option, and we
> have disabled escape key event that close a modal with `data-keyboard` option.

```<button type="button" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false">Launch my modal</button>```
