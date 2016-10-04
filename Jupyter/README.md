# Jupyter

Jupyter + IHaskell is running in an Arch Linux `systemd-nspawn` container.
The container was populated with `pacstrap`.
IHaskell was built in the container following [these instructions](https://github.com/gibiansky/IHaskell#installing-manually).

Inside the container, Jupyter is running as a systemd service, controlled by the file [`jupyter.service`](jupyter.service).

The container also runs as a systemd service.
The service file is the default `systemd-nspawn@.service` template,
augmented with [`resource-control.conf`](resource-control.conf) in `/etc/systemd/system/systemd-nspawn@Jupyter.service.d`.

The container also runs under disk limits, set up with `machinectl set-limit 20G` and `machinectl set-limit Jupyter 15G`.
The `/srv/jupyter` directory, which is bind-mounted into the container as `/notebooks` and contains all notebooks,
is a btrfs loop-mounted file system:
```bash
dd if=/dev/zero of=/srv/jupyter.raw bs=1M count=1024
losetup -f /srv/jupyter.raw
mkfs.btrfs -L Jupyter /dev/loop3
```
It is mounted with [`srv-jupyter.mount`](srv-jupyter.mount).

`systemd-networkd` is running in both host and container,
creating a veth link per its default configuration.
The `systemd-networkd` DHCP server assigns the container an IP address of 10.0.0.12.

Apache is used to proxy the host `jupyter.lucaswerkmeister.de` to `10.0.0.12:8888`,
using the configuration files [`jupyter.lucaswerkmeister.de.conf`](jupyter.lucaswerkmeister.de.conf) and [`jupyter.lucaswerkmeister.de-ssl.conf`](jupyter.lucaswerkmeister.de-ssl.conf).
