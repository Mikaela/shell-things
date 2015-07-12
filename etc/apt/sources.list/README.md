sources.list files for Ubuntu and Debian
========================================

The files have been named so they are easily to fetch with script,
`lsb_release -sr` returns release e.g. `14.04` or `testing` and
`lsb_release -rc` returns codename e.g. `jessie`.

`mirrors.ubuntu.com/mirrors.txt` and `httpredir.debian.org` are used so
the files work everywhere and the nearest mirrors are always used no matter
where you are.

Which script to use?

* `install` for Ubuntu and Debian testing/unstable.
    * If you run `ìnstall` on Debian Stable, sources.list will say
      `stable` and when new Debian becomes stable apt wants to
      upgrade to it directly and that can be dangerous.
* `install.debian` for not-rolling Debian.
