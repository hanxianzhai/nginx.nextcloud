FROM nginx

RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.bak
RUN mkdir -p /etc/ssl/nginx
COPY pan.itop.vip.conf /etc/nginx/conf.d/
COPY pan.itop.vip.crt /etc/ssl/nginx/
COPY pan.itop.vip.key /etc/ssl/nginx/

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]