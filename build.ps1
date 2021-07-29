docker buildx build `
--add-host=github-releases.githubusercontent.com:185.199.108.154 `
--add-host=github.githubassets.com:185.199.108.154 `
--add-host=assets-cdn.github.com:185.199.108.153 `
--add-host=gist.github.com:140.82.112.3 `
--add-host=github.io:185.199.108.153 `
--add-host=github.com:140.82.114.3 `
--add-host=api.github.com:140.82.113.6 `
--add-host=raw.githubusercontent.com:185.199.108.133 `
--add-host=codeload.github.com:140.82.112.10 `
--add-host=github-cloud.s3.amazonaws.com:52.216.236.11 `
--add-host=github-com.s3.amazonaws.com:52.217.99.188 `
-t hsz1273327/vscode-conan-container:alpine-3.14-gcc10-conan-1.39.0 `
. --push