!/bin/bash

VERSION=${1:-1.6.5}
TAG=${1:-latest}

CODE=$(curl -Is https://openlitespeed.org/packages/openlitespeed-${VERSION}.tgz -w %{http_code} -o /dev/null)
echo $CODE
if [ $CODE != "200" ]; then
  echo -e "packages/openlitespeed-${VERSION} unavailable"
  exit 1
fi

docker build --build-arg version=${VERSION} -t dugi/openlitespeed:${TAG} .
