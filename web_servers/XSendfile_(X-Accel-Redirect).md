I finally recalled this option via this [SO question](http://stackoverflow.com/a/28167298/1895018).

This page above [links through](http://stackoverflow.com/questions/7296642/django-understanding-x-sendfile) to a general overview which in turn links to the relevant [NGiИX docs](https://www.nginx.com/resources/wiki/start/topics/examples/xsendfile/).

But "django X-Accel-Redirect" looks like a [better search term](https://www.ecosia.org/search?q=django+X-Accel-Redirect).

TLDR; See [this explanation and worked through example](https://wellfire.co/learn/nginx-django-x-accel-redirects/).

If the downlaod is always a 0 kb html file then it's likely you're downloading just the django response (headers) and the redirect to NGINX is not working correctly to serve the file.

Remember, [you need to give the view a different URL, which is not captured by nginx's media serving](https://stackoverflow.com/a/45774975/).
