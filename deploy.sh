#!/usr/bin/env sh

# остановить публикацию при ошибках
set -e

# сборка
npm run build

# переход в каталог сборки
cd dist

# если вы публикуете на пользовательский домен
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'

# если вы публикуете по адресу https://<USERNAME>.github.io
git push -f git@github.com:EvgeniiVoznyuk/EvgeniiVoznyuk.github.io.git master

# если вы публикуете по адресу https://<USERNAME>.github.io/<REPO>
<<<<<<< HEAD
# git push -f git@github.com:EvgeniiVoznyuk/vue-user-list.git master:gh-pages
=======
git push -f git@github.com:EvgeniiVoznyuk/vue-user-list.git master:gh-pages
>>>>>>> 16e48211048e465b860bc1e03650ca90238c6bb5

cd -