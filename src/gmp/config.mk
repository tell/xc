GMP_DIR_PREFIX := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
GMP_URL = https://gmplib.org/download/gmp/gmp-6.0.0a.tar.bz2
GMP_DIR = gmp-6.0.0
GMP_DIR_PATH = $(GMP_DIR_PREFIX)/$(GMP_DIR)
GMP_TAR_NAME = $(notdir $(GMP_URL))
