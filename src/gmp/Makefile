include common.mk
include config.mk

MARKING_FILES = extracted

.PHONY: all clean
all: extracted
	$(warning $(GMP_DIR_PATH))

clean:
	-$(RM) -rf $(GMP_TAR_NAME) $(GMP_DIR) $(MARKING_FILES)

extracted: $(GMP_DIR)
	touch $@

$(GMP_DIR): $(GMP_TAR_NAME)
	$(TAR) xf $<

$(GMP_TAR_NAME):
	$(WGET) $(GMP_URL)
