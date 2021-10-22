FROM ruby:2.7.4

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev curl shared-mime-info

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs
RUN npm install yarn -g

ENV RAILS_ROOT /app
RUN mkdir -p $RAILS_ROOT

WORKDIR $RAILS_ROOT

ENV RAILS_ENV=development
ENV RACK_ENV=development

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN gem install bundler:2.0.2
RUN bundle install --jobs 20 --retry 5

RUN yarn install --check-files

RUN bundle exec rails assets:precompile
RUN bundle exec rails webpacker:compile

COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]