FROM lucassovre/composer-symfony-node as buidler

WORKDIR /app

# Installer l'extension PHP intl
RUN apk add --no-cache icu-libs && apk add --no-cache --virtual .build-deps icu-dev
RUN docker-php-ext-configure intl && docker-php-ext-install intl && docker-php-ext-install pdo_mysql

#install composer dependencies
RUN composer require symfony/webpack-encore-bundle symfony/ux-dropzone symfony/ux-swup symfony/ux-chartjs symfony/ux-vue
COPY . .

#add all nodes dependencies
RUN composer install
RUN npm install --force && npm run build

FROM trafex/php-nginx

COPY --from=buidler /app /var/www/html

EXPOSE 8000

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]