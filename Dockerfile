FROM alpine
MAINTAINER Lyndon Li <snakeliwei@qq.com>

RUN apk --update add nginx tzdata mysql mysql-client php php-mysql php-fpm git curl \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && apk del tzdata \
    && rm -rf /var/cache/apk/* 
    
RUN mkdir -p /moess
RUN git clone https://github.com/monoking/moeSS.git /moess
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 3306

CMD ["nginx", "-g", "daemon off;"]
