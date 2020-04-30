FROM alpine:3.11 as reviewdog

ENV REVIEWDOG_VERSION=v0.9.17
RUN apk --no-cache --update add git && rm -rf /var/cache/apk/*
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

FROM dlang2/dmd-ubuntu:2.091.1

COPY --from=reviewdog /usr/local/bin/reviewdog /usr/local/bin/reviewdog
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
