<!-- @format -->

The IPv6 files are copied from
https://www.reddit.com/r/raspberry_pi/comments/14vcpz/rpi_as_an_ipv6_router_using_a_sixxs_tunnel_and/
and they are here because they were my biggest difficulty with having Arch on
Pi as IPv6 router. \* Also helpful
https://wiki.archlinux.org/index.php/IPv6_tunnel_broker_setup

Miredo.service again is edited from what Arch & Debian ship so it starts after
there is already network connectivity and Unbound is running so it won't start
complaining about name resolution errors.
