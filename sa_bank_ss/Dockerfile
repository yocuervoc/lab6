FROM ruby:2.3

RUN mkdir /sa_bank_ss
WORKDIR /sa_bank_ss

ADD Gemfile /sa_bank_ss/Gemfile
ADD Gemfile.lock /sa_bank_ss/Gemfile.lock

RUN bundle install
ADD . /sa_bank_ss
