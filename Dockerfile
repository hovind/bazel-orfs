FROM ubuntu:23.10

WORKDIR /
RUN apt update && \
    apt install --assume-yes --no-install-recommends git ca-certificates && \
    git clone --recursive https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts.git
WORKDIR /OpenROAD-flow-scripts
RUN ./etc/DependencyInstaller.sh -base && \
    ./tools/OpenROAD/etc/DependencyInstaller.sh -base && \
    ./etc/DependencyInstaller.sh -common -prefix=dependencies && \
    ./tools/OpenROAD/etc/DependencyInstaller.sh -common -prefix=dependencies && \
    ./build_openroad.sh --local