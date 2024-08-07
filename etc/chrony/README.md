<!-- @format -->

# Chrony config files

For some reason Debian package for Chrony doesn't include other config files
so that has to be done by hand like

```
confdir /etc/chrony/chrony.d
```

## Windows

Refer to ../../Windows/time/README.md

## Other random notes

On pools, the default maxsources is 4 and pools would be resolved until there
would be 4 names while the documentation for Telia and Snopyta says they have
only 3. Cloudflare again resolves to two per IP version, so I assume that
means 2.

## Commands of interest:

### Chrony itself

Note: -N uses names specified in config instead of reverse name lookupping
then.

- `chrony -N activity` - what sources are doing
- `chrony -N authdata` - can show that server uses NTS
- `chrony -N ntpdata` - a lot of data on the servers
- `chronyc offline` - offline mode
- `chronyc online` - reconnects servers
- `chrony -N sources` - used timeservers and their statuses
- `chrony -N tracking` - local status (stratum and own clock etc.)

### nmap

Checking that something is an NTP server? Needs root:

```
nmap -sU -p 123 --script=ntp-info 192.168.0.1
```

Checking that something has NTS?

```
nmap -p 4460 -Pn ntp.example.net
```

In
[GitHub user jauderho's curated NTS list](https://gist.github.com/jauderho/2ad0d441760fc5ed69d8d4e2d6b35f8d)
user
[cadusilva suggests this command instead](https://gist.github.com/jauderho/2ad0d441760fc5ed69d8d4e2d6b35f8d?permalink_comment_id=4192632#gistcomment-4192632):

```'
chronyd -Q -t 3 'server NTP_SERVER_HERE iburst nts maxsamples 1'
```

### Firewall configuration

In case local clients or peers are wanted,

```
ufw allow from 192.168.0.0/16 to any port 123 proto udp
ufw allow from fe80::/10 to any port 123 proto udp
```

A bit wide `192.168.x.x`, but so is `conf.d/local-servers,conf` and
`fe80://10` isn't ULA either.
