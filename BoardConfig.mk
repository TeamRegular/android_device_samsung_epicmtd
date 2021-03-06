# Samsung Epic4G compile definitions.

# Set this up here so that BoardVendorConfig.mk can override it
BOARD_USES_GENERIC_AUDIO := false

BOARD_USES_LIBSECRIL_STUB := true

# Use the non-open-source parts, if they exist
-include vendor/samsung/epicmtd/BoardConfigVendor.mk

# Processor optimizations
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a8
TARGET_CPU_VARIANT := cortex-a8

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOARD_PLATFORM := s5pc110
TARGET_BOARD_PLATFORM_GPU := POWERVR_SGX540_120
TARGET_BOOTLOADER_BOARD_NAME := s5pc110

TARGET_ARCH_LOWMEM := true

# Provide our own libaudio
TARGET_PROVIDES_LIBAUDIO := true

# Releasetools
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/samsung/epicmtd/releasetools/epicmtd_ota_from_target_files
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./device/samsung/epicmtd/releasetools/epicmtd_img_from_target_files

# Camera defines
USE_CAMERA_STUB := false
ifeq ($(USE_CAMERA_STUB),false)
BOARD_SECOND_CAMERA_DEVICE := true
BOARD_CAMERA_LIBRARIES := libcamera
endif
ICS_CAMERA_BLOB := true
BOARD_CAMERA_HAVE_ISO := true

# OpenGL stuff
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/samsung/epicmtd/prebuilt/etc/egl.cfg
BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/epicmtd/recovery/graphics.c
BOARD_USE_SKIA_LCDTEXT := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/epicmtd/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/epicmtd/bluetooth/vnd_epicmtd.txt

# Video Devices
BOARD_USES_OVERLAY := true
BOARD_V4L2_DEVICE := /dev/video1
BOARD_CAMERA_DEVICE := /dev/video0
BOARD_SECOND_CAMERA_DEVICE := /dev/video2

# Max image/partition sizes
BOARD_BOOTIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x00280000)
BOARD_RECOVERYIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x00500000)
BOARD_SYSTEMIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x07500000)
BOARD_USERDATAIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x04ac0000)
# The size of a block that can be marked bad.
BOARD_FLASH_BLOCK_SIZE := 131072

# Kernel defines
BOARD_NAND_PAGE_SIZE := 4096 -s 128
BOARD_KERNEL_BASE := 0x02e00000
BOARD_KERNEL_CMDLINE := console=ttyFIQ0,115200 init=/init no_console_suspend
BOARD_KERNEL_PAGESIZE := 4096

# hwcomposer: custom vsync ioctl
BOARD_CUSTOM_VSYNC_IOCTL := true

# Define kernel config for inline building
TARGET_KERNEL_CONFIG := cyanogenmod_epicmtd_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/epicmtd/

# Fallback
TARGET_PREBUILT_KERNEL := device/samsung/epicmtd/kernel

# WIFI defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WLAN_DEVICE_REV       := bcm4329
WIFI_DRIVER_MODULE_NAME     := "bcmdhd"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"

# USB MTP / UMS
SAMSUNG_USB_MTP_DEVICE := true
BOARD_UMS_LUNFILE := /sys/class/android_usb/android0/f_mass_storage/lun/file
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/s3c-usbgadget/gadget/lun%d/file"

# Recovery
BOARD_RECOVERY_HANDLES_MOUNT := true
BOARD_USES_BML_OVER_MTD := true
BOARD_CUSTOM_RECOVERY_KEYMAPPING:= ../../device/samsung/epicmtd/recovery_ui.c
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/epicmtd/shbootimg.mk
TARGET_RECOVERY_FSTAB := device/samsung/epicmtd/fstab.victory
RECOVERY_FSTAB_VERSION := 2
TARGET_OTA_ASSERT_DEVICE := epic,epicmtd,SPH-D700

# RIL
BOARD_RIL_CLASS := "../../../device/samsung/epicmtd/epicril/"

# Charging mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/charging_mode_booting

# Suspend in charger to disable capacitive keys
BOARD_CHARGER_ENABLE_SUSPEND := true

BOARD_SEPOLICY_DIRS := \
        device/samsung/epicmtd/sepolicy

BOARD_SEPOLICY_UNION := \
	device.te \
	domain.te \
	file_contexts \
	file.te \
	init.te \
	pvrsrvinit.te \
	rild.te \
	system.te \
	wimax.te \
	wpa_supplicant.te

# Hardware tunables
BOARD_HARDWARE_CLASS := device/samsung/epicmtd/cmhw/

#TWRP
# TWRP 2 details
DEVICE_RESOLUTION := 480x800
TW_INCLUDE_INJECTTWRP := true
TW_NO_REBOOT_BOOTLOADER := true
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_DEFAULT_EXTERNAL_STORAGE := true
HAVE_SELINUX := true
TWRP_CUSTOM_KEYBOARD := ../../../device/samsung/epicmtd/recovery/hardwarekeyboard.cpp
