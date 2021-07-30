FROM mcr.microsoft.com/vscode/devcontainers/base:0-alpine-3.14
RUN apk update 
RUN apk add --no-cache ca-certificates git gcc=10.3.1_git20210424-r2 g++==10.3.1_git20210424-r2 make cmake perl linux-headers tar curl zip unzip python3 py3-pip libc6-compat ninja 
ENV CC=/usr/bin/gcc
ENV CXX=/usr/bin/g++
ENV CURLOPT_HTTP_VERSION=CURL_HTTP_VERSION_1_1
RUN pip --no-cache-dir install --upgrade pip
RUN pip --no-cache-dir install conan==1.39.0
RUN conan profile new default --detect  
RUN conan profile update settings.compiler=gcc default
RUN conan profile update settings.compiler.version=10 default
RUN conan profile update settings.compiler.exception=seh default
RUN conan profile update settings.compiler.libcxx=libstdc++11 default
RUN conan profile update settings.compiler.threads=posix default
RUN conan profile update settings.build_type=Release default
WORKDIR /vcpkg
RUN git config --global http.version HTTP/1.1
RUN git config --global http.sslVerify false
RUN git clone https://github.com/Microsoft/vcpkg.git
WORKDIR /vcpkg/vcpkg
RUN ./bootstrap-vcpkg.sh --useSystemBinaries
RUN ln -s /vcpkg/vcpkg/vcpkg /usr/bin/vcpkg