Problems running certain apps because it complains about not having 256 colors

__Examples__
> - nano

__Solution__
```shell
export TERM=xterm
```
`Probably want to add this to your bash profile`

----

This may also solve some of the problems:
```
sudo apt-get install ncurses-term
```
