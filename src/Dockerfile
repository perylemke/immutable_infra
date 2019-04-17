FROM ruby:2.5

RUN mkdir /usr/src/app
COPY . /usr/src/app/
WORKDIR /usr/src/app

RUN bundle install

ENV PORT 9292
EXPOSE 9292

CMD ["ruby", "apery.rb"]