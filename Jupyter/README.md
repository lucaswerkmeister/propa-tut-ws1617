# Jupyter

Jupyter + IHaskell is running in an Arch Linux `systemd-nspawn` container.
The container was populated with `pacstrap`.
IHaskell was built in the container
as the user `jupyter` in `~/IHaskell`
following [these instructions](https://github.com/gibiansky/IHaskell#installing-manually).

Inside the container, Jupyter is running as a systemd service, controlled by the file [`jupyter.service`](jupyter.service).
The service runs as the `jupyter-run` user, which belongs to the `jupyter` group.
`jupyter`’s home directory is readable to anyone in this group,
so that the service can access the IHaskell binaries.

Additionally, the following packages were installed by running
```sh
cabal --package-db=/home/jupyter/.stack/programs/x86_64-linux/ghc-7.10.3/lib/ghc-7.10.3/package.conf.d install $name
```
from the `jupyter` user:
- QuickCheck

The container also runs as a systemd service.
The service file is the default `systemd-nspawn@.service` template,
configured by [`Jupyter.nspawn`](Jupyter.nspawn) in `/etc/systemd/nspawn/`,
and augmented with [`resource-control.conf`](resource-control.conf) in `/etc/systemd/system/systemd-nspawn@Jupyter.service.d/`.

The container also runs under disk limits, set up with `machinectl set-limit 20G` and `machinectl set-limit Jupyter 15G`.
All notebooks live under a btrfs loop-mounted file system:
```bash
dd if=/dev/zero of=/srv/jupyter.raw bs=1M count=1024
losetup -f /srv/jupyter.raw
mkfs.btrfs -L Jupyter /dev/loop3
```
It is mounted with [`srv-jupyter.mount`](srv-jupyter.mount).
It contains a subvolume `/notebooks` for the actual notebooks,
which is bind-mounted into the container under `/notebooks` (and owned by `jupyter-run`).
Hourly snapshots of that subvolume are created in a `/.snapshots` subvolume,
using [`jupyter-notebooks-snapshot.timer`](jupyter-notebooks-snapshot.timer) and [`jupyter-notebooks-snapshot.service`](jupyter-notebooks-snapshot.service).

`systemd-networkd` is running in both host and container,
creating a veth link per its default configuration.
The `systemd-networkd` DHCP server assigns the container an IP address of 10.0.0.12.

Apache is used to proxy the host `jupyter.lucaswerkmeister.de` to `10.0.0.12:8888`,
using the configuration files [`jupyter.lucaswerkmeister.de.conf`](jupyter.lucaswerkmeister.de.conf) and [`jupyter.lucaswerkmeister.de-ssl.conf`](jupyter.lucaswerkmeister.de-ssl.conf).
