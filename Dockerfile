# Elixir 1.3.2: https://hub.docker.com/_/elixir/
FROM elixir:1.4.2
ENV DEBIAN_FRONTEND=noninteractive

# Install hex
RUN mix local.hex --force

# Install rebar
RUN mix local.rebar --force

# Install the Phoenix framework itself
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

# Install NodeJS 6.x and the NPM
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y -q nodejs
RUN apt-get install -y inotify-tools

# Set /app as workdir
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN mix local.hex --force
RUN mix deps.unlock --all
RUN mix deps.get
RUN mix compile
CMD ["mix", "phoenix.server"]
