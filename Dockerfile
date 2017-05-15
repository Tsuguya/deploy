FROM gliderlabs/alpine:latest
RUN apk --no-cache --update add expect curl bash openssl openssh rsync git nodejs zip tzdata tar
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata
RUN curl -sLO https://github.com/github/git-lfs/releases/download/v2.1.0/git-lfs-linux-amd64-2.1.0.tar.gz \
    && tar zxvf git-lfs-linux-amd64-2.1.0.tar.gz \
    && mv git-lfs-2.1.0/git-lfs /usr/bin/ \
    && rm -rf git-lfs-2.1.0 \
    && rm -rf git-lfs-linux-amd64-2.1.0.tar.gz
RUN npm config set prefix /usr
ENV NODE_PATH /usr/lib/node_modules
RUN npm i -g nodemailer
# php7 & yarn
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
	echo "http://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
	echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk --no-cache --update add libpng libpng-dev php7 php7-json php7-curl php7-openssl php7-dom php7-phar php7-iconv php7-zlib php7-mbstring php7-gd php7-xml php7-pdo  yarn
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
