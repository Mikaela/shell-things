<!-- @format -->

# Configuring SNTP Servers in Windows terminal

<!-- editorconfig-checker-disable -->
<!-- prettier-ignore-start -->

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Finland without particular ISP and explanations](#finland-without-particular-isp-and-explanations)
- [Variations](#variations)
  - [DNA](#dna)
  - [Elisa](#elisa)
- [Information about servers](#information-about-servers)
- [Additional reading](#additional-reading)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!-- prettier-ignore-end -->
<!-- editorconfig-checker-enable -->

## Finland without particular ISP and explanations

```
w32tm /config /syncfromflags:manual /manualpeerlist:"time.cloudflare.com time.mikes.fi time1.mikes.fi time2.mikes.fi time3.mikes.fi 0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org"
w32tm /resync
w32tm /query /peers
```

- The list is space separated NTP servers, while I think Windows uses SNTP
  instead of NTP.
- `/resync` may sync current time, but is also required for the GUI (Windows +
  I, Date & time) and following command to get aware of peers.
- Shows where time is synced from and statistics.
  - There is also `net time` to sync, I am unsure of the differences while
    that may be blocked while the second keeps working. It may also not show
    all the peers, just the primary one, while `w32tm` is more verbose and has
    all of them.
- As Windows doesn't support NTS and probably won't in near future, there is
  no point in listing distant foreign servers.

## Variations

Variations of the timeserver setting command to be kept at hand

### DNA

_Including Moi_

```
w32tm /config /syncfromflags:manual /manualpeerlist:"time.cloudflare.com ntp.dnainternet.fi time.mikes.fi time1.mikes.fi time2.mikes.fi time3.mikes.fi pool.ntp.org"
```

- https://www.dna.fi/liikennerajoitukset
- https://asiakaspalvelu.moi.fi/hc/fi/articles/360029789832-Mitk%C3%A4-ovat-Moin-palvelinosoitteet-

### Elisa

```
w32tm /config /syncfromflags:manual /manualpeerlist:"time.cloudflare.com ntp1.kolumbus.fi ntp2.kolumbus.fi ntp.saunalahti.fi time.mikes.fi time1.mikes.fi time2.mikes.fi time3.mikes.fi pool.ntp.org"
```

- https://elisa.fi/asiakaspalvelu/ohje/tiedonsiirtoportit-porttiohjaukset-palvelimet/

## Information about servers

- https://www.cloudflare.com/time/
- https://www.netnod.se/nts/network-time-security
- https://www.vttresearch.com/fi/palvelut/suomen-aika-ntp-palvelu#julkinen
- https://www.ntppool.org/use.html
  - Also mentions the syntax for multiple servers, but considering this Elisa
    list has so many servers I am only picking one pool address just in case
    the others somehow fail.

## Additional reading

- Above links
- https://jasoncoltrin.com/2018/08/02/how-to-set-clock-time-on-ad-domain-controller-and-sync-windows-clients/
  - this file might not exist without this post, while it doesn't mention
    multiple servers, uses `time.windows.com` and I am yet to actually touch
    NTP on Windows Server environment.
