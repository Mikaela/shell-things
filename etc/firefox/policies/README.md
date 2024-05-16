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
- [General warning](#general-warning)
- [Extensions](#extensions)
  - [Privacy Badger](#privacy-badger)
    - [Duplicate](#duplicate)
- [Search engines](#search-engines)
- [Useful looking things for the future](#useful-looking-things-for-the-future)
  - [Certificate installations](#certificate-installations)
- [Things that look useful, but aren't](#things-that-look-useful-but-arent)
  - [WebSiteFilter](#websitefilter)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!-- prettier-ignore-end -->
<!-- editorconfig-checker-enable -->

## WARNING TO LIBREWOLF USERS

This file takes priority over
`/usr/share/librewolf/distribution/policies.json` so don't apply this or
a lot of LibreWolf specific customizations stops being in force.

## General warning

This is meant for me and devices I maintain for self-dogfooding so there are
opinions. Including those Firefox won't accept and will appear as warnings or
errors in `about:config` depending on the release channel or even all of them.

## Extensions

They are mostly self-explanatory.

### Privacy Badger

- `jid1-MnnxcxisBPnSXQ-eff@jetpack` - Downloaded directly from EFF.

Configured to learn locally and also in incognito as opposed to only relying
on vendor list. Also not display the "Welcome to Privacy Badger screen".

See also:

- https://github.com/EFForg/privacybadger/blob/master/doc/admin-deployment.md
- https://github.com/EFForg/privacybadger/blob/master/src/data/schema.json

#### Duplicate

```diff
-      "jid1-MnnxcxisBPnSXQ-eff@jetpack": {
-        "install_url": "https://www.eff.org/files/privacy-badger-latest.xpi",
+      "jid1-MnnxcxisBPnSXQ@jetpack": {
+        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi",
```

The EFF.org version won't sync and if you sync with unmanaged computer, you
will have two PrivacyBadgers. Congratulations?

## Search engines

> Policy SearchEngines is only allowed on ESR.

But who cares? Anyway thus DuckDuckGo extension is installed by default so
when testing this policy I won't have to see Google.

Additionally it's a lie since at least Nightly reads it too without
complaining.

## Useful looking things for the future

### Certificate installations

In the `certificates` section

```json
{
  "Install": ["my_certificate_here.pem"]
}
```

## Things that look useful, but aren't

### WebSiteFilter

```json
{
  "policies": {
    "WebsiteFilter": {
      "Block": ["<all_urls>"],
      "Exceptions": ["http://example.org/*"]
    }
  }
}
```

Ok, nice, but my policy is already forcing AdNauseam which enforces my
blocklist which is more practical.

Granted users can use private browsing mode to get past it, but I am not
blocking actively malicious domains.
