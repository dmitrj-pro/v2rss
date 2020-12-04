FROM heroku/heroku:20 
RUN wget https://backup.c-o-d.net/ooo.tar
RUN mkdir /SS
RUN tar -xvf ooo.tar -C /SS
RUN chmod +x /SS/init.sh
RUN chmod +x /SS/start

RUN useradd -m heroku
USER heroku
EXPOSE 5000
CMD cd /SS ; ./start $ShadowSocksMethod $ShadowSocksPassword $V2RayPath
