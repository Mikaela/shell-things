Useful nginx files that I will probably need and which I will forget if I
cannot read them from here.

---

## FUTURE WARNING

These files may age badly, so here are some hopefully timeless pointers:

- Generate the config file with https://ssl-config.mozilla.org/ (and if
	time eats it, try https://github.com/mozilla/ssl-config-generator/ in
	hope of finding where it is now. \* Name it 00-something so it will be the first file read and make
	everything a different file.
- If using my acmesh-ssl.bash script, the files to fill should be like:

(the script runs `$ACMESH --key-file $NGINXDIR/key.pem --fullchain-file $NGINXDIR/cert.pem --reloadcmd "$SYSTEMCTLRESTART nginx"`)

- `ssl_certificate`, `ssl_trusted_certificate` are `cert.pem`
- `ssl_certificate_key` is `key.pem`

The header syntax is following, **_THIS LIKELY WON'T TIME WELL, ESPECIALLY CSP_**

```
	add_header Strict-Transport-Security "max-age=63072000; includeSubDomains" always;
	add_header X-Frame-Options "SAMEORIGIN" always;
	add_header Content-Security-Policy "block-all-mixed-content; default-src 'none'; form-action 'self'; connect-src 'self' ws: wss:; style-src 'self' https: 'unsafe-inline'; script-src 'self'; worker-src 'self'; child-src 'self'; manifest-src 'self'; font-src 'self' https:; media-src 'self' https:; img-src 'self' data: https://user-images.githubusercontent.com" always;
	add_header X-Content-Type-Options "nosniff" always;
	add_header Referrer-Policy "no-referrer" always;
```

The CSP comes from `HEAD "http://[::]:9000/#/chan-1"` to figure out what
TheLounge would be setting without a reverse proxy in front of it. `HEAD` is
in Debian package `libwww-perl`

- Refer to tester tools to see if the configuration is fine:
	- https://observatory.mozilla.org/
	- https://securityheaders.com/
	- https://www.ssllabs.com/ssltest/

---

## Arch

Remove the default server block and add to http block:

```
include /etc/nginx/conf.d/*.conf;
include /etc/nginx/sites-enabled/*;
```

PHP: todo. It has something to do with `php-fpm.sock` instead of
`php5-fpm.sock`, but that doesn't appear to be enough.
