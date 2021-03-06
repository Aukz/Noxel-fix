FROM ruby:2.5.0
RUN curl -SL https://deb.nodesource.com/setup_12.x | bash
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs yarn
RUN npm rebuild node-sass

WORKDIR /Noxel
COPY Gemfile /Noxel/Gemfile
COPY Gemfile.lock /Noxel/Gemfile.lock
COPY package.json yarn.lock ./
RUN yarn install --check-files
RUN bundle install
COPY . /Noxel

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
