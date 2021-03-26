# Flask vs Django

- Prefer Django security team
- Prefer Django `request.user` to flask-login's `current_user` which is randomly available in all templates and can be imported and used at any time
during the handling to obtain the user object that represents the client of the request. Flask has a `flask.request` object, but flask-login is not integrated.
- Prefer Django requirements.txt (much shorter...) and more certainty that core dependencies will be maintained

- Prefer Flask/[Werkzug debug](https://werkzeug.palletsprojects.com/en/1.0.x/debug/) (with PIN) and opening an interactive python shell in any 'frame' within the browser traceback
- SQLAlchemy is more powerful, and prefer Jinja2 due to reuse opportunities on non-Django/Flask projects


# Environment

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
