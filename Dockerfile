FROM registry.fedoraproject.org/fedora-minimal:41

ARG NODEJS_VERSION=22
ENV npm_config_loglevel warn
ENV npm_config_unsafe_perm true

RUN microdnf install -y nodejs${NODEJS_VERSION} \
                        autoconf \
                        automake \
                        ca-certificates \
                        curl \ 
                        bc \
                        gcc-c++ \
                        jq \
                        libglvnd-glx \
                        file \
                        make \
                        nodejs \
                        which && \
                        rm -rf /var/cache/microdnf
