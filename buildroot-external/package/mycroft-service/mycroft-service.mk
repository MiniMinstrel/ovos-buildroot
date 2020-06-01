################################################################################
#
# mycroft-service
#
################################################################################

MYCROFT_SERVICE_VERSION = 0.1.0
MYCROFT_SERVICE_SITE = $(BR2_EXTERNAL_MYCROFTOS_PATH)/package/mycroft-service
MYCROFT_SERVICE_SITE_METHOD = local
MYCROFT_SERVICE_LICENSE = Apache License 2.0
MYCROFT_SERVICE_LICENSE_FILES = LICENSE

define MYCROFT_SERVICE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 644 $(@D)/mycroft.service \
		$(TARGET_DIR)/usr/lib/systemd/system/mycroft.service
	$(INSTALL) -D -m 644 $(@D)/mycroft-messagebus.service \
                $(TARGET_DIR)/usr/lib/systemd/system/mycroft-messagebus.service
	$(INSTALL) -D -m 644 $(@D)/mycroft-audio.service \
                $(TARGET_DIR)/usr/lib/systemd/system/mycroft-audio.service
	$(INSTALL) -D -m 644 $(@D)/mycroft-voice.service \
                $(TARGET_DIR)/usr/lib/systemd/system/mycroft-voice.service
	$(INSTALL) -D -m 644 $(@D)/mycroft-enclosure.service \
                $(TARGET_DIR)/usr/lib/systemd/system/mycroft-enclosure.service
	$(INSTALL) -D -m 644 $(@D)/mycroft-skills.service \
                $(TARGET_DIR)/usr/lib/systemd/system/mycroft-skills.service
	$(INSTALL) -D -m 644 $(@D)/mycroft-gui.service \
                $(TARGET_DIR)/usr/lib/systemd/system/mycroft-gui.service
	$(INSTALL) -D -m 644 $(@D)/weston.service \
                $(TARGET_DIR)/usr/lib/systemd/system/weston.service

	mkdir -p $(TARGET_DIR)/etc/xdg/weston
	$(INSTALL) -D -m 644 $(@D)/weston.ini \
		$(TARGET_DIR)/etc/xdg/weston/weston.ini
endef

$(eval $(generic-package))
