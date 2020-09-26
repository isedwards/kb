### [Syntax highlighting](https://docs.github.com/en/free-pro-team@latest/github/writing-on-github/creating-and-highlighting-code-blocks#syntax-highlighting)

You can add an optional language identifier to enable syntax highlighting in your fenced code block.

For example, to syntax highlight Ruby code:

```ruby
require 'redcarpet'
markdown = Redcarpet.new("Hello World!")
puts markdown.to_html
```

Valid keywords can be found in [Linguist](https://github.com/github/linguist)'s languages [YAML file](https://github.com/github/linguist/blob/master/lib/linguist/languages.yml).
