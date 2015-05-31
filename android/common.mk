# Define directory locations:
ROOT_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
NDK_STANDALONE_DIR = $(ROOT_DIR)/ndk-standalone
NDK_STANDALONE = $(NDK_STANDALONE_DIR)/$(NDK_INSTALL_DIR)
PREFIX_DIR = $(ROOT_DIR)/prefix

# Define commands:
RM = rm -rf
WGET = wget
TAR = tar
MKDIR = mkdir -p
