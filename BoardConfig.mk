TARGET_NO_BOOTLOADER := true

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

BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2

BOARD_KERNEL_BASE := 0x40080000
BOARD_KERNEL_OFFSET := 0
BOARD_KERNEL_PAGESIZE := 2048
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE := 524288000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3253731328
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11633933824
BOARD_HAS_NO_SELECT_BUTTON := true

TW_THEME := portrait_hdpi

TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/recovery.fstab

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/amazon/karnak
TARGET_KERNEL_CONFIG := lineageos_karnak_defconfig
TARGET_KERNEL_VARIANT_CONFIG := lineageos_karnak_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := $(shell pwd)/prebuilts/linaro/linux-x86/aarch64/aarch64-linux-gnu/bin/aarch64-linux-gnu-
TARGET_KERNEL_CLANG_COMPILE := false
TARGET_KERNEL_OPTIONAL_LD := true
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00000000 --ramdisk_offset 0x03400000 --second_offset 0x00e80000 --tags_offset 0x07f80000
# original - not enough space for us!
# BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00000000 --ramdisk_offset 0x03f80000 --second_offset 0x00e80000 --tags_offset 0x07f80000

TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone2/temp

TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_INCLUDE_CRYPTO := true
TW_CRYPTO_USE_SYSTEM_VOLD := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_DEFAULT_BRIGHTNESS := 128

TW_AMONET := true
TW_HACKED_BL_BUTTON := true
TW_DEFAULT_BACKUP_LIST := "/system_image;/vendor_image;/data;/boot;"
