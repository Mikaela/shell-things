echo off
echo Disable IPv6 address randomization? Recommended for all devices.
pause
netsh interface ipv6 set global randomizeidentifiers=disabled store=active
netsh interface ipv6 set global randomizeidentifiers=disabled store=persistent
pause
echo on