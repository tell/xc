include ../common.mk
include config.mk

LIBGMP_LDFLAGS += -avoid-version
LIBGMPXX_LDFLAGS += -avoid-version

ifeq (,$(findstring -avoid-version,$(LIBGMP_LDFLAGS)))
  $(error An option -avoid-version should be set in a variable LIBGMP_LDFLAGS)
endif
ifeq (,$(findstring -avoid-version,$(LIBGMPXX_LDFLAGS)))
  $(error An option -avoid-version should be set in a variable LIBGMPXX_LDFLAGS)
endif

export LIBGMP_LDFLAGS
export LIBGMPXX_LDFLAGS

.PHONY: all clean install
all: $(GMP_DIR) built

clean:
	-$(MAKE) -C $(GMP_BUILD) clean
	-$(RM) $(GMP_BUILD) configured built

install:
	$(MAKE) -C $(GMP_BUILD) install

built: configured
	$(MAKE) -C $(GMP_BUILD) -j 8
	touch $@

configured: $(GMP_BUILD)
	cd $(GMP_BUILD) && ../$(GMP_DIR)/configure --prefix=$(GMP_PREFIX) --host=$(GMP_HOST) --enable-cxx
	touch $@

$(GMP_DIR): $(GMP_TAR)
	$(TAR) xf $<

$(GMP_TAR):
	$(WGET) $(GMP_URL)

$(GMP_BUILD):
	$(MKDIR) $@

$(GMP_PREFIX):
	$(MKDIR) $@
