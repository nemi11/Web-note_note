# syntax=docker/dockerfile:1
ARG RUBY_VERSION=3.2.8
FROM ruby:$RUBY_VERSION-slim as base

WORKDIR /app

ENV RAILS_ENV=production \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_WITHOUT="development test"

# ---- Build stage ----
FROM base as build

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
      build-essential libpq-dev git curl pkg-config \
      zlib1g-dev libyaml-dev libgmp-dev libffi-dev \
      libxml2-dev libxslt1-dev libvips-dev && \
    rm -rf /var/lib/apt/lists/*

# 👇 ここを追加！Gemの保存先に権限を与える
RUN mkdir -p /usr/local/bundle && \
    chown -R nobody:nogroup /usr/local/bundle

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
RUN bundle exec bootsnap precompile --gemfile
RUN SECRET_KEY_BASE_DUMMY=1 DATABASE_URL=postgres://myapp:password@localhost/myapp_production \
    bin/rails assets:precompile

# ---- Runtime stage ----
FROM base as runtime

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends curl postgresql-client libvips && \
    rm -rf /var/lib/apt/lists/*

COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /app /app

USER nobody:nogroup
WORKDIR /app

EXPOSE 3000
CMD ["bin/rails", "server", "-b", "0.0.0.0"]

