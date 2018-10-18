My configs for [dnscrypt-proxy]

At the time of writing, hosts-mikaela.txt is intended for hypothetical
scenario where I have no access to DNS, but for some reason having access
to [Yggdrasil] and/or [Hyperboria] or just to answer the question, why to
rely on centralized technology on decentralized web.

The domains in hosts-mikaela.txt should also work without the file, relying
on DNS (with the exception of nxdomain.mikaela.info which point is to not
exist and confirm dnscrypt-proxy working properly), but that way you must
trust DNSSEC, CloudFlare and wherever the CNAME points to who may not have
DNSSEC.
