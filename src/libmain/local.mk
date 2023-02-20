libraries += libmain

libmain_NAME = libnixmain

libmain_DIR := $(d)

libmain_SOURCES := $(wildcard $(d)/*.cc)

libmain_CXXFLAGS += \
	-Isrc/libmain/include \
	-Isrc/libstore/include \
	-Isrc/libutil/include

libmain_LDFLAGS += $(OPENSSL_LIBS)

libmain_LIBS = libstore libutil

libmain_ALLOW_UNDEFINED = 1

$(eval $(call install-file-in, $(d)/nix-main.pc, $(libdir)/pkgconfig, 0644))

$(foreach i, $(wildcard src/libmain/include/nix/main/*.hh), \
  $(eval $(call install-file-in, $(i), $(includedir)/nix/main, 0644)))
