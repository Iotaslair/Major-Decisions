# README

Ruby version: `2.6.0`

Rails version: `5.2.3`

## Developing locally
Make sure to seed the database (`rails db:seed`). To reset the _local_ database, run `rails db:reset` (note that this will automatically follow up with `rails db:seed`).
Initially, you might also have to migrate the database before this will work (`rails db:migrate`).
Furthermore, you will probably need to install the gems locally. Try running `bundle install`.

## Main gems
- `Devise` for user authentication.
- `Pundit` for user authorisation.

## Views
I've recently implemented a new "hero"-style layout. I suspect that most pages will get this layout and it will also ensure consistency across pages on the site. The hero layout incorporates a large header, some lead content, followed by the main content.
In the main application layout (`application.html.erb`), we see a check for the existence of a hero layout. If it does exist, render the appropriate components (`<%= yield ...`).
If it doesn't exist, render layouts as normal (`<%= yield %>`).

Take a look at `app/views/majors/index.html.erb` to see how to declare "hero"-style content. The four main components are:
- A header; `:hero_head`
- A lead paragraph (helpful for descriptions); `:hero_lead`
- A button group; `:hero_button_group`
- And the main content; `:content`

## Bootstrap convention
Everything is wrapped inside a `container`. Then, elements go in `row`s and `col` (columns) as appropriate.