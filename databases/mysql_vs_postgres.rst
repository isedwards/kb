Somewhere I have started a fairly lengthy comparison of MySQL/MariaDB and PostgreSQL (that document will eventually live here).

It's clear in Django that PostgreSQL is the preferred database backend, supporting a wider selection of capabilities.

* MySQL does not support `timezones on datetime <https://docs.djangoproject.com/en/1.10/releases/1.9/#removal-of-time-zone-aware-global-adapters-and-converters-for-datetimes>`_.
* Another documented indication of MySQL being weaker `is here <https://docs.djangoproject.com/en/1.10/releases/1.10/#abstractuser-username-max-length-increased-to-150>`_.
