FROM gliderlabs/alpine:latest
RUN apk --update add bash openssl openssh rsync git nodejs
RUN npm i -g yarn nodemailer
