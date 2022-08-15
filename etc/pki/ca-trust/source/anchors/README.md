Fedora & SailfishOS: drop `.pem` files of root certificates here and
`sudo update-ca-trust`.

Debian & co: drop `.crt` to `/usr/local/share/ca-certificates/extra/`
(create if doesn't exist, `/extra/` may be anything) and run `sudo update-ca-certificates`
