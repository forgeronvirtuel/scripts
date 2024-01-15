#!/bin/bash

LOG_TAG=${LOG_TAG:-$(pwd)/$0}

# Exit script as soon as a command fails.
if [[ "$SCRIPT_EXIT_ON_ERROR" == "true" ]]; then
    set -e
fi

if [[ -z "$SCRIPTS_PATH" ]]; then
    echo "SCRIPTS_PATH environment variable is unset" >&2
    exit 1
fi

source $SCRIPTS_PATH/lib/logging.sh
source $SCRIPTS_PATH/lib/utils.sh

if [[ -d "/usr/local/go" && ! -w "/usr/local/go" ]]; then
    err "You have not the rights to suppress the /usr/local/go folder"
    exit 1
fi

GO_VERSION=${GO_VERSION:-1.21.6}
info "Installing go version ${GO_VERSION}"

# Get Go version
go_version=$(go version 2>/dev/null || echo null)
info "Current go version: $go_version"
if [[ "$go_version" == *"$GO_VERSION"* ]]; then
    info "Go version: $GO_VERSION already installed"
    exit 0
fi

temp_folder=$(mktemp -d)
notice "Temporary folder path: $temp_folder"

info "Downloading go"
wget -O $temp_folder/go${GO_VERSION}.linux-amd64.tar.gz https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz

warning "Removing old version of go"
rm -rf /usr/local/go

notice "Extracting go"
tar -C /usr/local -xzf $temp_folder/go${GO_VERSION}.linux-amd64.tar.gz

# Check if a path is already present in $PATH
go_path_found=$(find_in_path "/usr/local/go/bin")
if [[ "$go_path_found" == "false" ]]; then
    info "Adding go to PATH"
    echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
    echo "export PATH=\$PATH:\$HOME/go/bin" >> ~/.bashrc
    source ~/.bashrc
fi


