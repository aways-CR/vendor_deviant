PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/deviant/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/deviant/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/deviant/prebuilt/common/bin/50-slim.sh:system/addon.d/50-slim.sh

# DEVIANT-specific init file
PRODUCT_COPY_FILES += \
    vendor/deviant/prebuilt/common/etc/init.local.rc:root/init.slim.rc

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/deviant/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    vendor/deviant/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/deviant/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache

# Audio Config for DSPManager
PRODUCT_COPY_FILES += \
    vendor/deviant/prebuilt/common/vendor/etc/audio_effects.conf:system/vendor/etc/audio_effects.conf
#LOCAL SLIM CHANGES  - END

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/deviant/prebuilt/common/etc/mkshrc:system/etc/mkshrc \
    vendor/deviant/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

PRODUCT_COPY_FILES += \
    vendor/deviant/prebuilt/common/etc/init.d/00slim:system/etc/init.d/00slim \
    vendor/deviant/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
    vendor/deviant/prebuilt/common/etc/init.d/98tweaks:system/etc/init.d/98tweaks \
    vendor/deviant/prebuilt/common/etc/liberty.bsh:system/etc/liberty.bsh \
    vendor/deviant/prebuilt/common/etc/init_trigger.disabled:system/etc/init_trigger.disabled \
    vendor/deviant/prebuilt/common/bin/sysinit:system/bin/sysinit

PRODUCT_COPY_FILES += \
    vendor/deviant/prebuilt/common/etc/cron/cron.conf:system/etc/cron/cron.conf \
    vendor/deviant/prebuilt/common/etc/cron/cron.hourly/00drop_caches:system/etc/cron/cron.hourly/00drop_caches \
    vendor/deviant/prebuilt/common/etc/cron/cron.daily/00drop_caches:system/etc/cron/cron.daily/00drop_caches \
    vendor/deviant/prebuilt/common/etc/cron/cron.weekly/00drop_caches:system/etc/cron/cron.weekly/00drop_caches \
    vendor/deviant/prebuilt/common/etc/cron/cron.hourly/01clear_cache:system/etc/cron/cron.hourly/01clear_cache \
    vendor/deviant/prebuilt/common/etc/cron/cron.daily/01clear_cache:system/etc/cron/cron.daily/01clear_cache \
    vendor/deviant/prebuilt/common/etc/cron/cron.weekly/01clear_cache:system/etc/cron/cron.weekly/01clear_cache 

# Embed SuperUser
SUPERUSER_EMBEDDED := true

# Required packages
PRODUCT_PACKAGES += \
    Camera \
    Development \
    Email2 \
    Exchange2 \
    SpareParts \
    Superuser \
    su

# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    HoloSpiralWallpaper \
    NoiseField \
    Galaxy4 \
    LiveWallpapersPicker \
    PhaseBeam

# Extra Optional packages
PRODUCT_PACKAGES += \
    Apollo \
    audio_effects.conf \
    DeviantPapers \
    DSPManager \
    FileManager \
    FileManagerTests \
    LatinIME \
    libcyanogen-dsp \
    LockClock \
    Trebuchet

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs

PRODUCT_PACKAGE_OVERLAYS += vendor/deviant/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/deviant/overlay/common

# T-Mobile theme engine
include vendor/deviant/config/themes_common.mk

# Versioning System
PRODUCT_VERSION_MAJOR = 2.0
PRODUCT_VERSION_MINOR = beta-b2
PRODUCT_VERSION_MAINTENANCE =

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=JDQ39

PRODUCT_PROPERTY_OVERRIDES += \
    deviant.ota.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)

    ifdef DEVIANT_RELEASE
        DEVIANT_VERSION := DeviantXone-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-OFFICIAL
        DEVIANT_MOD_VERSION := DeviantXone-$(PRODUCT_RELEASE_NAME)-$(PRODUCT_VERSION_MAJOR)_$(PRODUCT_VERSION_MINOR)-OFFICIAL
    else
        DEVIANT_VERSION := DeviantXone-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date +"%Y%m%d")
        DEVIANT_MOD_VERSION := DeviantXone-$(PRODUCT_RELEASE_NAME)-$(PRODUCT_VERSION_MAJOR)_$(PRODUCT_VERSION_MINOR)-$(shell date +"%Y%m%d")
    endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.slim.version=$(DEVIANT_VERSION) \
    ro.modversion=$(DEVIANT_MOD_VERSION)
