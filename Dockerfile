FROM debian:latest

LABEL maintainer "Fabrizio Mantione (fabrizio.mantione@gmail.com)"
LABEL description "ISC DHCP SERVER with GLASS management ui"

ENV PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends procps vim supervisor isc-dhcp-server nodejs npm git openssl rsyslog\
    && apt install --reinstall ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY supervisord.conf /etc/supervisord.conf
COPY start_glass.sh /start_glass.sh
COPY isc-dhcplog.conf /etc/rsyslog.d/isc-dhcplog.conf

WORKDIR /opt/
RUN git clone https://github.com/Akkadius/glass-isc-dhcp.git
WORKDIR /opt/glass-isc-dhcp

RUN mkdir logs
RUN chmod u+x ./bin/ -R
RUN chmod u+x *.sh
RUN npm install
RUN npm install forever -g
RUN chmod +x /start_glass.sh

VOLUME ["/var/lib/dhcp","/etc/dhcp/"]

EXPOSE 3000 67 68

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
