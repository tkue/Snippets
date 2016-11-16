(Reverse) SSH Tunnels
=====================


## Reverse SSH Tunnel


From host you want to access:
```
ssh -N -f -R 20222:localhost:22 root@167.88.120.108
```
167.88.120.108 = remote server 

2. Now, you can SSH into `167.88.120.108` and then do:
```bash
ssh -p 20222 tom@localhost
```

to connect to the host you were originally at 


----

```bash

ssh -N -f -R [bind_address]:[port]:localhost:[port]
ssh -N -f -R 123.123.123.123:2010:localhost:22 destination.server.com

```

167.88.120.108

ssh -N -f -R 20222:localhost:22 root@167.88.120.108


## Links

[https://toic.org/blog/2009/reverse-ssh-port-forwarding/](https://toic.org/blog/2009/reverse-ssh-port-forwarding/)