FROM ruby:2.3

RUN mkdir /sa_user_ss
WORKDIR /sa_user_ss

ADD Gemfile /sa_user_ss/Gemfile
ADD Gemfile.lock /sa_user_ss/Gemfile.lock

RUN bundle install
ADD . /sa_user_ss

EXPOSE 3010