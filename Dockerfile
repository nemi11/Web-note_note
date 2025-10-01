# syntax=docker/dockerfile:1

# Ruby バージョン指定
ARG RUBY_VERSION=3.2.8
FROM ruby:$RUBY_VERSION-slim as base

# Rails app lives here
WORKDIR /rails

# Set environment variables
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development test"

# ---- Build stage ----
FROM base as build

# 必要なパッケージをインストール（コンパイルに必要なもの全部）
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
      build-essential \
      libpq-dev \
      git \
      curl \
      pkg-config \
      zlib1g-dev \
      libyaml-dev \
      libgmp-dev \
      libffi-dev \
      libxml2-dev \
      libxslt1-dev \
      libvips-dev && \
    rm -rf /var/lib/apt/lists/*


# Gemfile をコピーして bundle install
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

# アプリケーションコードをコピー
COPY . .

# bootsnap precompile
RUN bundle exec bootsnap precompile app/ lib/

# assets:precompile（仮の key で）
RUN SECRET_KEY_BASE_DUMMY=1 DATABASE_URL=postgres://myapp:password@localhost/myapp_production ./bin/rails assets:precompile

# ---- Final stage ----
FROM base

# Runtime に必要な最低限のパッケージだけ
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl postgresql-client libvips && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives

# build ステージから成果物をコピー
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

# ユーザー設定
RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails db log storage tmp
USER rails:rails

# Entrypoint
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# ポート
EXPOSE 3000
CMD ["./bin/rails", "server"]

