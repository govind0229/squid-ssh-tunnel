# `Squid` ssh tunnel for providing internet to remote/client server via secquere reverse tunnel

Connect remote/client sites to the internet safely and securely with [Squid](http://www.squid-cache.org/)'s SSH tunnel. Our reverse tunnel solution ensures a safe and reliable connection while providing peace of mind for all your internet needs.

## Required daemons for deploying the ssh-tunnel service

- Installing [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) and [Ubuntu](https://ubuntu.com/tutorials/install-ubuntu-on-wsl2-on-windows-11-with-gui-support#3-download-ubuntu) Linux on a Windows machine is necessary if you wish to utilize a Windows laptop or system for an ssh tunnel.

- Clone and move scripts to required location

```bash
cp -af ssh-tunnel-service /etc/init.d/ssh-tunnel-service

cp -af ssh-tunnel.sh /root/ssh-tunnel.sh
```

- Use the provided commands to install the necessary daemons.

````bash
apt-get install squid sshpass -y
````

- Start ssh tunnel service

```bash
service ssh-tunnel-service start 

service ssh-tunnel-service status
```

[Thank You!](govind0229.github.ip)
