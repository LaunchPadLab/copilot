# Copilot
A super simple, minimal cms for rails.  Unleash your content by letting your copilot take the wheel!

## Quick start
1. Add `gem 'copilot', git: 'https://github.com/launchpadlab/copilot.git'`
to your Gemfile
2. Run `rails generate copilot:install`
3. Add `//= require jquery` and `//= require copilot/copilot` to your application.js
4. Add `*= require copilot/copilot` to your application.css
5. Add some editable text to your erb files with
```
<%= copilot_text 'slug', 'Editable Text' %>
```
or
```
<%= copilot_text 'slug' do %>
  Editable Text
<% end %>
```
6. Add a link to be able to edit the text `<%= link_to_copilot %>`
7. Click the link to edit the text and enjoy the ride!

## Slugs
By default, slugs are prefixed using the controller and action handling the request so "slug.foo" becomes "controller_name.action_name.slug.foo".  You can override this by prepending a "." to the provided slug so ".slug.foo" will become "slug.foo".  Beware, if your slugs are not globally unique, some content may be overwritten.

## Configuration (not implemented)

## Backend
Copilot adds one table to your database named copilot_content that contains all of the content under the control of copilot.