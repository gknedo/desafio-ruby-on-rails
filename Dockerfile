FROM ruby:2.7.1
WORKDIR /opt/app

RUN gem install bundler
COPY ./Gemfile ./Gemfile
COPY ./Gemfile.lock ./Gemfile.lock
RUN bundle install

COPY . .

ENV TZ America/Sao_Paulo

EXPOSE 3000
CMD rails s -b '0.0.0.0'
