FROM ruby:2.1.5

RUN apt-get update
RUN apt-get install -y postgresql-client postgresql-server-dev-9.4 libpq-dev

RUN gem install bundler

WORKDIR /app

VOLUME /app
VOLUME /usr/local/bundle

CMD rspec spec
