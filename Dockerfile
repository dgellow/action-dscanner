FROM alpine:3.11 as reviewdog
ENV REVIEWDOG_VERSION=v0.10.1

# hadolint ignore=DL3018
RUN apk --no-cache --update add git
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

FROM dlang2/dmd-ubuntu:2.091.1

# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends git \
	&& rm -rf /var/lib/apt/lists/*

COPY --from=reviewdog /usr/local/bin/reviewdog /usr/local/bin/reviewdog
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
