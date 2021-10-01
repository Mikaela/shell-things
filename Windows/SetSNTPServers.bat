echo off

echo Set Time Servers?
pause

w32tm /config /syncfromflags:manual /manualpeerlist:"time.cloudflare.com nts.netnod.se time.mikes.fi 0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org"

pause
echo on
