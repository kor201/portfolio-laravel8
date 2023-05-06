# laravel8手順
### コンテナ立ち上げ
docker compose up -d --build
### node + vueインストール
docker compose exec laravel npm install -save-dev vue@next
### nodeインストール
docker compose exec laravel npm install && npm run dev
### node反映
docker compose exec laravel npm npm run dev

### webサーバlog取得
docker-compose logs nginx

# laravel10手順
### vueインストール
docker-compose exec laravel npm install --save-dev vue @vitejs/plugin-vue
### npm
docker compose exec -it laravel npm run dev

# https化
### https化key作成
（ローカルで）openssl genrsa -aes128 2048 > server.key
### https化csr作成
(コンテナ内で)openssl req -new -key server.key > server.csr
### https化crt作成
(コンテナ内で)openssl x509 -in server.csr -days 365 -req -signkey server.key > server.crt
### https化パスフレーズ作成
echo "設定したパスフレーズ" > server.password

# 個人作業
### マイグレーション
docker compose exec -it laravel php artisan migrate
### ライブラリインストール
docker compose exec -it laravel composer require openai-php/laravel
### ライブラリ反映
docker compose exec -it laravel php artisan vendor:publish --provider="OpenAI\Laravel\ServiceProvider"