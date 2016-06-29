#!/bin/bash

project='mtna-server-cookbook'
version=$(cat metadata.rb | grep version | grep -o '[0-9].[0-9].[0-9]')
iteration="$TRAVIS_BUILD_NUMBER.git$(git rev-parse --short HEAD)"
architecture='x86_64'
url="https://github.com/PronghornDigital/${project}"
vendor='JonathanPorta.com'
description='MTNA Server Cookbook'
install_prefix="/opt/PronghornDigital/${project}"

fpm -s dir -t rpm \
    --name "${project}" \
    --version "${version}" \
    --iteration "${iteration}" \
    --architecture "${architecture}" \
    --url "${url}" \
    --vendor "${vendor}" \
    --description "${description}" \
    --prefix "$install_prefix" \
    cookbooks \
    solo.json \
    solo.rb \
    autochef.sh \
    firewalld.sh \
    backup.sh \
    install.sh \
    README.md
