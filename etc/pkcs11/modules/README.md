<!-- @format -->

Central configuration for PKCS#11 plugin using software and smartcards.

- https://digisaatio.fi/wiki/P11-kit
- https://www.systutorials.com/docs/linux/man/5-pkcs11.conf/

Remember also
[my FINEID notes in the gist/ repo](https://gitea.blesmrt.net/mikaela/gist/src/branch/master/fineid)

## libcryptoki.module

According to the manual (2nd link) the full path shouldn't be required, but
the 1st link disagrees and works for me, so thus
`module: /usr/lib64/libcryptoki.so` instead of `module: libcryptoki.so`.

Additionally the DVV card reader software does the management, so
`managed: no`.
