## Tailscale

```sh title="installing"
curl -fsSL https://tailscale.com/install.sh | sh
```

=== Pihole

```sh
sudo tailscale up --advertise-routes=192.168.0.0/16 --accept-dns=false
```

=== Others

```sh
sudo tailscale up --accept-routes
```

to change any setting, use tailscale set, e.g.:

```sh
sudo tailscale set --accept-routes # (1)
```

1: remove sudo on mac or windows
