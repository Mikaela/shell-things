Subdirectories of this directory shouldn't exist unless they are .wants

## IPv6-files

The IPv6 files are copied from https://www.reddit.com/r/raspberry_pi/comments/14vcpz/rpi_as_an_ipv6_router_using_a_sixxs_tunnel_and/
  and they are here because they were my biggest difficulty with having
Arch on Pi as IPv6 router.
    * Also helpful
      https://wiki.archlinux.org/index.php/IPv6_tunnel_broker_setup

## ydns-simple

ydns-simple.\* are for https://github.com/Mikaela/scripts/blob/gh-pages/bash/ydns-simple and I am just curious and want to avoid installing cron to my
phone.

## also interesting

* Waiting for network devices to have IP address (**I only use this for
cables**) https://wiki.freedesktop.org/www/Software/systemd/NetworkTarget/#cutthecraphowdoimakenetwork.targetworkforme
    * systemctl enable NetworkManager-wait-online.service
    * systemctl enable systemd-networkd-wait-online.service
