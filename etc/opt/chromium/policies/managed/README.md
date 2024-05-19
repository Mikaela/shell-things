# Chromium policies

- https://chromeenterprise.google/policies/

<!-- editorconfig-checker-disable -->
<!-- prettier-ignore-start -->

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [`amber-theme-colour.json.sample`](#amber-theme-colourjsonsample)
- [`aminda-extensions.json`](#aminda-extensionsjson)
  - [3rdparty](#3rdparty)
  - [Silk - Privacy Pass Client for the browser](#silk---privacy-pass-client-for-the-browser)
  - [Plasma Integration](#plasma-integration)
  - [uBlock Origin](#ublock-origin)
  - [Ruffle](#ruffle)
  - [HTTP Indicator](#http-indicator)
  - [Fedora User Agent](#fedora-user-agent)
  - [IPvFooBar](#ipvfoobar)
  - [AdNauseam](#adnauseam)
  - [uBlock Origin](#ublock-origin-1)
  - [Bitwarden](#bitwarden)
  - [Privacy Badger](#privacy-badger)
- [`black-theme-colour.json.sample`](#black-theme-colourjsonsample)
- [`brave-shields-disabled.json`](#brave-shields-disabledjson)
- [`disable-brave-ipfs.json`](#disable-brave-ipfsjson)
- [`disable-brave-rewards-wallet.json`](#disable-brave-rewards-walletjson)
- [`disable-brave-tor.json`](#disable-brave-torjson)
- [`disable-brave-vpn.json`](#disable-brave-vpnjson)
- [`disable-floc.json`](#disable-flocjson)
- [`disable-incognito.json.badidea`](#disable-incognitojsonbadidea)
- [`doh-adguard-dns0.json`](#doh-adguard-dns0json)
- [`dph-adguard.json`](#dph-adguardjson)
- [`doh-adguard-unfiltered.json`](#doh-adguard-unfilteredjson)
- [`doh-cloudflare-secure.json`](#doh-cloudflare-securejson)
- [`doh-disabled`](#doh-disabled)
- [`doh-dns0.json`](#doh-dns0json)
- [`doh-dns0-kids.json`](#doh-dns0-kidsjson)
- [`doh-dns0-open.json`](#doh-dns0-openjson)
- [`doh-dns0-zero.json`](#doh-dns0-zerojson)
- [`doh-google64.json`](#doh-google64json)
- [`doh-google.json`](#doh-googlejson)
- [`doh-mullvad-base.json`](#doh-mullvad-basejson)
- [`doh-quad9-ecs.json`](#doh-quad9-ecsjson)
- [`doh-quad9.json`](#doh-quad9json)
- [`doh-unlocked-unset.json`](#doh-unlocked-unsetjson)
- [`edge-appsfavorites.json`](#edge-appsfavoritesjson)
- [`edge-newtabapps.json`](#edge-newtabappsjson)
- [`edge-screenshots.json`](#edge-screenshotsjson)
- [`enable-chromecast.json`](#enable-chromecastjson)
- [`enable-labs.json`](#enable-labsjson)
- [`enable-passwordleakdetection.json`](#enable-passwordleakdetectionjson)
- [`enable-tab-suspend.json`](#enable-tab-suspendjson)
- [`fix-edge-search.json`](#fix-edge-searchjson)
- [`generative-ai.json`](#generative-aijson)
- [`https-everywhere.json`](#https-everywherejson)
- [`prefetch.json`](#prefetchjson)
- [`profilemanager.json`](#profilemanagerjson)
- [`README.md`](#readmemd)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!-- prettier-ignore-end -->
<!-- editorconfig-checker-enable -->

## `amber-theme-colour.json.sample`

Automatically generated theme colour based on "amber" (`#ffb700`), it looks
kind of fancy, but doesn't feel like it's for me.

## `aminda-extensions.json`

As I cannot separate the keys to multiple files I am forced to keep them in
one and separate by what the file does, `aminda-extensions.json` is unlikely
to overlap with someone else.

Changing `normal_installed` to `force_installed` would also prevent
uninstallation.

This does contain some bloat or something not necessary in all situations or
even overlapping extensions, but there is an important side goal of _teaching
users to disable extraneous extensions they don't need_ (unless I decide they
do need something and thus it's `force_installed`.

### 3rdparty

- `bkdgflcldnnnapblkhphbgpggdiikppg` - DuckDuckGo
- `caoacbimdbbljakfhgikoodekdnlcgpk` - DuckDuckGo
- `mlojlfildnehdpnlmpkeiiglhhkofhpb` - AdNauseam
- `pkehgijcmpdhfbdbbnkijodmdjhbjlgp` - PrivacyBadger

### [Silk - Privacy Pass Client for the browser](https://chrome.google.com/webstore/detail/ajhmfdgkijocedmfjonnpjfojldioehi)

- `ajhmfdgkijocedmfjonnpjfojldioehi`

Silk or Privacy Pass has a chance of decreasing the amount of captchas
especially from Cloudflare when "suspicious" traffic is detected.

To intentionally trigger it and what should be allowed in NoScript:

- https://captcha.website
- https://issuance.privacypass.cloudflare.com

### [Plasma Integration](https://chrome.google.com/webstore/detail/cimiefiiaegbelhefglklhhakcgmhkai)

- `cimiefiiaegbelhefglklhhakcgmhkai`

Does a lot of small things on KDE Plasma which my family uses (and me too,
when I am not on Sway). For example media player integration to Plasma,
downloads indicator/control, KDE Connect, alt-f2, etc.

### uBlock Origin

- `cjpalhdlnbpafiamejdnhcphjbkeiagm`

Blocked for Ad Nauseam

### [Ruffle](https://chrome.google.com/webstore/detail/donbcfbmhbcapadipfkeojnmajbakjdc)

Actively developed open source extension to revive Flash content on the web.
It can also be embedded to webpages, but I would prefer my family to use a
newer version than hope everyone keeps their websites up-to-date.

### [HTTP Indicator](https://chromewebstore.google.com/detail/http-indicator/hgcomhbcacfkpffiphlmnlhpppcjgmbl)

- `hgcomhbcacfkpffiphlmnlhpppcjgmbl`

Displays whether a web page was loaded over HTTP/2 or HTTP/3 etc.

### [Fedora User Agent](https://chrome.google.com/webstore/detail/hojggiaghnldpcknpbciehjcaoafceil)

- `hojggiaghnldpcknpbciehjcaoafceil`

Communicates websites that Ubuntu isn't the only Linux distribution and makes
some offer rpm packages directly.

### [IPvFooBar](https://chromewebstore.google.com/detail/ipvfoobar/iimpkhokkfekbpmoamlmcndclohnehhk)

- `iimpkhokkfekbpmoamlmcndclohnehhk`

### [AdNauseam](https://microsoftedge.microsoft.com/addons/detail/adnauseam/mlojlfildnehdpnlmpkeiiglhhkofhpb)

- `mlojlfildnehdpnlmpkeiiglhhkofhpb`

Complementing PrivacyBadger with an adblocker so first profile runs have at
least something to block Malvertising now that I no longer enable NoScript out
of the box.

### uBlock Origin

- `odfafepnkmbhccpbejgmiehpchacaeak`

yes, it's the second time ,one is edge, one is chrome

### [Bitwarden](https://chrome.google.com/webstore/detail/nngceckbapebfimnlniiiahkandclblb)

- `nngceckbapebfimnlniiiahkandclblb`

The password manager of my choice. For the managed settings
[see here](https://bitwarden.com/help/deploy-clients/), although that only
applies to self-hosters.

### [Privacy Badger](https://chrome.google.com/webstore/detail/pkehgijcmpdhfbdbbnkijodmdjhbjlgp)

- `pkehgijcmpdhfbdbbnkijodmdjhbjlgp`

Configured to learn locally and also in incognito as opposed to only relying
on vendor list. Also not display the "Welcome to Privacy Badger screen".

See also:

- https://github.com/EFForg/privacybadger/blob/master/doc/admin-deployment.md
- https://github.com/EFForg/privacybadger/blob/master/src/data/schema.json

## `black-theme-colour.json.sample`

Sets the theme colour as black. This is managed instead of recommended,
because even the recommended policy seems to block theme changing.

`.sample` suffix is there so maybe I will stop applying this policy and thus
disabling GTK/Qt themes.

## `brave-shields-disabled.json`

Allowlist for sites where I think Brave Shields may be breaking things. Similar is also in
`aminda-extensions.json` for Privacy Badger.

## `disable-brave-ipfs.json`

Disables Brave integrated IPFS node.

## `disable-brave-rewards-wallet.json`

Disables Brave rewards and wallet.

## `disable-brave-tor.json`

Disables Tor in Brave as I recommend using Tor Browser instead.

## `disable-brave-vpn.json`

Disables Brave VPN, which is the most annoying feature that has group policy
that I can see.

## `disable-floc.json`

Disables floc or ad topics that are against privacy.

- https://start.duckduckgo.com/?q=google+floc+privacy+topics

## `disable-incognito.json.badidea`

Disables incognito mode. I don't recommend this.

## `doh-adguard-dns0.json`

## `dph-adguard.json`

## `doh-adguard-unfiltered.json`

## `doh-cloudflare-secure.json`

Sets Cloudflare with malware protection as the forced DNS-over-HTTPS server.

## `doh-disabled`

## `doh-dns0.json`

Simply forces DNS-over-HTTPS with DNS0.eu.

## `doh-dns0-kids.json`

## `doh-dns0-open.json`

## `doh-dns0-zero.json`

## `doh-google64.json`

## `doh-google.json`

## `doh-mullvad-base.json`

Forces DNS-over-HTTPS with Mullvad Base, which features ad, malware & tracker blocking.

- https://mullvad.net/en/help/dns-over-https-and-dns-over-tls#specifications

## `doh-quad9-ecs.json`

Forces DNS over HTTPS with Quad9 ECS enabled threat-blocking server and also contains
their alternative port.

## `doh-quad9.json`

Forces DNS over HTTPS with Quad9 threat-blocking server and also contains
their alternative port.

## `doh-unlocked-unset.json`

Allows configuring DoH even with managed policies present (unless another DoH rule is in force) since enabling any managed policy will otherwise gray out the option.

If no DNS over HTTPS policy is used, this unlocks the setting. Enabling managed policies disable it by default.

My other `doh-*.json` set this as well, because `secure` doesn't allow
downgrade to system resolver and Chromium seems somewhat unreliable with it often reporting
`DNS_PROBE_POSSIBLE` and while this occassionally disables ECH, it works and
my system resolvers are encrypted. I hope they will implement ECH with system
resolver soon to fix this.

## `edge-appsfavorites.json`

Edge apps in favorites bar.

## `edge-newtabapps.json`

Should enable apps in new tab page, although I am not seeing it.

## `edge-screenshots.json`

Explicitly enables screenshotting-

## `enable-chromecast.json`

Explicitly enables Chromecast support.

## `enable-labs.json`

Enables the beaker button "Experiments" for easier management than `about:flags`.

## `enable-passwordleakdetection.json`

Warns about password reuse, although that may only be with Google account.

## `enable-tab-suspend.json`

Enables the efficiency mode which suspends background tabs.

## `fix-edge-search.json`

Tells Microsoft Edge to redirect queries from new tab search box to URL bar
effectively forcing it to respect user configured search engine instead of
stealthily sending those queries to Bing.

## `generative-ai.json`

Allows using the AI features that I am not seeing anyway, but won't send data
back to Google about them.

## `https-everywhere.json`

This file evolved to merge another one, so now it:

- Online Certificate Status Protocol (OCSP), and Certivicate Revokation List
  (CRL) checks.
- Enables Encrypted Client-Hello (ECH), which however requires DNS-Over-HTTPS
  to be used.
- Forces HTTPS-only mode to be enabled.
- Attempts to upgrade `http://` queries to `https://`

## `prefetch.json`

Enables prefetching. Will make sites very speedy, but decreases privacy and may
conflict with uBlock Origin. However AdNauseam is already clicking those ads, so
maybe it's not that big of an issue.

## `profilemanager.json`

Forces the profile screen even with only one profile. I love the feature in Firefox
and want to see it here too, now that I accidentally noticed it.

## `README.md`

You are reading this file, are you not?
