# Chromium recommended policies

- https://chromeenterprise.google/policies/

<!-- editorconfig-checker-disable -->
<!-- prettier-ignore-start -->

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [`apps-as-homepage.json`](#apps-as-homepagejson)
- [`brave-search.json`](#brave-searchjson)
- [`disable-default-browser-check.json`](#disable-default-browser-checkjson)
- [`duckduckgo.json`](#duckduckgojson)
- [`ecosia.json`](#ecosiajson)
- [`enable-google-safebrowsing.json`](#enable-google-safebrowsingjson)
- [`enable-google-safebrowsing-less-private.json.sample`](#enable-google-safebrowsing-less-privatejsonsample)
- [`enable-home.json`](#enable-homejson)
- [`no-bookmarks-bar.json`](#no-bookmarks-barjson)
- [`README.md`](#readmemd)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!-- prettier-ignore-end -->
<!-- editorconfig-checker-enable -->

## `apps-as-homepage.json`

Sets the new tab page to `chrome://apps` and homepage as the new tab page.
However regardless of allowing the user to change homepage, the new tab page
won't change.

## `brave-search.json`

Sets and displays recommendation on the use of search.brave.com as a search engine by default.

## `disable-default-browser-check.json`

Disables checking whether the browser is set as default, but due to being a
suggested policy, allows the user to set as default in browser settings.

## `duckduckgo.json`

Sets and displays recommendation on the use of start.duckduckgo.com as a search engine by default.

## `ecosia.json`

Sets and displays recommendation on the use of Ecosia as a search engine by default.

## `enable-google-safebrowsing.json`

Enforces Google Safe Browsing in standard mode. For advanced mode and
sending data to Google, increase to 2 or see the sample below.

## `enable-google-safebrowsing-less-private.json.sample`

This would enable Google Safebrowsing and send additional data to Google
including downloads etc.

## `enable-home.json`

Enables home button by default.

## `no-bookmarks-bar.json`

Hides bookmarks bar by default. I just dislike it greatly.

## `README.md`

You are reading this file, are you not?
