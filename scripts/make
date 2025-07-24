#!/bin/bash

set -e

TARGET=$1
VERSION=$2

if [ -z "${VERSION}" ]; then
    VERSION=stable
fi

if [ -z "${TARGET}" ]; then
    echo "Usage: $0 <target> <version>"
    exit 1
fi

# packages
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
    automake \
    bison \
    bzip2 \
    ca-certificates \
    cmake \
    curl \
    file \
    flex \
    g++ \
    gawk \
    gdb \
    git \
    gperf \
    help2man \
    libncurses-dev \
    libssl-dev \
    libtool-bin \
    lzip \
    make \
    ninja-build \
    patch \
    pkg-config \
    python3 \
    rsync \
    sudo \
    texinfo \
    unzip \
    wget \
    xz-utils \
    libssl-dev \
    libffi-dev

# crosstool-ng
if [ ! -e /usr/bin/ct-ng ]; then
    curl -Lf https://github.com/crosstool-ng/crosstool-ng/archive/crosstool-ng-1.27.0.tar.gz | tar xzf -
    pushd crosstool-ng-crosstool-ng-1.27.0
    for i in ../targets/${TARGET}/*; do
        if [[ $i == *.patch ]]; then
            patch -Np1 -i $i
        fi
    done
    ./bootstrap
    ./configure --prefix=/usr
    make -j$(nproc)
    sudo make install
    popd
fi

# build
sudo mkdir -p /opt
sudo chmod 0777 /opt
mkdir -p build
cp targets/${TARGET}/${VERSION}/.config build/.config
pushd build
export CT_ALLOW_BUILD_AS_ROOT_SURE=1
ct-ng build || { tail -n 500 build.log; exit $ERRCODE; }
popd

# tarball
sudo mv /opt/x-tools/${TARGET} .
sudo chown -R root:root ${TARGET}

FILE_NAME="$(uname -m)-cross-tools-${TARGET}-${VERSION}"
sudo tar -cJf ${FILE_NAME}.tar.xz ${TARGET}
sudo sha256sum ${FILE_NAME}.tar.xz | awk '{ print $1 }' > ${FILE_NAME}.tar.xz.sha256