FROM ruby:3.0.0

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /app

RUN apt-get update

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

# This is added via https://devcenter.heroku.com/articles/exec#using-with-docker
COPY ./.profile.d /app/.profile.d
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# $PORT is assigned from Heroku at deploy time
CMD exe/simple-api
