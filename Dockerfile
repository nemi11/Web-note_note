# syntax=docker/dockerfile:1
ARG RUBY_VERSION=3.2.8
FROM ruby:$RUBY_VERSION-slim as base

# 作業ディレクトリを /rails に設定
WORKDIR /rails

# Rails環境変数
ENV RAILS_ENV=production \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_WITHOUT="development test"

# ---- Build stage ----
FROM base as build

# 必要パッケージのインストール
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
      build-essential libpq-dev git curl pkg-config \
      zlib1g-dev libyaml-dev libgmp-dev libffi-dev \
      libxml2-dev libxslt1-dev libvips-dev && \
    rm -rf /var/lib/apt/lists/*

# Gemfileコピー & インストール
COPY Gemfile Gemfile.lock ./
RUN bundle install

# アプリケーションコピー
COPY . .

# bootsnap と assets precompile
RUN bundle exec bootsnap precompile --gemfile
RUN SECRET_KEY_BASE_DUMMY=1 DATABASE_URL=postgres://myapp:password@localhost/myapp_production \
    bin/rails assets:precompile

# ---- Runtime stage ----
FROM base as runtime

# 実行に必要なパッケージだけインストール
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends curl postgresql-client libvips && \
    rm -rf /var/lib/apt/lists/*

# build stage から必要なものをコピー
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

# root のまま実行
WORKDIR /rails

# ポート設定
EXPOSE 3000

# Rails サーバー起動
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
