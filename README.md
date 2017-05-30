# PhoenixBlog

## Todo :paperclip:

 - :white_check_mark: "Like" button to update posts async.
 - :white_check_mark: Update "reads" column upon `:show` action.
 - :white_check_mark: Use slugs rather than ids in the urls.
 - :white_check_mark: Do some migrations n stuff.
 - :white_check_mark: Figure out how to integrate Javascript dependencies, like MomentJS so that I can format dates pretty.
 - :white_check_mark: Pagination
 - :white_check_mark: Markdown support for post content
 - :white_check_mark: ~~Setup Docker for development~~ <-- This was a dumb idea
 - :white_check_mark: Use Webpack instead of Brunch
 - :white_check_mark: Custom error pages (check out the 404...)
 - :white_check_mark: File uploads/images
 - :white_check_mark: Sessions -- Authenticated user functionallity with (Guardian)[https://github.com/ueberauth/guardian]
 - :white_check_mark: Deploy to Heroku
   - The (deployment guide for Heroku)[http://www.phoenixframework.org/docs/heroku] is perfect, I only had to change to a different buildpack because I am using webpack.
   - `heroku buildpacks:set https://github.com/gjaldon/phoenix-static-buildpack`
   - `heroku buildpacks:add --index 1 https://github.com/HashNuke/heroku-buildpack-elixir`
 - :white_check_mark: Deploy with Nginx
 - :squirrel: SSL
   - :white_check_mark: Heroku
   - :squirrel: Nginx

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

### How to create a user

I decided not to implement registration functionallity, so to create a user, just insert a row manually into the `users` table in the database. You will have to provide a hashed version of your password, so you can generate it like this:

```$ iex -S mix```
```Comeonin.Bcrypt.hashpwsalt("your_password_here")```


Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
