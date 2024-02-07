# Chromium policies

<!-- editorconfig-checker-disable -->
<!-- prettier-ignore-start -->

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [`aminda-extensions.json`](#aminda-extensionsjson)
  - [Dark Reader](#dark-reader)
  - [Privacy Manager](#privacy-manager)
  - [Fedora User Agent](#fedora-user-agent)
  - [Bitwarden](#bitwarden)
  - [Privacy Badger](#privacy-badger)
- [`dns0.json`](#dns0json)
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

### Dark Reader

- `eimadpbcbfnmbkopoojfekhnkhdbieeh`

As playing around with these policies and constantly removing the profile directory doesn't help my migraine.

### Privacy Manager

- `giccehglhacakcfemddmfhdkahamfcmd`

Quick browser options and data removal on _startup_. Maybe beneficial if
incognito is disabled (which again is not great idea for quick guest access?)

### Fedora User Agent

Communicates websites that Ubuntu isn't the only Linux distribution and makes
some offer rpm packages directly.

- `hojggiaghnldpcknpbciehjcaoafceil`

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

## `dns0.json`

Simply enables DNS-over-HTTPS with DNS0.eu

## `https-everywhere.json`

Enforces https and attempts to upgrade http to https.
