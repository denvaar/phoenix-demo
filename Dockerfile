# Elixir 1.3.2: https://hub.docker.com/_/elixir/
FROM elixir:1.3.2
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
#RUN npm install
CMD ["mix", "phoenix.server"]




#  FROM ubuntu:latest
#  ENV DEBIAN_FRONTEND=noninteractive
#  
#  MAINTAINER Marcelo Gonçalves <marcelocg@gmail.com>
#  # Elixir requires UTF-8
#  RUN apt-get update && apt-get upgrade -y && apt-get install locales && locale-gen en_US.UTF-8
#  ENV LANG en_US.UTF-8
#  ENV LANGUAGE en_US:en
#  ENV LC_ALL en_US.UTF-8
#  
#  # update and install software
#  RUN apt-get install -y curl wget git make sudo \
#      # download and install Erlang apt repo package
#      && wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb \
#      && dpkg -i erlang-solutions_1.0_all.deb \
#      && apt-get update \
#      && rm erlang-solutions_1.0_all.deb \
#      # For some reason, installing Elixir tries to remove this file
#      # and if it doesn't exist, Elixir won't install. So, we create it.
#      # Thanks Daniel Berkompas for this tip.
#      # http://blog.danielberkompas.com
#      && touch /etc/init.d/couchdb \
#      # install latest elixir package
#      && apt-get install -y elixir erlang-dev erlang-dialyzer erlang-parsetools \
#      # clean up after ourselves
#      && apt-get clean
#  
#  RUN apt-get install -y inotify-tools
#  ENV PHOENIX_VERSION 1.2.1
#  
#  # install the Phoenix Mix archive
#  RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new-$PHOENIX_VERSION.ez
#  RUN mix local.hex --force \
#      && mix local.rebar --force
#  
#  # install Node.js (>= 6.0.0) and NPM in order to satisfy brunch.io dependencies
#  # See http://www.phoenixframework.org/docs/installation#section-node-js-5-0-0-
#  RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && sudo apt-get install -y nodejs
#  
#  ADD . /app
#  WORKDIR /app
#  RUN mix local.hex --force
#  RUN mix deps.unlock --all
#  RUN mix deps.get
#  RUN mix compile
#  #RUN npm install
#  CMD ["mix", "phoenix.server"]
#  ENV DEBIAN_FRONTEND=teletype
