Useful nginx files that I will probably need and which I will forget if I
cannot read them from here.

## Manjaro

Remove the default server block and add to http block:

```
include /etc/nginx/conf.d/*.conf;
include /etc/nginx/sites-enabled/*;
```

PHP: todo. It has something to do with `php-fpm.sock` instead of
`php5-fpm.sock`, but that doesn't appear to be enough.
