GMP_URL := https://gmplib.org/download/gmp/gmp-6.0.0a.tar.bz2
GMP_DIR = gmp-6.0.0
GMP_BUILD = gmp-build
GMP_HOST = arm-linux-androideabi

#### The below codes are automatically set. ####

GMP_TAR = $(notdir $(GMP_URL))
GMP_PREFIX = $(PREFIX_DIR)
