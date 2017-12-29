## Trigger click

`$('#my_id').click()` doesn't trigger a click on the DOM element, to achieve this either use `$('#my_id')[0].click()` (i.e. directly on the element itself), or `document.querySelector('#my_id').click();`.

## [jQuery custom events](https://www.sitepoint.com/jquery-custom-events/)

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
