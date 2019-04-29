# README

Ruby version: `2.6.0`

Rails version: `5.2.3`

## Todo
**Only use this for minor bugs/to-dos/fix-mes. Create an issue and add the 'enhancement' label if it's big/important.**

- [x] Make Requirements page pretty -- Kyle see prettyRequirements branch
- [ ] Don't let Faculty or Students see Requirements page (/requirements)
- [ ] Back buttons are weird in a few different places. 
        Click on one of the majors, then click a course in that major (that's also in another major), click on the other major, click back
        Maybe more places where it fails
- [ ] Faculty shouldn't be able to add completed courses -- William in progress
        Remove card in profile view (and lock to students (in controller?)) 
- [ ] Create Admin back button which brings you back to the list of all requirements when just finished adding a course to AOC
- [ ] Get rid of dropdown for completed courses as a student (Make like Google's homepage when you search)
- [ ] No way to signify when you took a course (ex. Took Fall 2018)
- [ ] William's bootstrap code for courses taken (see above)
- [x] Search all courses/AOC's offered so you don't have to scroll forever(/courses) --kyle see visualFixes branch
- [x] Allow students to choose their AOC- [ ] Search all courses offered so you don't have to scroll forever(/courses)
- [x] Put link for AOC not in dropdown menu but in Navbar 
- [ ] When adding a course to a requirement make it like Google's homepage (Should be able to copy if someone did the stuff above)
- [ ] Don't allow students to say they took a course twice
- [x] Fixed links in footer and navbar

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
