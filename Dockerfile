FROM gliderlabs/alpine:latest
RUN apk --no-cache add bash openssl openssh rsync git nodejs tzdata
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata
RUN npm config set prefix /usr
ENV NODE_PATH /usr/lib/node_modules
RUN npm i -g yarn
RUN npm i -g nodemailer
