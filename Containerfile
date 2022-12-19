FROM ghcr.io/bketelsen/base:latest
# See https://pagure.io/releng/issue/11047 for final location

COPY etc /etc
COPY usr /usr

RUN rpm-ostree install gnome-shell-extension-appindicator gnome-shell-extension-dash-to-dock yaru-theme \
    openssl gnome-shell-extension-gsconnect nautilus-gsconnect syncthing && \
    systemctl unmask dconf-update.service && \
    systemctl enable dconf-update.service && \
    fc-cache -f /usr/share/fonts/ubuntu && \
    ostree container commit
