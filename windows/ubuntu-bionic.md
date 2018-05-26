Mount Win drive with better filesystem permissions metadata:
- https://blogs.msdn.microsoft.com/commandline/2018/01/12/chmod-chown-wsl-improvements/

**.bash_profile**
- GUI apps launch on win xserver (vcxsrv)
```
export DISPLAY=0.0
```
- mkdir with better permissions
```
umask 022
```
