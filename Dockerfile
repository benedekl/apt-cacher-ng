FROM debian:bullseye-slim

RUN set -uex; \
    apt update -y; \
    apt install apt-cacher-ng -y; \
    ln -sf /dev/stdout /var/log/apt-cacher-ng/apt-cacher.log; \
    ln -sf /dev/stderr /var/log/apt-cacher-ng/apt-cacher.err; \
    apt clean all; \
    rm -rf /var/lib/apt/lists/*;

EXPOSE 3142
VOLUME ["/var/cache/apt-cacher-ng"]

ENTRYPOINT ["/usr/sbin/apt-cacher-ng"]
CMD ["-c", "/etc/apt-cacher-ng", "ForeGround=1"]
