NGINX's configtest (and when restarting the server) give no information:

.. code::

    $ sudo service nginx configtest
    * Testing nginx configuration                                           [fail]
 
Instead use: ``$ sudo nginx -t``
