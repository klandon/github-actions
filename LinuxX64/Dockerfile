FROM ubuntu:latest

#set runner release version from github
ENV RUNNER_VER="2.283.3"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        awscli \
        curl \
        tar \
        unzip \
        apt-transport-https \
        ca-certificates \
        sudo \
        gnupg-agent \
        software-properties-common \
        zlib1g-dev \
        gettext \
        liblttng-ust0 \
        libcurl4-openssl-dev \
        inetutils-ping \
        jq \
    && rm -rf /var/cache/apk/* \
    && mkdir actions-runner \
    && cd actions-runner \
    && curl  -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VER}/actions-runner-linux-x64-${RUNNER_VER}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VER}.tar.gz \
    && apt-get clean -y \
    && bin/installdependencies.sh
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]



