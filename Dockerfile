FROM heroku/heroku:20 
RUN curl -sSL https://backup.c-o-d.net/ss.gz | zcat > /bin/ss
RUN chmod +x /bin/ss
RUN curl -sSL https://backup.c-o-d.net/v2ray.gz | zcat > /bin/v2ray
RUN chmod +x /bin/v2ray
RUN useradd -m heroku
USER heroku
EXPOSE 5000
CMD /bin/ss -cipher $ShadowSocksMethod -password $ShadowSocksPassword -plugin "/bin/v2ray" -plugin-opts "server;mode=websocket;path=$V2RayPath" -s 0.0.0.0:$PORT