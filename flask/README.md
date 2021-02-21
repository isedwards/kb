Using `.flaskenv` prevents the need for setting environment variables before using `flask run` (requires [`python-dotenv`](https://pypi.org/project/python-dotenv/)).
```
FLASK_APP=app_name.py
FLASK_ENV=development  # auto re-load when files change
```

# Flash messages

'An interesting property of flashed messages is that once they are requested once through the get_flashed_messages function they are removed from the message list, so they appear only once after the flash() function is called' -- [[FMT](https://courses.miguelgrinberg.com/courses/336779/lectures/5185865)]. See the docs for [categories and filtering](https://flask.palletsprojects.com/en/1.1.x/patterns/flashing/)

`flash('Login requested for user {}, remember_me={}'.format(form.username.data, form.remember_me.data))`
```
{% for mesg in get_flashed_messages() %}
    <h1>{{ mesg }}</h1>
{% endfor %}
```
