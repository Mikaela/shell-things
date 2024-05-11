# Chromium policies

- https://chromeenterprise.google/policies/

<!-- editorconfig-checker-disable -->
<!-- prettier-ignore-start -->

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [`aminda-extensions.json`](#aminda-extensionsjson)
  - [Silk - Privacy Pass Client for the browser](#silk---privacy-pass-client-for-the-browser)
  - [uBlock Origin](#ublock-origin)
  - [Fedora User Agent](#fedora-user-agent)
  - [IPvFooBar](#ipvfoobar)
  - [AdNauseam](#adnauseam)
  - [uBlock Origin](#ublock-origin-1)
  - [Bitwarden](#bitwarden)
  - [Privacy Badger](#privacy-badger)
- [`black-theme-colour.json`](#black-theme-colourjson)
- [`brave-shields-disabled.json`](#brave-shields-disabledjson)
- [`disable-brave-rewards-wallet.json`](#disable-brave-rewards-walletjson)
- [`disable-brave-tor.json`](#disable-brave-torjson)
- [`disable-brave-vpn.json`](#disable-brave-vpnjson)
- [`disable-floc.json`](#disable-flocjson)
- [`disable-incognito.json.badidea`](#disable-incognitojsonbadidea)
- [`doh-cloudflare-secure.json`](#doh-cloudflare-securejson)
- [`doh-unlocked-unset.json`](#doh-unlocked-unsetjson)
- [`doh-dns0.json`](#doh-dns0json)
- [`doh-mullvad-base.json`](#doh-mullvad-basejson)
- [`doh-quad9-ecs.json`](#doh-quad9-ecsjson)
- [`doh-quad9-insecure-ecs.json.badidea`](#doh-quad9-insecure-ecsjsonbadidea)
- [`doh-quad9-insecure.json.badidea`](#doh-quad9-insecurejsonbadidea)
- [`doh-quad9.json`](#doh-quad9json)
- [`enable-ech-ocsp.json`](#enable-ech-ocspjson)
- [`enable-labs.json`](#enable-labsjson)
- [`fix-edge-search.json`](#fix-edge-searchjson)
- [`force-incognito.json.badidea`](#force-incognitojsonbadidea)
- [`https-everywhere.json`](#https-everywherejson)
- [`README.md`](#readmemd)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!-- prettier-ignore-end -->
<!-- editorconfig-checker-enable -->

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

### [Silk - Privacy Pass Client for the browser](https://chrome.google.com/webstore/detail/ajhmfdgkijocedmfjonnpjfojldioehi)

- `ajhmfdgkijocedmfjonnpjfojldioehi`

Silk or Privacy Pass has a chance of decreasing the amount of captchas
especially from Cloudflare when "suspicious" traffic is detected.

To intentionally trigger it and what should be allowed in NoScript:

- https://captcha.website
- https://issuance.privacypass.cloudflare.com

### uBlock Origin

- `cjpalhdlnbpafiamejdnhcphjbkeiagm`

Blocked for Ad Nauseam

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

The password manager of my choice.

### [Privacy Badger](https://chrome.google.com/webstore/detail/pkehgijcmpdhfbdbbnkijodmdjhbjlgp)

- `pkehgijcmpdhfbdbbnkijodmdjhbjlgp`

Configured to learn locally and also in incognito as opposed to only relying
on vendor list. Also not display the "Welcome to Privacy Badger screen".

See also:

- https://github.com/EFForg/privacybadger/blob/master/doc/admin-deployment.md
- https://github.com/EFForg/privacybadger/blob/master/src/data/schema.json

## `black-theme-colour.json`

Sets the theme colour as black. This is managed instead of recommended,
because even the recommended policy seems to block theme changing.

## `brave-shields-disabled.json`

Allowlist for sites where I think Brave Shields may be breaking things. Similar is also in
`aminda-extensions.json` for Privacy Badger.

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

## `doh-cloudflare-secure.json`

Sets Cloudflare with malware protection as the forced DNS-over-HTTPS server.

## `doh-unlocked-unset.json`

If no DNS over HTTPS policy is used, this unlocks the setting. Enabling managed policies disable it by default.

My other `doh-*.json` set this as well, because `secure` doesn't allow
downgrade to system resolver and Chromium seems somewhat unreliable with it often reporting
`DNS_PROBE_POSSIBLE` and while this occassionally disables ECH, it works and
my system resolvers are encrypted. I hope they will implement ECH with system
resolver soon to fix this.

## `doh-dns0.json`

Simply forces DNS-over-HTTPS with DNS0.eu.

## `doh-mullvad-base.json`

Forces DNS-over-HTTPS with Mullvad Base, which features ad, malware & tracker blocking.

- https://mullvad.net/en/help/dns-over-https-and-dns-over-tls#specifications

## `doh-quad9-ecs.json`

Forces DNS over HTTPS with Quad9 ECS enabled threat-blocking server and also contains
their alternative port.

## `doh-quad9-insecure-ecs.json.badidea`

Forces DNS over HTTPS with Quad9 ECS enabled unfiltered server and also contains
their alternative port. **No DNSSEC either.**

## `doh-quad9-insecure.json.badidea`

Forces DNS over HTTPS with Quad9 unfiltered server and also contains
their alternative port. **No DNSSEC either.**

## `doh-quad9.json`

Forces DNS over HTTPS with Quad9 threat-blocking server and also contains
their alternative port.

## `enable-ech-ocsp.json`

Enables encrypted client hello (ECH) and Online Certificate Status Protocol
(OCSP)/Certificate Revocation List (CRL) checks.

However ECH requires `"DnsOverHttpsMode": "secure"` which will break things
(and thus my files don't enable it),
or it will occassionally get disabled (I hope they implement it with system
resolver soon).

## `enable-labs.json`

Enables the beaker button "Experiments" for easier management than `about:flags`.

## `fix-edge-search.json`

Tells Microsoft Edge to redirect queries from new tab search box to URL bar
effectively forcing it to respect user configured search engine instead of
stealthily sending those queries to Bing.

## `force-incognito.json.badidea`

Forces incognito mode. I don't recommend this.

## `https-everywhere.json`

Enforces https and attempts to upgrade http to https.

## `README.md`

You are reading this file, are you not?
