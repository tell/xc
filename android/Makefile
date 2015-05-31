include common.mk
include $(NDK_STANDALONE_DIR)/config.mk

all:
	$(MAKE) -C $(NDK_STANDALONE_DIR)

check:
	-@for x in $(shell ls $(PREFIX_DIR)/lib/*.so) ; do echo "--> Show depends of $$(basename $$x)" ; $(ANDROID_NDK_ROOT)/ndk-depends $$x ; done
	-@for x in $(shell ls $(PREFIX_DIR)/lib/*.so $(PREFIX_DIR)/lib/*.a) ; do echo "--> Show arch. of $$(basename $$x)"; $(NDK_STANDALONE)/bin/arm-linux-androideabi-readelf -h $$x | grep -i 'class\|machine' | sort | uniq ; done

$(PREFIX_DIR):
	$(MKDIR) $@
