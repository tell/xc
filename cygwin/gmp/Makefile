include ../common.mk
include config.mk

CONFIG_OPTS_COMMON = --host=$(GMP_HOST_ARCH) --enable-cxx --disable-localeconv
ifneq (,$(GMP_BUILD_ARCH))
  CONFIG_OPTS_COMMON += --build=$(GMP_BUILD_ARCH)
endif

MARKING_FILES = check_pre_req configured_static configured_shared built_static built_shared
OUT_DIRS = static-lib shared-lib

.PHONY: all check clean
all: check_pre_req built_static built_shared

check:
	$(MAKE) -C static-lib check
	$(MAKE) -C shared-lib check

clean:
	$(RM) -fr $(MARKING_FILES) $(OUT_DIRS)

built_static: configured_static
	$(MAKE) -C static-lib -j $(NUM_PARALLEL_BUILD)
	touch $@

built_shared: configured_shared
	$(MAKE) -C shared-lib -j $(NUM_PARALLEL_BUILD)
	touch $@

configured_static: static-lib
	touch $@

static-lib:
	$(MKDIR) $@
	cd $@; \
	$(GMP_DIR_PATH)/configure --enable-static --disable-shared $(CONFIG_OPTS_COMMON)

configured_shared: shared-lib
	touch $@

shared-lib:
	$(MKDIR) $@
	cd $@; \
	$(GMP_DIR_PATH)/configure --enable-shared --disable-static $(CONFIG_OPTS_COMMON)

check_pre_req: $(GMP_DIR_PATH)
	touch $@

$(GMP_DIR_PATH):
	$(MAKE) -C $(GMP_DIR_PREFIX)
