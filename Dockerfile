# ベースイメージとしてDebianを使用
FROM debian:bullseye-slim

# 環境変数の設定
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y curl bash

# Bunのインストール
RUN curl -fsSL https://bun.sh/install | bash

# Bunがインストールされている場所をパスに追加
ENV PATH="/root/.bun/bin:$PATH"

# アプリケーションディレクトリの作成
WORKDIR /app

# Bunのバージョンを確認
RUN bun --version

# アプリケーションの依存関係のインストール (package.jsonとbun.lockbをコピー)
COPY package.json bun.lockb /app/
RUN bun install

# アプリケーションコードをコピー
COPY . /app

# Honoサーバーを起動するためのポートを公開
EXPOSE 3000

# サーバーの起動コマンド (Honoアプリケーション用)
CMD ["bun", "run", "index.ts"]
