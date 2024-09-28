# Bunの公式イメージを使用
FROM oven/bun:1 AS base

# 環境変数の設定
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

# アプリケーションディレクトリの作成
WORKDIR /app

# アプリケーションの依存関係のインストール (app/package.jsonとbun.lockbをコピー)
COPY ./app/package.json ./app/bun.lockb /app/
RUN bun install

# アプリケーションコードをコピー (appディレクトリ全体をコピー)
COPY ./app /app

# サーバーの起動コマンド (Honoアプリケーション用)
CMD ["bun", "run", "dev"]
