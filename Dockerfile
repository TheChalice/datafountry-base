FROM alpine:latest
# FROM registry.new.dataos.io/datafoundry/web-base:latest

MAINTAINER jiangtong <jiangtong@asiainfo.com>


ADD . /

WORKDIR /datafoundry

# Install nginx & node
# Install Bower
# Install node & bower depends
# Set bower root allow

#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
RUN apk add --update nodejs git npm && \
    npm install -g bower && \
    echo '{ "allow_root": true }' > /root/.bowerrc && \
    git config --global url."https://".insteadOf git:// && \
    npm install
RUN  bower install && \
    rm -rf /var/cache/apk/* /tmp/* /root/.cache /root/.npm

EXPOSE 80 


ENTRYPOINT ["/usr/local/bin/start.sh"]
