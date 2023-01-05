################################################################################
#
# rnnnoise-ladspa
#
################################################################################

RNNNOISE_LADSPA_VERSION = c1cf4307c75abed8e3ecccdd23a35f7782feaf69
RNNNOISE_LADSPA_SITE = $(call github,werman,noise-suppression-for-voice,$(RNNNOISE_LADSPA_VERSION))
RNNNOISE_LADSPA_LICENSE = Apache License 2.0

RNNNOISE_LADSPA_INSTALL_STAGING = YES
RNNNOISE_LADSPA_DEPENDENCIES = host-pkgconf
RNNNOISE_LADSPA_SUPPORTS_IN_SOURCE_BUILD = NO

RNNNOISE_LADSPA_CONF_OPTS = \
	-DBUILD_LADSPA_PLUGIN=ON \
	-DBUILD_VST_PLUGIN=OFF \
	-DBUILD_VST3_PLUGIN=OFF \
	-DBUILD_LV2_PLUGIN=OFF \
	-DBUILD_AU_PLUGIN=OFF \
	-DBUILD_AUV3_PLUGIN=OFF

$(eval $(cmake-package))
