VERSION=v4.0.15

ARCH=""
dockerArch=$(docker info | grep Architecture | cut -d' ' -f3 | sed -e 's/\s+//g')
case "${dockerArch}" in
    amd64)   ARCH='amd64';;
    x86_64)  ARCH='amd64';;
    arm64)   ARCH='arm64';;
    aarch64) ARCH='arm64';;
    *) echo "unsupported architecture: $dockerArch"; exit 1 ;;
esac


docker build -f Dockerfile-debian -t schnell18/tikv-dev:$VERSION-${ARCH} .
docker push schnell18/tikv-dev:$VERSION-${ARCH}
