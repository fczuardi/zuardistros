
install chocolatey 

(run as admin)
```
 Get-ExecutionPolicy
 Set-ExecutionPolicy AllSigned
 Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco
```

(based on https://github.com/Microsoft/windows-dev-box-setup-scripts/blob/master/dev_web_nodejs.ps1)

git, nodejs
```
choco install -y git -params '"/GitAndUnixToolsOnPath /WindowsTerminal /NoAutoCrlf"'
git config --global core.autocrlf input
choco install -y 7zip.install
choco install -y nodejs
choco install -y python2
```

nodejs version 9
```
 choco install nodejs --version 9.11.1
```

node-gyp requirements? 

```
choco install -y visualstudio2017buildtools
choco install -y visualstudio2017-workload-vctools
```

or

https://github.com/nodejs/node-gyp#on-windows

tell git to use proper line endings
https://help.github.com/articles/dealing-with-line-endings/
```
git config --global core.autocrlf true
```
