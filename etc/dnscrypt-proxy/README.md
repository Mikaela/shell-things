My configs for [dnscrypt-proxy]

At the time of writing, hosts-mikaela.txt is intended for not having to
remember or trust the DNS for all of the domains or the hypothetical
scenario where I have no access to DNS, but for some reason having access
to [Yggdrasil] and/or [Hyperboria] or just to answer the question, why to
rely on centralized technology on decentralized web.

Mosts of the domains in hosts-mikaela.txt should also work without the file
when mikaela.internal is replaced with mikaela.info, however relying on DNS,
but that way you must trust DNSSEC, CloudFlare and wherever the CNAME
points to who may not have DNSSEC. If you are using this file
(you shouldn't), you are already trusting me.

[dnscrypt-proxy]:https://github.com/jedisct1/dnscrypt-proxy
[Hyperboria]:https://hyperboria.net/
[Yggdrasil]:https://yggdrasil-network.github.io/
