FROM heroku/heroku:20 
RUN wget https://backup.c-o-d.net/ooo.tar
RUN mkdir /SS
RUN tar -xvf ooo.tar -C /SS
RUN chmod +x /SS/init.sh
RUN chmod +x /SS/start
RUN echo $SS_METHOD

RUN useradd -m heroku

USER heroku
EXPOSE 5000
CMD echo $SS_METHOD

USER heroku
EXPOSE 5000
CMD cd /SS ; ./init.sh ; ./init.sh addss $SS_METHOD $SS_PASSWORD SS $V2RAY_PATH ; ./init.sh start
