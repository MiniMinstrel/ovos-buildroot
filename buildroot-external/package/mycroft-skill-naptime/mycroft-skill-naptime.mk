################################################################################
#
# mycroft-skill-naptime
#
################################################################################

MYCROFT_SKILL_NAPTIME_VERSION = cd63ca17cbfa1cc0f695a833fe3d2ec0d480392b
MYCROFT_SKILL_NAPTIME_SITE = https://github.com/OpenVoiceOS/skill-naptime
MYCROFT_SKILL_NAPTIME_SITE_METHOD = git
MYCROFT_SKILL_NAPTIME_DIRLOCATION = home/mycroft/.local/share/mycroft/skills
MYCROFT_SKILL_NAPTIME_DIRNAME = skill-naptime.openvoiceos

define MYCROFT_SKILL_NAPTIME_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/$(MYCROFT_SKILL_NAPTIME_DIRLOCATION)/$(MYCROFT_SKILL_NAPTIME_DIRNAME)
	cp -dpfr $(@D)/* $(TARGET_DIR)/$(MYCROFT_SKILL_NAPTIME_DIRLOCATION)/$(MYCROFT_SKILL_NAPTIME_DIRNAME)
	cp -dpfr $(MYCROFT_SKILL_NAPTIME_DL_DIR)/git/.git* \
		$(TARGET_DIR)/$(MYCROFT_SKILL_NAPTIME_DIRLOCATION)/$(MYCROFT_SKILL_NAPTIME_DIRNAME)
endef

$(eval $(generic-package))
