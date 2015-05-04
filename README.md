# Copilot
A super simple, minimal cms for rails.  Unleash your content by letting your copilot take the wheel!

## Quick start
1. Add `gem 'copilot', git: 'https://github.com/launchpadlab/copilot.git'`
to your Gemfile
2. Run `rails generate copilot:install`
3. Add `//= require jquery` and `//= require copilot/application` to your application.js
4. Add ` *= require copilot/application` to your application.css
5. Add some editable text to your erb files with
```erb
<%= copilot_text 'slug', 'Editable Text' %>
```
or
```erb
<%= copilot_text 'slug' do %>
  Editable Text
<% end %>
```
6. Add a header to be able to edit login `<%= copilot_edit_panel %>`
7. Visit `/cms/admin` to login.

## Slugs
By default, slugs are prefixed using the controller and action handling the request so "slug.foo" becomes "controller_name.action_name.slug.foo".  You can override this by prepending a "." to the provided slug so ".slug.foo" will become "slug.foo".  Beware, if your slugs are not globally unique, some content may be overwritten.

## Configuration
You can set the app name to display in your CMS header by adding an initializer `copilot` and setting the `config.app_name` property.

## Backend
Copilot adds a table to your database named copilot_content that contains all of the content under the control of copilot.
