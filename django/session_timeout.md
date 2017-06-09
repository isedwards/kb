Typical session settings

    SESSION_EXPIRE_AT_BROWSER_CLOSE = True
    SESSION_COOKIE_AGE = 7200
    SESSION_SAVE_EVERY_REQUEST = True

Adding `SESSION_SAVE_EVERY_REQUEST = True` ensures that users are only logged out when they have been inactive.
Without this setting the session expires 7200 seconds (2 hours in seconds) after the session is created, regardless of activity.

A more thorough solution is provided by [django session security](https://github.com/yourlabs/django-session-security).
