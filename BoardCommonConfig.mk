#
# Copyright (C) 2012 The Android Open-Source Project
# Copyright (C) 2012 The CyanogenMod Project
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

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk

BOARD_USES_GENERIC_AUDIO := false

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
ifdef A20_SMP
   TARGET_CPU_SMP := true
   TARGET_ARCH := arm
   TARGET_ARCH_VARIANT := armv7-a-neon
   TARGET_ARCH_VARIANT_CPU := cortex-a7
   TARGET_CPU_VARIANT := cortex-a7
   ARCH_ARM_HAVE_NEON := true
   ARCH_ARM_HAVE_TLS_REGISTER := true
   TARGET_GLOBAL_CFLAGS += -O3 -mtune=cortex-a7 -mfpu=neon -mfloat-abi=softfp
   TARGET_GLOBAL_CPPFLAGS += -O3-mtune=cortex-a7 -mfpu=neon -mfloat-abi=softfp
else
   TARGET_CPU_SMP := false
   TARGET_ARCH := arm
   TARGET_ARCH_VARIANT := armv7-a-neon
   TARGET_ARCH_VARIANT_CPU := cortex-a8
   TARGET_CPU_VARIANT := cortex-a8
   ARCH_ARM_HAVE_NEON := true
   ARCH_ARM_HAVE_TLS_REGISTER := true
   TARGET_GLOBAL_CFLAGS += -O3 -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
   TARGET_GLOBAL_CPPFLAGS += -O3-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
endif
KBUILD_CFLAGS += -O3

BOARD_VENDOR := softwinner
TARGET_BOARD_PLATFORM := exDroid
TARGET_BOOTLOADER_BOARD_NAME := crane

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_TARGET_RC := true

BOARD_NAND_PAGE_SIZE := 4096
BOARD_NAND_SPARE_SIZE := 128
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_CMDLINE := console=ttyS0,115200 rw init=/init loglevel=8
TARGET_KERNEL_SOURCE := kernel/softwinner/sunxi/
ifdef A20_SMP
   TARGET_KERNEL_CONFIG := ../../../../../../device/softwinner/sunxi-common/config/a20_mid_defconfig
else
   TARGET_KERNEL_CONFIG := ../../../../../../device/softwinner/sunxi-common/config/a10_mid_defconfig
endif

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 296435456
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_FLASH_BLOCK_SIZE := 4096

# Releasetools
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/softwinner/sunxi-common/releasetools/sunxi_ota_from_target_files
#TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./device/softwinner/sunxi-common/releasetools/sunxi_img_from_target_files

# Hardware tunables
#BOARD_HARDWARE_CLASS := 

# Graphics
BOARD_EGL_CFG := device/softwinner/sunxi-common/configs/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_EGL_NEEDS_LEGACY_FB := true

# FIMG Acceleration
BOARD_USES_FIMGAPI := true
BOARD_USES_SKIA_FIMGAPI := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# HWComposer
BOARD_USES_HWCOMPOSER := true
BOARD_USE_SYSFS_VSYNC_NOTIFICATION := true

#OMX
#
# TO BE IMPLEMENTED...
#


# Audio
HAVE_HTC_AUDIO_DRIVER := true
BOARD_USES_GENERIC_AUDIO := true
COMMON_GLOBAL_CFLAGS += -DICS_AUDIO_BLOB

# RIL
BOARD_PROVIDES_LIBRIL := true

# Camera
# Will be added later
#
#

# Wifi stuff
# Will be added later
#
#

# Vold
BOARD_VOLD_MAX_PARTITIONS := 20
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
TARGET_USE_CUSTOM_LUN_FILE_PATH = "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"
TARGET_USE_CUSTOM_SECOND_LUN_NUM := 1

# Device specific headers
TARGET_SPECIFIC_HEADER_PATH := device/softwinner/sunxi-common/include
