include ../common.mk
include config.mk

.PHONY: all clean check install
all: $(OPENSSL_DIR) built

clean:
	-$(MAKE) -C $(OPENSSL_DIR) -i clean
	-$(RM) configured built *~ .*~

install: built $(OPENSSL_PREFIX)
	$(MAKE) -C $(OPENSSL_DIR) -i install_sw

built: configured
	$(MAKE) -C $(OPENSSL_DIR) depend
	$(MAKE) -C $(OPENSSL_DIR) all
	touch $@

configured:
	./configure.bash $(OPENSSL_DIR) "$(OPENSSL_OPTIONS)" $(OPENSSL_PREFIX)
	touch $@

$(OPENSSL_DIR): $(OPENSSL_TAR)
	$(TAR) xf $<

$(OPENSSL_TAR):
	$(WGET) $(OPENSSL_URL)

$(OPENSSL_PREFIX):
	$(MKDIR) $@
