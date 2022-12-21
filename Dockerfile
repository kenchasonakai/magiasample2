FROM nginx

ENV PORT=8080
RUN touch ~/.ssh/authorized_keys && echo $SSH_PUB_KEY >> ~/.ssh/authorized_keys
COPY html /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf


CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'