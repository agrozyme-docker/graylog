FROM agrozyme/openjdk:8
COPY source /

RUN set -euxo pipefail \
  && chmod +x /usr/local/bin/*.sh \
  && wget -q -O /tmp/graylog.tgz https://packages.graylog2.org/releases/graylog/graylog-2.5.1.tgz \
  && mkdir -p /usr/share/graylog/data/journal \
  && tar --extract --gzip --file /tmp/graylog.tgz --strip-components=1 --directory /usr/share/graylog \
  && rm -f /tmp/graylog.tgz \
  && chown -R root:root /usr/share/graylog

ENV GRAYLOG_CONF=/etc/graylog/graylog.conf
EXPOSE 9000
CMD ["agrozyme.graylog.command.sh"]
