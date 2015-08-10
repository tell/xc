include ../common.mk
include config.mk

CONFIG_OPTS_COMMON = --prefix=$(CYGWIN_PREFIX_PATH) --host=$(GMP_HOST_ARCH) --enable-cxx
ifneq (,$(GMP_BUILD_ARCH))
  CONFIG_OPTS_COMMON += --build=$(GMP_BUILD_ARCH)
endif

SETENV_SCRIPT = ../setenv-mingw32.bash
OUT_DIRS = static-lib shared-lib

.PHONY: all clean check do-workaround install
all: checked_pre_req.mark built_static.mark built_shared.mark

clean:
	$(RM) -fr $(OUT_DIRS) *.mark

check: do-workaround checked_static.mark checked_shared.mark

do-workaround:
	bash workaround.bash

install:
	$(MAKE) -C static-lib install
	$(MAKE) -C shared-lib install

####

checked_static.mark:
	. $(SETENV_SCRIPT) && $(MAKE) -C static-lib check
	touch $@

checked_shared.mark:
	. $(SETENV_SCRIPT) && $(MAKE) -C shared-lib check
	touch $@

built_static.mark: configured_static.mark
	$(MAKE) -C static-lib -j $(NUM_PARALLEL_BUILD)
	touch static-lib && sleep 0.5 && touch $< && sleep 0.5 && touch $@

built_shared.mark: configured_shared.mark
	$(MAKE) -C shared-lib -j $(NUM_PARALLEL_BUILD)
	touch shared-lib && sleep 0.5 && touch $< && sleep 0.5 && touch $@

configured_static.mark: static-lib
	cd $<; $(GMP_DIR_PATH)/configure --enable-static --disable-shared $(CONFIG_OPTS_COMMON)
	touch $@

configured_shared.mark: shared-lib
	cd $<; $(GMP_DIR_PATH)/configure --enable-shared --disable-static $(CONFIG_OPTS_COMMON)
	touch $@

static-lib:
	$(MKDIR) $@

shared-lib:
	$(MKDIR) $@

checked_pre_req.mark: $(GMP_DIR_PATH)
	touch $@

$(GMP_DIR_PATH):
	$(MAKE) -C $(GMP_DIR_PREFIX)
