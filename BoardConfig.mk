# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# OEM Info
BOARD_VENDOR := nubia

# Default device path
LOCAL_PATH := device/$(BOARD_VENDOR)/$(TARGET_DEVICE)

# Assert
TARGET_OTA_ASSERT_DEVICE := $(shell echo $(TARGET_DEVICE) | tr  '[:lower:]' '[:upper:]')

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8998
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Platform
TARGET_BOARD_PLATFORM := $(shell echo $(TARGET_BOOTLOADER_BOARD_NAME) | tr  '[:upper:]' '[:lower:]')
TARGET_BOARD_PLATFORM_GPU := qcom-adreno540

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Kernel
BOARD_KERNEL_CMDLINE := \
    androidboot.configfs=true \
    androidboot.hardware=qcom \
    androidboot.selinux=permissive \
    androidboot.usbcontroller=a800000.dwc3 \
    ehci-hcd.park=3 \
    lpm_levels.sleep_disabled=1 \
    msm_rtb.filter=0x37 \
    sched_enable_hmp=1 \
    sched_enable_power_aware=1 \
    service_locator.enable=1 \
    swiotlb=2048 \
    user_debug=31
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x01000000
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/$(BOARD_KERNEL_IMAGE_NAME)

# Keymaster 3
TARGET_HW_DISK_ENCRYPTION := true
BOARD_USES_QCOM_DECRYPTION := true

# Android version & Security Patch Level
# Default TWRP Values
PLATFORM_VERSION := 16.1.0
PLATFORM_SECURITY_PATCH := 2099-12-31

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3758096384
BOARD_USERDATAIMAGE_PARTITION_SIZE := 121497399296
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Filesystem
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# TWRP Build Flags
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
BOARD_FIX_NUBIA_OTA := true
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_IGNORE_MISC_WIPE_DATA := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := false
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_NEW_ION_HEAP := true
TW_NO_USB_STORAGE := true
TW_OVERRIDE_SYSTEM_PROPS := "ro.build.fingerprint"
TARGET_RECOVERY_DEVICE_MODULES := android.hidl.base@1.0
TW_RECOVERY_ADDITIONAL_RELINK_FILES := $(OUT)/system/lib64/android.hidl.base@1.0.so
#TW_USE_TOOLBOX := true

# TWRP Debug Flags
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(OUT)/system/bin/debuggerd
