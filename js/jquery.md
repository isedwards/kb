## Trigger a click event

`$('#my_id').click()` doesn't trigger a click on the DOM element, to achieve this call the `click()` method directly on the element itself, e.g. `$('#my_id')[0].click()`, or `document.querySelector('#my_id').click();`.

## Change an input's type attribute

jQuery won't allow you to change the `type` attribute of an input (e.g. `$('#password').attr('type', 'text');
`) because it [causes problems in IE](https://stackoverflow.com/a/1544338/).  Instead you can try to do it directly on the element: `elem.type = 'text';`.

## Reveal `type=hidden` fields

For debugging purposes it can be useful to list the hidden fields in the console, or change their type so that they are displayed on the page.

```
    $('[type=hidden]').each(function(num, elem) {
       console.log(elem);
       elem.type = 'text';
       $(elem).before('<br/><label>' + elem.name + '</label>: ');
    });
    
```

## Change `submit` to `button`

A submit button `<input type="submit" name="submitform"/>` could be changed to a standard button using:

`document.getElementsByName("submitform")[0].type = "button";` or `$("input[name='submitform']").prop("type", "button");`


## jQuery custom events

[jQuery custom events](https://www.sitepoint.com/jquery-custom-events/):

    $('#my_id').click(function() {
        $.event.trigger({
        	type: "newMessage",
	        message: "Hello World!",
	        time: new Date()
        });
    });

Handlers can now subscribe to “newMessage” events, e.g.

    $(document).on("newMessage", function() {
        // ...
    });
