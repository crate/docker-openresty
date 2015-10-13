#!/bin/bash -e

if [[ -z "$1" ]]; then
    echo "$0 <version>"
    exit 1
else
    TAG=$1
    VERSION=`echo $TAG | cut -d '-' -f 1`
fi

VERSION_EXISTS=$(curl -fsSI http://openresty.org/download/ngx_openresty-${VERSION}.tar.gz)

if [ "$?" != "0" ]; then
    echo "Openresty version $VERSION doesn't exist!"
    exit 1
fi

TAG_EXISTS=$(git tag | grep $TAG)

if [ "$TAG" == "$TAG_EXISTS" ]
then
    echo "Tag $TAG_EXISTS already in use"
    exit 1
fi

sed "s/__OPENRESTY_VERSION__/$VERSION/g" Dockerfile.template > Dockerfile

