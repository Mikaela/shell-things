<!-- @format -->

# yum/dnf repositories

This directory is still read by `dnf` and contains files for repositories that
I appear to end up adding on every system that aren't as clear to add as the
links below.

## Additional repositories

- Begin by `sudo fedora-third-party enable`
- `sudo dnf copr enable neilalexander/yggdrasil-go`
  - https://yggdrasil-network.github.io/installation-linux-rpm.html
- `sudo dnf config-manager --add-repo https://rpm.librewolf.net/librewolf-repo.repo`
  - https://librewolf.net/installation/fedora/
- `sudo dnf config-manager --add-repo https://repository.mullvad.net/rpm/stable/mullvad.repo`
  - https://mullvad.net/en/help/install-mullvad-app-linux#fedora
- https://www.insynchq.com/
- https://keybase.io/docs/the_app/install_linux
- https://rpmfusion.org/Configuration
