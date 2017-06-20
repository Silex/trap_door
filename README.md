# Trap Door - Reverse Captcha for Rails 4 & 5

Unobtrusive Captcha for your Rails forms. Trap Door works by adding a
hidden "honeypot" field to your forms that only a spam bot will fill
out. A before filter checks for the presence of this field and
banishes bots to a [spam trap](http://en.wikipedia.org/wiki/User:Mike_Rosoft/Spambot).

## Installation

``` ruby
gem 'trap_door', github: 'Silex/trap_door'
```

## Using Trap Door

### In your controller

``` ruby
class PostController < ApplicationController
  trap_door only: :create
  # ...
```

### In your view

``` ruby
<% form_for(@post) do |form| %>
  <%= trap_door_field %>
  # ...
```

## Configuration

By default Trap Door names the hidden_field `:affiliate_id`. Obviously
this won't work for everyone so you can change the field name by
creating an initializer in `config/initializers` and telling Trap Door
the name it should use for the honeypot field:

``` ruby
TrapDoor.honeypot_field_name = :go_away`
```

Copyright © 2009 Mike Breen

Copyright © 2013 Philippe Vaucher

Released under the MIT license
