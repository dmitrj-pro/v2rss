FROM heroku/heroku:20 
RUN wget https://backup.c-o-d.net/v2.tar
RUN mkdir /SS
RUN tar -xvf v2.tar -C /SS
RUN chmod +x /SS/init.sh
RUN chmod +x /SS/ss

RUN useradd -m heroku
USER heroku
EXPOSE 5000
CMD cd /SS ; /bin/bash /SS/init.sh ; printf "11\n127.0.0.1\n12332\n$V2RayPath\n" | /bin/bash /SS/init.sh ; /bin/bash /SS/init.sh start ;  /bin/ss -cipher $ShadowSocksMethod -password $ShadowSocksPassword -s 127.0.0.1:12332
