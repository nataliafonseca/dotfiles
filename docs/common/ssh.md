## SSH configuration

creating keys:

```sh
ssh-keygen -t ed25519 # or retrieve id_ed25519 and id_ed25519.pub and place in $HOME/.ssh/
cat ~/.ssh/id_ed25519.pub # add to github if not there already
```

getting authorized_keys and fixing any permissions:

```sh
curl -o ~/.ssh/authorized_keys --create-dirs https://github.com/nataliafonseca.keys && \
(echo -n '* '; cat ~/.ssh/id_ed25519.pub) > ~/.ssh/allowed_signers && \
sudo chown -R $USER:$USER ~/.ssh && \
sudo chmod 700 ~/.ssh && \
sudo chmod 600 ~/.ssh/authorized_keys && \
sudo chmod 600 ~/.ssh/allowed_signers && \
sudo chmod 600 ~/.ssh/id_ed25519 && \
sudo chmod 644 ~/.ssh/id_ed25519.pub
```

adding key to agent:

```sh
eval "$(ssh-agent -s)"
ssh-add
```

enabling ssh server:

```sh
sudo sed -i '/^#\?PasswordAuthentication/c\PasswordAuthentication no' /etc/ssh/sshd_config && \
sudo systemctl restart sshd && \
systemctl enable --now sshd
```
