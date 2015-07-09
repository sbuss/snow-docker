# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:latest

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update && \
    apt-get install -y \
    	git g++ make libssl-dev \
	iptables-persistent

RUN cd && git clone git://github.com/zrm/snow
RUN cd && cd snow/src && make -j5 NO_UPNP=1 NO_NATPMP=1 && make install

RUN mkdir /etc/service/snow
ADD start-snow /etc/service/snow/run

RUN mkdir /etc/service/sdnsd
ADD start-sdnsd /etc/service/sdnsd/run

ADD 50-prep-iptables.sh /etc/my_init.d/
