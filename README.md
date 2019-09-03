## How-to compile it:

To build:

```sh
. build/envsetup.sh
lunch omni_NX609J-eng
make recoveryimage
```

TO flash

```sh
fastboot oem nubia_unlock NUBIA_NX609J
fastboot flash recovery recovery.img
```

NOTE: To build with system-as-root support,
uncomment the 'BOARD_BUILD_SYSTEM_ROOT_IMAGE := true'
line in BoardConfig.mk