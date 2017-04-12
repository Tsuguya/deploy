FROM gliderlabs/alpine:latest
RUN apk --no-cache --update add curl bash openssl openssh rsync git nodejs zip tzdata tar
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata
RUN npm config set prefix /usr
ENV NODE_PATH /usr/lib/node_modules
RUN npm i -g nodemailer
# php7 & yarn
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
	echo "http://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
	echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk --no-cache --update add libpng libpng-dev php7 php7-json php7-curl php7-openssl php7-dom php7-phar php7-iconv php7-zlib php7-mbstring php7-gd yarn
RUN ln -s /usr/bin/php7 /usr/bin/php
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
