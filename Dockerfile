FROM ruby:2.6.5

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq
RUN apt-get install -y nodejs yarn
RUN mkdir /chat-app

WORKDIR /chat-app
COPY Gemfile /chat-app/Gemfile
COPY Gemfile.lock /chat-app/Gemfile.lock
RUN gem install bundle
RUN bundle install
COPY . /chat-app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]