echo off

echo Set Time Servers?
pause

w32tm /config /syncfromflags:manual /manualpeerlist:"time.cloudflare.com nts.netnod.se time.mikes.fi pool.ntp.org"

pause
echo on
