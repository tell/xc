CYGWIN_ROOT_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

RM = rm -f
MKDIR = mkdir -p

CYGWIN_PREFIX_PATH = $(CYGWIN_ROOT_PATH)/prefix
