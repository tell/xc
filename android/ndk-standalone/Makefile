include ../common.mk
include config.mk

ifeq (not-found,$(shell test -d $(ANDROID_NDK_ROOT)/platforms/$(ANDROID_PLATFORM) || echo not-found))
  $(error Not found platform: $(ANDROID_PLATFORM) in $(ANDROID_NDK_ROOT)/platforms/. Please check a file config.mk)
endif
ifeq (not-found,$(shell test -d $(ANDROID_NDK_ROOT)/toolchains/$(ANDROID_TOOLCHAIN) || echo not-found))
  $(error Not found toolchain: $(ANDROID_TOOLCHAIN) in $(ANDROID_NDK_ROOT)/toolchains/. Please check a file config.mk)
endif

NDK_SETENV = setenv.sh

.PHONY: all clean clean-toolchain install
all: $(NDK_INSTALL_DIR) $(NDK_SETENV)

clean:
	$(RM) *~ .*~ $(NDK_SETENV)

clean-toolchain:
	$(RM) $(NDK_INSTALL_DIR)

$(NDK_INSTALL_DIR):
	$(MKDIR) $@
	$(ANDROID_NDK_ROOT)/build/tools/make-standalone-toolchain.sh --platform=$(ANDROID_PLATFORM) --toolchain=$(ANDROID_TOOLCHAIN) --install-dir=$(NDK_INSTALL_DIR) || $(RM) $@

$(NDK_SETENV): $(NDK_INSTALL_DIR)
	$(RM) $(NDK_SETENV)
	touch $(NDK_SETENV)
	@echo export ANDROID_NDK_ROOT=\"$(ANDROID_NDK_ROOT)\" >> $@
	@echo export PATH=\"$(abspath $<)/bin:$(abspath $(ANDROID_NDK_ROOT)):\$$PATH\" >> $@
	@echo export SYSROOT=\"$(abspath $<)/sysroot\" >> $@
	@echo export CC=\"$(abspath $<)/bin/arm-linux-androideabi-gcc --sysroot=$(abspath $<)/sysroot\" >> $@
	@echo export CXX=\"$(abspath $<)/bin/arm-linux-androideabi-g++ --sysroot=$(abspath $<)/sysroot\" >> $@
	@echo export AR=\"$(abspath $<)/bin/arm-linux-androideabi-ar\" >> $@
	@echo Please execute: . setenv.sh

list:
	@echo "==== Toolchains (to be set for ANDROID_TOOLCHAIN) ===="
	ls $(ANDROID_NDK_ROOT)/toolchains/
	@echo "==== Android platforms (to be set for ANDROID_PLATFORM) ===="
	ls $(ANDROID_NDK_ROOT)/platforms/
