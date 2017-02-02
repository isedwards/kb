pip install imageio


.. code-block::

    import imageio

    filenames = [n + '.jpg' for n in '1234']
    images = []
    for filename in filenames:
        images.append(imageio.imread(filename))
    imageio.mimsave('movie.gif', images, duration=1)

See: http://stackoverflow.com/a/35943809/1624894
