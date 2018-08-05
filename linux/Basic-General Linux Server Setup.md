Title: Basic/General Linux Server Setup
Slug: basicgeneral-linux-server-setup
Slug:
Date: 2016-05-07 12:05:10
Tags:
Category:
Author:
Lang:
Summary:


## SSH

### Permissions ###

```bash

chmod 700 ~/.ssh
chmod 600 ~/.ssh/autoirized_keys

```

## Login ##

- Add user besides root 
- Add user to groups 
    + wheel 
    + sudo 
- Edit ssh config 
    + PermitRootLogin no
    + Change ports 
    + ForwardX11

    `systemctl reload sshd`

## CentOS-Specific ##

### 