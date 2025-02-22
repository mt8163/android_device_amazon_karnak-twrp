#
# Copyright 2023 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

DEVICE_PATH := device/amazon/karnak

TARGET_BOARD_PLATFORM := mt8163

# Architecture
TARGET_ARCH := arm
TARGET_CPU_VARIANT := cortex-a7
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a7
TARGET_CPU_VARIANT:= cortex-a7
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true

TARGET_USES_64_BIT_BINDER := true

# Bootloader
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_BASE := 0x40080000
BOARD_KERNEL_OFFSET := 0
BOARD_KERNEL_PAGESIZE := 2048

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE := 524288000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3253731328
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11633933824
BOARD_HAS_NO_SELECT_BUTTON := true

TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/recovery.fstab

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/amazon/karnak
TARGET_KERNEL_CONFIG := lineageos_karnak_defconfig
TARGET_KERNEL_VARIANT_CONFIG := lineageos_karnak_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := $(shell pwd)/prebuilts/linaro/linux-x86/aarch64/aarch64-linux-gnu/bin/aarch64-linux-gnu-
TARGET_KERNEL_CLANG_COMPILE := false
TARGET_KERNEL_OPTIONAL_LD := true
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

LZMA_RAMDISK_TARGETS := recovery
BOARD_RAMDISK_USE_LZMA := true

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor

BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00000000 --ramdisk_offset 0x03400000 --second_offset 0x00e80000 --tags_offset 0x07f80000

#TWRP Build Specific Flags
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone2/temp
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_INCLUDE_CRYPTO := true
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_DEFAULT_BRIGHTNESS := 128
TW_AMONET := true
TW_EXCLUDE_APEX := true
TW_HACKED_BL_BUTTON := true
TW_DEFAULT_BACKUP_LIST := "/system_image;/vendor_image;/data;/boot;"
ALLOW_MISSING_DEPENDENCIES=true
