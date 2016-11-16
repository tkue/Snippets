Running Individual Applications with Different Themes
======================================================


## Directories

- Themes directory `/usr/share/themes`
- Applications
  - Local `~/.local/share/applications`
  - Global `/usr/share/applications`


## Example

- Copy `.desktop` file from global dir to local to override desktop entry
- Make edit:
```
...
Comment[zh_HK]=編輯文字檔
Comment[zh_TW]=編輯文字檔
Exec=env GTK_THEME=Adwaita:dark gedit %U
Terminal=false
Type=Application
...
```
- Restart Shell
`Alt+F2 + "r"`


----
[Source](http://worldofgnome.org/running-gtk-applications-different-themes-per-app/)
