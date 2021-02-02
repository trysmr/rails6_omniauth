FROM ruby:2.7.2

ENV APP_ROOT /app

RUN mkdir -p ${APP_ROOT}

WORKDIR ${APP_ROOT}

COPY Gemfile ${APP_ROOT}/
COPY Gemfile.lock ${APP_ROOT}/

RUN apt-get update -qq \
  && apt-get install -y build-essential sqlite

RUN bundle config build.nokogiri --use-system-libraries \
  && bundle install

COPY . ${APP_ROOT}

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
EXPOSE 3000

CMD [ "rails", "server", "-b", "0.0.0.0" ]
