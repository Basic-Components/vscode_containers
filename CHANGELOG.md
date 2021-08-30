# alpine3.13-gcc10-conan1.39.0-clang10-protobuf3.17.1-grpc1.38.0

+ `cmake3.20.3`
+ `make`
+ `ninja`
+ `gcc10`
+ `python3.9`
+ `gfortran`
+ `clang11`
+ `protobuf3.17.1`
+ `grpc1.38.0`(`grpc_cpp_plugin`路径由环境变量`PROTOC_GEN_GRPC_CXX_PATH`指定)

# alpine3.13-gcc10-conan1.39.0-vcpkgmaster

包含包管理工具

+ `conan`,已经创建了名为`default`的profile


+ `vcpkg`仓库下载在路径`/vcpkg/vcpkg`中,`/vcpkg/vcpkg/vcpkg`软连接到了`/usr/bin/vcpkg`

    感谢[robotdad/findfaces](https://github.com/robotdad/findfaces/tree/original)这个项目.它提供了`x64-linux-musl.cmake`.

+ `ninja`
+ `gcc10`
+ `python3`
+ `gfortran`