[jQuery custom events](https://www.sitepoint.com/jquery-custom-events/)

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
