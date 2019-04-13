FROM ruby:2.6

RUN mkdir /usr/src/app
COPY . /usr/src/app/
WORKDIR /usr/src/app

RUN bundle install

ENV PORT 3000
EXPOSE 3000

CMD ["ruby", "apery.rb"]