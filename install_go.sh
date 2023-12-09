#!/bin/bash

VERSION=${VERSION:-"1.21.5"}
FIRST_INSTALL=${FIRST_INSTALL:-false}

echo "Installing go version ${VERSION}"
echo "First install: ${FIRST_INSTALL}"

# Clean old version, if any
rm -rf /usr/local/go 

# Download and install go
wget https://golang.org/dl/go${VERSION}.linux-amd64.tar.gz -O /tmp/go.tar.gz

# Extract and install
tar -C /usr/local -xzf /tmp/go.tar.gz

# Set the local binary path where go's installed binaries will be installed
if [ "$FIRST_INSTALL" = true ] ; then
    echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
    echo "export PATH=\$PATH:\$HOME/go/bin" >> ~/.bashrc
    source ~/.bashrc
fi
