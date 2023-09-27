# systemd-timesyncd source configuration

For more information about the time servers, refer to their websites or
`../../chrony/sources.d` which comes with more detailed comments. Chrony
is my preferred NTP client/server, but SteamOS happens to come with
systemd-timesyncd enabled and using the pool.ntp.org, so I had to revive this
at least partially.

It looks like multiple files can be used simultaneously judging by
`timedatectl show-timesync`
