OPENSSL_URL := https://www.openssl.org/source/openssl-1.0.2d.tar.gz
OPENSSL_OPTIONS = shared no-ssl2 no-ssl3 no-hw no-engine zlib-dynamic

#### The below codes are automatically set. ####

OPENSSL_TAR = $(notdir $(OPENSSL_URL))
OPENSSL_DIR = $(basename $(basename $(OPENSSL_TAR)))
OPENSSL_PREFIX = $(PREFIX_DIR)
