#FROM ruby:2.7.1
## Install bundler gem
#RUN apt-get update -qq && apt-get install -y build-essential nodejs
#RUN mkdir /app
#WORKDIR /app
#COPY Gemfile /app/Gemfile
#COPY Gemfile.lock /app/Gemfile.lock
#RUN bundle install
##COPY . /app


FROM ruby:2.7.1
ENV LANG C.UTF-8

#for MySQL
RUN apt-get clean
RUN apt-get update -qq && apt-get install -y apt-utils \
      build-essential libpq-dev nodejs mariadb-client

RUN gem install bundler

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME