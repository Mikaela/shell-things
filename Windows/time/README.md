# Configuring SNTP Servers in Windows terminal

```
w32tm /config /syncfromflags:manual /manualpeerlist:"time.cloudflare.com nts.netnod.se time.mikes.fi 0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org"
w32tm /resync
w32tm /query /peers
```

* The list is space separated NTP servers, while I think Windows uses SNTP instead
  of NTP.
* `/resync` may sync current time, but is also required for the GUI
  (Windows + I, Date & time) and following command to get aware of peers.
* Shows where time is synced from and statistics.
  * There is also `net time` to sync, I am unsure of the differences while
    that may be blocked while the second keeps working. It may also not
    show all the peers, just the primary one, while `w32tm` is more verbose
    and has all of them.

## Variations

Variations of the timeserver setting command to be kept at hand

Note: `time.cloudflare.com` and `nts.netnod.se` probably work everywhere and
I am keeping the second at hand in hopes of Windows implementing support for
NTS. Additionally Sweden is a neighbouring country and thus doesn't seem
too bad location for an NTP server.

### Elisa

Finnish WISP that I seem to often be a customer of.

```
w32tm /config /syncfromflags:manual /manualpeerlist:"time.cloudflare.com nts.netnod.se ntp1.kolumbus.fi ntp2.kolumbus.fi ntp.saunalahti.fi time.mikes.fi pool.ntp.org"
```

* https://elisa.fi/asiakaspalvelu/ohje/tiedonsiirtoportit-porttiohjaukset-palvelimet/

## Information about servers

* https://www.cloudflare.com/time/
* https://www.netnod.se/nts/network-time-security
* https://www.vttresearch.com/fi/palvelut/suomen-aika-ntp-palvelu#julkinen
* https://www.ntppool.org/use.html
  * Also mentions the syntax for multiple servers, but considering this Elisa
    list has so many servers I am only picking one pool address just in case
    the others somehow fail.

## Additional reading

* Above links
* https://jasoncoltrin.com/2018/08/02/how-to-set-clock-time-on-ad-domain-controller-and-sync-windows-clients/
  * this file might not exist without this post, while it doesn't mention
    multiple servers, uses `time.windows.com` and I am yet to actually touch
    NTP on Windows Server environment.
