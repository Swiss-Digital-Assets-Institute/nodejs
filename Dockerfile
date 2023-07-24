FROM registry.fedoraproject.org/fedora-minimal:38

ARG NODEJS_VERSION=20

ENV npm_config_loglevel warn
ENV npm_config_unsafe_perm true

RUN microdnf --nodocs -y upgrade && \
    microdnf --nodocs -y install fedora-repos-modular && \
    echo -e "[nodejs]\nname=nodejs\nstream=${NODEJS_VERSION}\nprofiles=\nstate=enabled\n" > /etc/dnf/modules.d/nodejs.module && \
    microdnf --nodocs -y install \
    autoconf \
    automake \
    bash \
    ca-certificates \
    curl \
    bc \
    gcc-c++ \
    git \
    jq \
    libglvnd-glx \
    file \
    make \
    nodejs \
    postgresql \
    which && \
    microdnf --nodocs reinstall -y tzdata && \
    microdnf clean all && \
    rm -rf /var/cache/*
