`sshd_config` should include something like

```
Include /etc/ssh/sshd_config.d/*.conf
```

NOTE: This became supported only at OpenSSHd 8.2 on 2020-02-14.
https://www.openssh.com/txt/release-8.2

NOTE also that the first time an option is specified wins.

## See also

https://infosec.mozilla.org/guidelines/openssh
