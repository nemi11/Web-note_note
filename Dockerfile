# syntax=docker/dockerfile:1
FROM ruby:3.2.8

# 必要ライブラリをインストール
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
      build-essential \
      libyaml-dev \
      zlib1g-dev \
      libffi-dev \
      default-mysql-client \
      default-libmysqlclient-dev \
      nodejs \
      npm \
      git \
      curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["bash"]
