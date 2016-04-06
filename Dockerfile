FROM alpine
MAINTAINER Lyndon Li <snakeliwei@qq.com>

RUN apk --update add nginx tzdata php php-mysql php-fpm git curl \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && apk del tzdata \
    && rm -rf /var/cache/apk/* 
    
RUN mkdir -p /moess
RUN git clone https://github.com/monoking/moeSS.git /moess
COPY nginx.conf /etc/nginx/nginx.conf
COPY startup.sh /startup.sh
WORKDIR /moess

EXPOSE 80 443

CMD ["/startup.sh"]
