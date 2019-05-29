FROM node:latest
MAINTAINER yongs2 yongs2@hotmail.com

USER root
ARG APP_DIR=/app

# 디렉토리 생성 및 패키지 설치
RUN mkdir -p ${APP_DIR} \
	&& cd ${APP_DIR} \
	&& npm i -g create-react-app \
	&& create-react-app client \
	&& git clone https://github.com/AlexBibikov/flowdiagram \
	&& cd ${APP_DIR}/flowdiagram \
	&& rm -rf node_modules package-lock.json \
	&& npm install react-scripts \
	&& cp -Rp ${APP_DIR}/client/public ${APP_DIR}/flowdiagram/ \
	&& npm install

# WORKDIR 로 설정
WORKDIR ${APP_DIR}/flowdiagram

#가상 머신에 오픈할 포트
EXPOSE 3000

#컨테이너에서 실행될 명령을 지정
CMD ["yarn", "start"]
