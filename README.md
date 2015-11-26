Trix Editor Helper
==================

Trix Editor Helper allows you to easily incorporate the [Trix Editor](https://github.com/basecamp/trix "Trix Editor") from Basecamp into your Rails projects.

Install
-------

Trix Editor Helper is a Rails engine tested against Rails >= 4.1 and Ruby >= 2.0.0. To get started, add Trix Editor Helper to your Gemfile and bundle install.

`gem 'trix_editor_helper'`

Make sure you then add the assets to your application's stylesheets:

```scss
@import 'trix';
```

And add the Javascript library:

```javascript
//= require trix
```

Use
---

### Basic Use

In your form simply use the `#trix_editor` method on your form builder.

```
<%= form_for @entry do |f| %>
  <%= f.trix_editor(:body, placeholder: 'Once upon a time...') %>
  <%= f.submit(t('.submit')) %>
<% end %>
```

Contributing
------------

Please make sure you have passing tests. Run `rake test` to run the test suite.

