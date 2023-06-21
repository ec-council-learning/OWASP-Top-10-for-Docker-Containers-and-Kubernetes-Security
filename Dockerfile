# alpine-zlib-jattach:3.9-1.2.11-1.5
ARG alpine_version=3.9
FROM frolvlad/alpine-glibc:alpine-$alpine_version

ARG zlib_version=1.2.11
ARG jattach_version=1.5

RUN apk add --no-cache libstdc++ \
    && wget "https://www.archlinux.org/packages/core/x86_64/zlib/download" -O /tmp/libz.tar.xz \
    && mkdir -p /tmp/libz \
    && tar -xf /tmp/libz.tar.xz -C /tmp/libz \
    && cp /tmp/libz/usr/lib/libz.so.$zlib_version /usr/glibc-compat/lib \
    && /usr/glibc-compat/sbin/ldconfig \
    && rm -rf /tmp/libz /tmp/libz.tar.xz \
    && wget https://github.com/apangin/jattach/releases/download/v$jattach_version/jattach -O /bin/jattach \
    && chmod +x /bin/jattach