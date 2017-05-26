Initial exmaples
----------------

Adapted from `here <https://gist.github.com/wrunk/1317933>`_.

**jinja2_file_less.py**

.. code::

  from jinja2 import Environment

  HTML = """
  <html>
  <head>
    <title>{{ title }}</title>
  </head>
  <body>
    Hello.
  </body>
  </html>
  """

  def print_html_doc():
      print Environment().from_string(HTML).render(title='Hello World!')

  if __name__ == '__main__':
      print_html_doc()


**jinja2_file_system_loader.py**

.. code::

  from jinja2 import Environment, FileSystemLoader
  import os

  # Capture our current directory
  THIS_DIR = os.path.dirname(os.path.abspath(__file__))

  def print_html_doc():
      # Create the jinja2 environment.
      # Notice the use of trim_blocks, which greatly helps control whitespace.
      j2_env = Environment(loader=FileSystemLoader(THIS_DIR),
                           trim_blocks=True)
      print j2_env.get_template('test_template.html').render(
          title='Hellow Gist from GutHub'
      )

  if __name__ == '__main__':
      print_html_doc()
