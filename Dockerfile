FROM qnib/alplain-golang

ENV CLAIR_DB_HOST=localhost
VOLUME /config

WORKDIR /usr/local/src/github.com/coreos/
RUN apk --no-cache add git bzr rpm xz \
 && git clone https://github.com/coreos/clair.git \
 && go install -v github.com/coreos/clair/cmd/clair
COPY opt/qnib/clair/etc/config.yaml /opt/qnib/clair/etc/
COPY opt/qnib/entry/20-clair-config.sh /opt/qnib/entry/
CMD ["clair"]

