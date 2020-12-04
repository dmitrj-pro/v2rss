FROM heroku/heroku:20 
RUN wget https://backup.c-o-d.net/ooo.tar
RUN mkdir /SS
RUN tar -xvf ooo.tar -C /SS
RUN chmod +x /SS/init.sh
RUN cd /SS ; /SS/init.sh
RUN cd /SS ; /SS/init.sh addss $ShadowSocksMethod $ShadowSocksPassword NAME $V2RayPath
RUN cd SS ; /SS/init.sh start
