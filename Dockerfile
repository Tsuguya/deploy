FROM gliderlabs/alpine:latest
RUN apk --no-cache add curl bash openssl openssh rsync git nodejs zip tzdata php php-curl php-openssl php-json php-phar php-dom
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
RUN npm config set prefix /usr
ENV NODE_PATH /usr/lib/node_modules
RUN npm i -g yarn
RUN npm i -g nodemailer
