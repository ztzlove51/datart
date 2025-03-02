FROM swr.cn-north-4.myhuaweicloud.com/ddn-k8s/docker.io/openjdk:8-jdk-alpine-linuxarm64
LABEL "author"="tl"
RUN mkdir /datart
COPY ./bin/ /datart/bin/
COPY ./config/ /datart/config/
COPY ./lib/ /datart/lib/
COPY static /datart/static
ENV TZ=Asia/Shanghai
EXPOSE 8080
WORKDIR /datart
ENTRYPOINT java -server -Xms2G -Xmx2G -Dspring.profiles.active=config -Dfile.encoding=UTF-8 -cp "lib/*" datart.DatartServerApplication
