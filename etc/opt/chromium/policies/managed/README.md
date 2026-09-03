<!-- @format -->

# Chromium policies

- https://chromeenterprise.google/policies/

<!-- editorconfig-checker-disable -->
<!-- prettier-ignore-start -->

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [`amber-theme-colour.json.sample`](#amber-theme-colourjsonsample)
- [`aminda-extensions.json`](#aminda-extensionsjson)
- [`black-theme-colour.json.sample`](#black-theme-colourjsonsample)
- [`brave-shields-disabled.json`](#brave-shields-disabledjson)
- [`disable-brave-ipfs.json`](#disable-brave-ipfsjson)
- [`disable-brave-rewards-wallet.json`](#disable-brave-rewards-walletjson)
- [`disable-brave-tor.json`](#disable-brave-torjson)
- [`disable-brave-vpn.json`](#disable-brave-vpnjson)
- [`disable-floc.json`](#disable-flocjson)
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
- [`profilemanager.json`](#profilemanagerjson)
- [`README.md`](#readmemd)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!-- prettier-ignore-end -->
<!-- editorconfig-checker-enable -->

## `amber-theme-colour.json.sample`

Automatically generated theme colour based on "amber" (`#ffb700`), it looks
kind of fancy, but doesn't feel like it's for me.

## `aminda-extensions.json`

Automatic installations of extensions I want to have installed alongside their
configuration if any.

## `black-theme-colour.json.sample`

Sets the theme colour as black. This is managed instead of recommended,
because even the recommended policy seems to block theme changing.

`.sample` suffix is there so maybe I will stop applying this policy and thus
disabling GTK/Qt themes.

## `brave-shields-disabled.json`

Allowlist for sites where I think Brave Shields may be breaking things.
Similar is also in `aminda-extensions.json` for Privacy Badger.

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

## `doh-quad9-ecs.json`

Forces DNS over HTTPS with Quad9 ECS enabled threat-blocking server and also
contains their alternative port.

## `doh-quad9.json`

Forces DNS over HTTPS with Quad9 threat-blocking server and also contains
their alternative port.

## `doh-unlocked-unset.json`

Allows configuring DoH even with managed policies present (unless another DoH
rule is in force) since enabling any managed policy will otherwise gray out
the option.

If no DNS over HTTPS policy is used, this unlocks the setting. Enabling
managed policies disable it by default.

My other `doh-*.json` set this as well, because `secure` doesn't allow
downgrade to system resolver and Chromium seems somewhat unreliable with it
often reporting `DNS_PROBE_POSSIBLE` and while this occassionally disables
ECH, it works and my system resolvers are encrypted. I hope they will
implement ECH with system resolver soon to fix this.

## `edge-appsfavorites.json`

Edge apps in favorites bar.

## `edge-newtabapps.json`

Should enable apps in new tab page, although I am not seeing it.

## `edge-screenshots.json`

Explicitly enables screenshotting-

## `enable-chromecast.json`

Explicitly enables Chromecast support.

## `enable-labs.json`

Enables the beaker button "Experiments" for easier management than
`about:flags`.

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

## `profilemanager.json`

Forces the profile screen even with only one profile. I love the feature in
Firefox and want to see it here too, now that I accidentally noticed it.

## `README.md`

You are reading this file, are you not?
