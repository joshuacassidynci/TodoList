FROM ruby:3.0.0

RUN apt-get update -yqq
RUN apt-get install -yqq --no-install-recommends nodejs

COPY . /usr/src/app/

WORKDIR /usr/src/app
ENV RAILS_ENV=production
RUN gem install bundler:2.2.3
RUN bundle install
RUN rake db:migrate
RUN rails assets:precompile
CMD [ "rails", "server"]
