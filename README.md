This is a simple docker container which runs the
[`snowd` and `sdnsd`](https://github.com/zrm/snow) daemons.

Unfortunately it isn't working quite yet (at least on OSX) and I'm not yet
sure why.

To run this and help debug, do:

```sh
$ docker build -t snow .
$ docker run --privileged -t -i snow /sbin/my_init -- bash
```

You should then see output like this:

```sh
*** Running /etc/my_init.d/00_regen_ssh_host_keys.sh...
*** Running /etc/my_init.d/50-prep-iptables.sh...
*** Running /etc/my_init.d/50-prep-tun.sh...
*** Running /etc/rc.local...
*** Booting runit daemon...
*** Runit started as PID 12
*** Running bash...
 INFO  : Assigned DTLS_BIND_PORT random port 42389
 INFO  : Assigned DTLS_OUTGOING_PORT random port 42817
 Jul  9 16:39:12 4d1b3d57b3f2 syslog-ng[22]: syslog-ng starting up; version='3.5.3'
 INFO  : Generated new key
 INFO  : Could not access DH params file /etc/snow/DH_params, using SKIP params
 INFO  : Background generating new DH params for next time (this may peg your CPU for a few minutes)
 INFO  : Virtual interface configured with network 172.16.0.0 netmask 255.240.0.0 address 172.16.0.1 MTU 1419
 INFO  : Your key is baaaadxluonb277jorfeowospmtcrsuiosw3nc2hz6mg7glpenvfrul7a.key
 INFO  : Detected the following local addrs: 172.17.0.153 
WARNING: No DHT peers connected, DHT is currently offline. Check your internet connection or firewall or update /var/lib/snow/known_peers
```

I haven't been able to ping that key from within the container. I think it
has something to do with not properly altering or using the TUN device from
within docker. This may be specific to OSX & boot2docker.
