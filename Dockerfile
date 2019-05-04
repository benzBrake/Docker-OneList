FROM alpine
MAINTAINER Ryan Lieu <github-benzBrake@woai.ru>

ADD supervisord.conf /etc
RUN set -ex \
    && if [ $(wget -qO- ipinfo.io/country) == CN ]; then echo "http://mirrors.aliyun.com/alpine/latest-stable/main/" > /etc/apk/repositories ;fi  && \
    apk --update add --no-cache python3 py3-pip python3-dev gcc git redis supervisor && \
    git clone https://github.com/0oVicero0/OneList /root/OneList && \
    cd /root/OneList&& \
    pip3 install -r requirements.txt && \
    apk del gcc git && \
    rm -rf /root/OneList/.git
EXPOSE 5000
ENTRYPOINT [ "/usr/bin/supervisord" ]
CMD ["-nc", "/etc/supervisord.conf"]
