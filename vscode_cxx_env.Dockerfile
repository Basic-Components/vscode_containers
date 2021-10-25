FROM mcr.microsoft.com/vscode/devcontainers/base:0-alpine-3.13
#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
#COPY pip.conf /etc/pip.conf
RUN apk update 
RUN apk add --no-cache \
    ca-certificates git curl \
    gcc=10.2.1_pre1-r3 g++==10.2.1_pre1-r3 libgcc \
    clang \
    musl-dev linux-headers libc6-compat \
    pkgconfig autoconf binutils libtool make cmake re2c \
    tar zip unzip \
    perl python3 py3-pip gfortran
ENV CC=/usr/bin/gcc
ENV CXX=/usr/bin/g++
ENV CMAKE_C_COMPILER=gcc
ENV CMAKE_Fortran_COMPILER=gfortran
ENV CURLOPT_HTTP_VERSION=CURL_HTTP_VERSION_1_1
RUN pip --no-cache-dir install --upgrade pip
RUN pip --no-cache-dir install conan==1.40.3
RUN conan profile new default --detect  
RUN conan profile update settings.compiler=gcc default
RUN conan profile update settings.compiler.version=10 default
RUN conan profile update settings.compiler.exception=seh default
RUN conan profile update settings.compiler.libcxx=libstdc++11 default
RUN conan profile update settings.compiler.threads=posix default
RUN conan profile update settings.build_type=Release default
RUN git config --global http.version HTTP/1.1
RUN git config --global http.sslVerify false
WORKDIR /ninja
RUN git clone -b v1.10.2 https://github.com/ninja-build/ninja.git
WORKDIR /ninja/ninja
RUN python3 configure.py --bootstrap
RUN cp ninja /usr/bin
WORKDIR /
RUN rm -rf ninja
RUN conan install grpc/1.39.1@ --build=missing
RUN ln -s /root/.conan/data/protobuf/3.17.1/_/_/package/aba69e903eec80eb5e0e9f8eca38034f0013e66b/bin/protoc /usr/bin/protoc
ENV PROTOC_GEN_GRPC_CXX_PATH=/root/.conan/data/grpc/1.39.1/_/_/package/71ec1320aef0ef07a176228953be6f93f7f271b1/bin/grpc_cpp_plugin
