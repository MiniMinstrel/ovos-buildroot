################################################################################
#
# mycroft-skill-better-playback-control
#
################################################################################

MYCROFT_SKILL_BETTER_PLAYBACK_CONTROL_VERSION = 6d06e616c9ce76ca0ad700dc6a88e01a51b36be5
MYCROFT_SKILL_BETTER_PLAYBACK_CONTROL_SITE = git://github.com/OpenVoiceOS/skill-better-playback-control
MYCROFT_SKILL_BETTER_PLAYBACK_CONTROL_SITE_METHOD = git
MYCROFT_SKILL_BETTER_PLAYBACK_CONTROL_DIRLOCATION = home/mycroft/.local/share/mycroft/skills
MYCROFT_SKILL_BETTER_PLAYBACK_CONTROL_DIRNAME = skill-better-playback-control.openvoiceos

define MYCROFT_SKILL_BETTER_PLAYBACK_CONTROL_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/$(MYCROFT_SKILL_BETTER_PLAYBACK_CONTROL_DIRLOCATION)/$(MYCROFT_SKILL_BETTER_PLAYBACK_CONTROL_DIRNAME)
	cp -dpfr $(@D)/* $(TARGET_DIR)/$(MYCROFT_SKILL_BETTER_PLAYBACK_CONTROL_DIRLOCATION)/$(MYCROFT_SKILL_BETTER_PLAYBACK_CONTROL_DIRNAME)
	cp -dpfr $(MYCROFT_SKILL_BETTER_PLAYBACK_CONTROL_DL_DIR)/git/.git* \
		$(TARGET_DIR)/$(MYCROFT_SKILL_BETTER_PLAYBACK_CONTROL_DIRLOCATION)/$(MYCROFT_SKILL_BETTER_PLAYBACK_CONTROL_DIRNAME)
endef

$(eval $(generic-package))
