FROM ruby:2.5

RUN mkdir /usr/src/app
COPY . /usr/src/app/
WORKDIR /usr/src/app

ENV BUNDLER_VERSION 2.0.1
RUN gem install bundler && bundle install --jobs 20 --retry 5

ENV PORT 3000
EXPOSE 3000

CMD ["ruby", "apery.rb"]