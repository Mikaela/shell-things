<!-- @format -->

# Upgrading Windows 10 to Windows 11 on unsupported systems

## WARNING

- READ FIRST:
  [Microsoft: Installing Windows 11 on devices that don't meet minimum system requirements](https://support.microsoft.com/windows/installing-windows-11-on-devices-that-don-t-meet-minimum-system-requirements-0b2dc4a2-5933-4ad4-9c09-ef0a331518f1)

This is not supported by Microsoft, most of the methods listed here didn't
work for me on the first system I updated, Windows is not my primary operating
system and my Windows was in factory reset state so it not working won't
affect me.

## What works

Sedric, Tassu and Zaldaryn have no TPM or currently supported CPU, while the
health check app says they are only two to six years old.

- https://github.com/AveYo/MediaCreationTool.bat

## Registry files here

I think the first method is likely the best, but I cannot rule these working
on another system out yet. They didn't work on my first system tried.

- `00-AllowUpgradesWithUnsupportedTPMOrCPU.reg` - the official Microsoft
  recommendation and the only one that should be used. If after reboot nothing
  happens, maybe try the rest rebooting every failure.
  - https://support.microsoft.com/windows/windows-11-n-asentaminen-e0edbbfb-cfc5-4011-868b-2ce77ac7c70e
- `01-LabConfig.reg` - widely reported to work
- `01-Setup.reg` - ^
- `02-DevRing.reg` - after joining the Insider program, this should enforce
  joining to Dev ring which should offer Windows 11 instantly. It may be
  advisable to leave after successful update.
