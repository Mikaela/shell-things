# Firefox `policies.json`

- https://mozilla.github.io/policy-templates/

The file is pretty self-explanatory, but I prefer Chromium way of handling
enterprise policies since it allows me to cut them to multiple different files
per whatever I am doing.

<!-- editorconfig-checker-disable -->
<!-- prettier-ignore-start -->

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [WARNING TO LIBREWOLF USERS](#warning-to-librewolf-users)
- [Extensions](#extensions)
  - [Privacy Badger](#privacy-badger)
- [Search engines](#search-engines)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!-- prettier-ignore-end -->
<!-- editorconfig-checker-enable -->

## WARNING TO LIBREWOLF USERS

This file takes priority over
`/usr/share/librewolf/distribution/policies.json` so don't apply this or
a lot of LibreWolf specific customizations stops being in force.

## Extensions

They are mostly self-explanatory.

### Privacy Badger

- `jid1-MnnxcxisBPnSXQ-eff@jetpack` - Downloaded directly from EFF.

Configured to learn locally and also in incognito as opposed to only relying
on vendor list. Also not display the "Welcome to Privacy Badger screen".

See also:

- https://github.com/EFForg/privacybadger/blob/master/doc/admin-deployment.md
- https://github.com/EFForg/privacybadger/blob/master/src/data/schema.json

## Search engines

> Policy SearchEngines is only allowed on ESR.

But who cares? Anyway thus DuckDuckGo extension is installed by default so
when testing this policy I won't have to see Google.

Additionally it's a lie since at least Nightly reads it too without
complaining.
