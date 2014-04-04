####################################
# Team City 8 Agent Docker Image
####################################

FROM java7

ENV TEAM_CITY_BASE_URL http://download-ln.jetbrains.com/teamcity
ENV TEAM_CITY_PACKAGE TeamCity-8.1.1.tar.gz
ENV TEAM_CITY_INSTALL_DIR /opt/

RUN wget -q -O - $TEAM_CITY_BASE_URL/$TEAM_CITY_PACKAGE | tar -xzf - -C $TEAM_CITY_INSTALL_DIR

ADD https://github.com/filinger/docker-teamcity-agent/blob/master/agent.sh $TEAM_CITY_INSTALL_DIR/TeamCity/

EXPOSE 9090
ENTRYPOINT .$TEAM_CITY_INSTALL_DIR/TeamCity/agent.sh run
