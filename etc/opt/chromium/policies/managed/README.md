# Chromium policies

<!-- editorconfig-checker-disable -->
<!-- prettier-ignore-start -->

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [`aminda-extensions.json`](#aminda-extensionsjson)
  - [Silk - Privacy Pass Client for the browser](#silk---privacy-pass-client-for-the-browser)
  - [DuckDuckGo Privacy Essentials](#duckduckgo-privacy-essentials)
  - [Dark Reader](#dark-reader)
  - [Privacy Manager](#privacy-manager)
  - [Fedora User Agent](#fedora-user-agent)
  - [Snowflake](#snowflake)
  - [Bitwarden](#bitwarden)
  - [Privacy Badger](#privacy-badger)
- [`disable-floc.json`](#disable-flocjson)
- [`disable-incognito.json`](#disable-incognitojson)
- [`doh-automatic.json`](#doh-automaticjson)
- [`doh-dns0.json`](#doh-dns0json)
- [`enable-ech-ocsp.json`](#enable-ech-ocspjson)
- [`enable-home-labs.json`](#enable-home-labsjson)
- [`force-incognito.json`](#force-incognitojson)
- [`https-everywhere.json`](#https-everywherejson)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!-- prettier-ignore-end -->
<!-- editorconfig-checker-enable -->

## `aminda-extensions.json`

As I cannot separate the keys to multiple files I am forced to keep them in
one and separate by what the file does, `aminda-extensions.json` is unlikely
to overlap with someone else.

Changing `normal_installed` to `force_installed` would also prevent
uninstallation.

### Silk - Privacy Pass Client for the browser

- `ajhmfdgkijocedmfjonnpjfojldioehi`

Silk or Privacy Pass has a chance of decreasing the amount of captchas
especially from Cloudflare when "suspicious" traffic is detected.

### DuckDuckGo Privacy Essentials

- `bkdgflcldnnnapblkhphbgpggdiikppg`

Installed by default so Google won't be the default search engine.

### Dark Reader

- `eimadpbcbfnmbkopoojfekhnkhdbieeh`

As playing around with these policies and constantly removing the profile directory doesn't help my migraine.

### Privacy Manager

- `giccehglhacakcfemddmfhdkahamfcmd`

Quick browser options and data removal on _startup_. Maybe beneficial if
incognito is disabled (which again is not great idea for quick guest access?)

### Fedora User Agent

- `hojggiaghnldpcknpbciehjcaoafceil`

Communicates websites that Ubuntu isn't the only Linux distribution and makes
some offer rpm packages directly.

### Snowflake

- `mafpmfcccpbjnhfhjnllmmalhifmlcie`

Helps bridge traffic to Tor by looking like WebRTC call.

### Bitwarden

- `nngceckbapebfimnlniiiahkandclblb`

The password manager of my choice.

### Privacy Badger

- `pkehgijcmpdhfbdbbnkijodmdjhbjlgp`

Configured to learn locally and also in incognito as opposed to only relying
on vendor list. Also not display the "Welcome to Privacy Badger screen".

See also:

- https://github.com/EFForg/privacybadger/blob/master/doc/admin-deployment.md
- https://github.com/EFForg/privacybadger/blob/master/src/data/schema.json

## `disable-floc.json`

Disables floc or ad topics that are against privacy.

- https://start.duckduckgo.com/?q=google+floc+privacy+topics

## `disable-incognito.json`

Disables incognito mode. I don't recommend this.

## `doh-automatic.json`

If no DNS over HTTPS policy is used, this unlocks the setting. Enabling managed policies disable it by default.

Incompatible with any actual DoH policy.

## `doh-dns0.json`

Simply enables DNS-over-HTTPS with DNS0.eu

## `enable-ech-ocsp.json`

Enables encrypted client hello and OCSP (or CRL?) checks.

## `enable-home-labs.json`

Enables home button and access to labs by default.

## `force-incognito.json`

Forces incognito mode. I don't recommend this.

## `https-everywhere.json`

Enforces https and attempts to upgrade http to https.
