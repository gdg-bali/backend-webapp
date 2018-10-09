FROM ruby:2.5.0

ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y build-essential postgresql-client
RUN mkdir /workspace
WORKDIR /workspace
ADD Gemfile /workspace/Gemfile
ADD Gemfile.lock /workspace/Gemfile.lock
RUN bundle install
ADD . /workspace

