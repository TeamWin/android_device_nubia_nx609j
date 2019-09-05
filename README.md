## How-to compile it:

To build:

```sh
. build/envsetup.sh
lunch omni_nx609j-eng
make recoveryimage
```

TO flash

```sh
fastboot oem nubia_unlock NUBIA_NX609J
fastboot flash recovery recovery.img
```

NOTE: To build with system-as-root support,
replace 'omni_nx609j-eng' in your lunch command
with 'omni_nx609j_SAR-eng'.
All other commands remain the same.