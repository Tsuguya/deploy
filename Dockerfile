FROM gliderlabs/alpine:latest
RUN apk --no-cache add bash openssl openssh rsync git nodejs tzdata
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata
RUN npm i -g yarn nodemailer
