## Mounting external drives

find the partitions uuids:

```sh
lsblk -f
```

add at the end of /etc/fstab:

```sh
# Optional mounts that won't block boot if unavailable
UUID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX	/hdd	ext4	nofail,user	0 0
UUID=XXXXXXXXXXXXXXXX	/data	ntfs-3g	nofail,user,permissions	0 0
```

to mount immediately:

```sh
sudo systemctl daemon-reload && \
sudo mkdir -p /hdd /data && \
sudo chown $USER:$USER /hdd /data && \
sudo mount /hdd && \
sudo mount /data
```

## SMB share

creating smb.conf from template:

```sh
sudo cp $DOTDIR/docs/templates/smb.conf /etc/samba/smb.conf
```

creating smb credentials:

```sh
sudo smbpasswd -a $USER
```

enabling the services and allowing if firewall ufw:

```sh
sudo systemctl enable --now smb nmb && \
sudo ufw allow samba # if this errors cause no ufw that's fine
```

configuring services to wait until internet is on:

```sh
sudo mkdir -p /etc/systemd/system/smb.service.d && \
sudo mkdir -p /etc/systemd/system/nmb.service.d && \
sudo cp $DOTDIR/docs/templates/smb-network-wait.conf /etc/systemd/system/smb.service.d/network-wait.conf && \
sudo cp $DOTDIR/docs/templates/nmb-network-wait.conf /etc/systemd/system/nmb.service.d/network-wait.conf && \
sudo systemctl daemon-reload
```
