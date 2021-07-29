# vscode_containers

用于在vscode中通过remote-containers插件构造环境的镜像

## 用法

1. 项目根目录创建`Dockerfile`

    ```Dockerfile
    FROM conanio/vscode-conan-container:alpine-3.13-gcc10-conan-1.39.0
    ```

2. vscode中设置remote插件配置`New Container->From Dockerfile`
3. use conan as you wish.


```powershell
docker buildx build `
--add-host=github-releases.githubusercontent.com:185.199.108.154 `
--add-host=alive.github.com:140.82.114.26 `
--add-host=live.github.com:140.82.113.26 `
--add-host=github.githubassets.com:185.199.108.154 `
--add-host=desktop.githubusercontent.com:185.199.108.133 `
--add-host=assets-cdn.github.com:185.199.108.153 `
--add-host=camo.githubusercontent.com:185.199.108.133 `
--add-host=github.map.fastly.net:185.199.108.133 `
--add-host=github.global.ssl.fastly.net:199.232.5.194 `
--add-host=gist.github.com:140.82.112.3 `
--add-host=github.io:185.199.108.153 `
--add-host=github.com:140.82.114.3 `
--add-host=github.blog:192.0.66.2 `
--add-host=api.github.com:140.82.113.6 `
--add-host=raw.githubusercontent.com:185.199.108.133 `
--add-host=user-images.githubusercontent.com:185.199.108.133 `
--add-host=favicons.githubusercontent.com:185.199.108.133 `
--add-host=avatars5.githubusercontent.com:185.199.108.133 `
--add-host=avatars4.githubusercontent.com:185.199.108.133 `
--add-host=avatars3.githubusercontent.com:185.199.108.133 `
--add-host=avatars2.githubusercontent.com:185.199.108.133 `
--add-host=avatars1.githubusercontent.com:185.199.108.133 `
--add-host=avatars0.githubusercontent.com:185.199.108.133 `
--add-host=avatars.githubusercontent.com:185.199.108.133 `
--add-host=codeload.github.com:140.82.112.10 `
--add-host=github-cloud.s3.amazonaws.com:52.216.236.11 `
--add-host=github-com.s3.amazonaws.com:52.217.99.188 `
--add-host=github-production-release-asset-2e65be.s3.amazonaws.com:52.216.243.100 `
--add-host=github-production-user-asset-6210df.s3.amazonaws.com:52.216.250.204 `
--add-host=github-production-repository-file-5c1aeb.s3.amazonaws.com:52.217.74.124 `
--add-host=githubstatus.com:185.199.108.153 `
--add-host=github.community:64.71.144.202 `
--add-host=media.githubusercontent.com:185.199.108.133 `
-t hsz1273327/vscode-conan-container:alpine-3.14-gcc10-conan-1.39.0 `
. --push
```