# PhoenixBlog

### Todo

 - [x] "Like" button to update posts async.
 - [x] Update "reads" column upon `:show` action.
 - [x] Use slugs rather than ids in the urls.
 - [x] Do some migrations n stuff.
 - [x] Figure out how to integrate Javascript dependencies, like MomentJS so that I can format dates pretty.
 - [x] Pagination
 - [x] Markdown support for post content
 - [x] ~~Setup Docker for development~~ <-- This was a dumb idea
 - [x] Use Webpack instead of Brunch (mostly)
 - [ ] Custom error pages
 - [ ] SSL
 - [ ] File uploads/images
 - [ ] Sessions -- Authenticated user functionallity
 - [ ] Deploy to Heroku
 - [ ] Deploy with Nginx

To start your Phoenix app:

  ### Docker setup

  * `docker-compose build`
  * `docker-compose run mix ecto.create && ecto.migrate`
  * `docker-compose up`

  ### Default setup

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
