My dracut configuration files mainly for generating unified kerneil images
(uki).

<!-- editorconfig-checker-disable -->
<!-- prettier-ignore-start -->

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [WARNING!](#warning)
  - [hostonly](#hostonly)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!-- prettier-ignore-end -->
<!-- editorconfig-checker-enable -->

# WARNING!

Sedric has a 96M EFI partition courtesy of Windows and thus it has a lot of
attempts for decreasing the kernel size. Since moving it to UKI, I am yet to
go through what of it is actually useful and worth keeping around and at least
disabling recovery seems dangerous if I can save space by omitting somnething
else.

## hostonly

Will make a UKI specific to the current hardware and is discouraged as it will
obviously prevent booting on a different hardware and hardware changes may
render the system unbootable. However I am more of a software person, so I
imagine that is unlikely to happen for me.

If planning hardware changes, maybe disable this flag? Or maybe if you have
infinite space for kernel, keep it off?
