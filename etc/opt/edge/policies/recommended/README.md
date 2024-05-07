# Microsoft Edge recommended policies

<!-- editorconfig-checker-disable -->
<!-- prettier-ignore-start -->

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Fedora?](#fedora)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!-- prettier-ignore-end -->
<!-- editorconfig-checker-enable -->

Because apparently Microsoft is so allergic to Chrome, despite being based on
Chromium that they have to rewrite `chrome://` into `edge://` without handling
automatic redirect from the former, so my policy for apps as new page breaks
and suggests opening _Firefox Developer Edition_ for whatever reason.

Thus separate recommended profiles for Microsoft Edge, just so this one is
fixed.

**_Don't expect this directory to be updated, I will probably forget it
myself._**

## Fedora?

```bash
# Removes all three versions of Microsoft Edge from the system.
sudo dnf remove -y microsoft-edge-{stable,beta,dev}
# Remove all three Microsoft Edge repositories
rm -rv /etc/yum.repos.d/microsoft-edge{,-beta,-dev}.repo
# Removes the crontab entries to restore the above, if they didn't get removed
# already.
rm -v /etc/cron.daily/microsoft-edge{,-beta,-dev}
```
