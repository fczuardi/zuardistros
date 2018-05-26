Mount Win drive with better filesystem permissions metadata:
- https://blogs.msdn.microsoft.com/commandline/2018/01/12/chmod-chown-wsl-improvements/

**.bash_profile**
- GUI apps launch on win xserver (vcxsrv)
```
export DISPLAY=0.0
```
- mkdir with better permissions ( https://zzz.buzz/2016/10/09/notes-on-bash-on-ubuntu-on-windows-windows-subsystem-for-linux/#why-newly-created-file-has-mode-666-and-directory-777)
```
umask 022
```
