FROM ubuntu:bionic
# Base image for debug builds.
# Built manually uploaded as "istionightly/base_debug"

ENV DEBIAN_FRONTEND=noninteractive

# Do not add more stuff to this list that isn't small or critically useful.
# If you occasionally need something on the container do
# sudo apt-get update && apt-get whichever

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
      ca-certificates \
      curl \
      iptables \
      iproute2 \
      iputils-ping \
      knot-dnsutils \
      netcat \
      tcpdump \
      net-tools \
      lsof \
      linux-tools-generic \
      sudo \
   && update-ca-certificates \
   && apt-get upgrade -y \
   && apt-get clean \
   && rm -rf  /var/log/*log /var/lib/apt/lists/* /var/log/apt/* /var/lib/dpkg/*-old /var/cache/debconf/*-old

COPY istio-federation-server /usr/local/bin/istio-federation-server
ENTRYPOINT ["/usr/local/bin/istio-federation-server"]