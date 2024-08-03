FROM python:3.11-alpine3.18

WORKDIR /usr/src/app

RUN apk update && apk add nodejs npm
RUN npm i -g immich

RUN wget http://www.testcams.com/airnef/Version_1.1/airnef_v1.1_Source.zip && \
  unzip airnef_v1.1_Source.zip && \
  rm airnef_v1.1_Source.zip

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

