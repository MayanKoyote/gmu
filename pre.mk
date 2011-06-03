# 
# Gmu Music Player
#
# Copyright (c) 2006-2011 Johannes Heimansberg (wejp.k.vu)
#
# File: unknown.mk  Created: 110601
#
# Description: Makefile configuration (Palm Pre)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; version 2 of
# the License. See the file COPYING in the Gmu's main directory
# for details.
#

#DECODERS_TO_BUILD=decoders/vorbis.so decoders/musepack.so decoders/flac.so decoders/wavpack.so decoders/mpg123.so decoders/mikmod.so
DECODERS_TO_BUILD?=decoders/wavpack.so
FRONTENDS_TO_BUILD?=frontends/sdl.so frontends/log.so frontends/gmusrv.so
CC=gcc
CXX=g++
STRIP=strip

SDL_LIB=$(shell /mnt/disk/devel/palmpre/cross-compile/staging/armv7/usr/bin/sdl-config --libs) -lnapp -llunaservice -lPiranha -lpalmvibe -lLunaSysMgrIpc -lfreetype
SDL_CFLAGS=$(shell /mnt/disk/devel/palmpre/cross-compile/staging/armv7/usr/bin/sdl-config --cflags)
MIKMOD_LIB=$(shell libmikmod-config --libs)
MIKMOD_CFLAGS=$(shell libmikmod-config --cflags)

COPTS?=-O2 -funroll-all-loops -finline-functions -ffast-math -fno-short-enums -g
CFLAGS=-I/mnt/disk/devel/palmpre/cross-compile/staging/armv7/usr/include -I/mnt/disk/devel/palmpre/cross-compile/staging/armv7/usr/include/SDL $(SDL_CFLAGS) -fsigned-char -D_REENTRANT -DUSE_MEMORY_H -D_$(DEVICE) -DFILE_HW_H="\"hw_$(TARGET).h\"" -DNO_SDL_GFX=1 -DCORE_WITH_SDL_VIDEO=1 -DSDLFE_NO_HWACCEL=1
LFLAGS=-I/mnt/disk/devel/palmpre/cross-compile/staging/armv7/usr/include -L/mnt/disk/devel/palmpre/cross-compile/staging/armv7/usr/lib -Wl,-export-dynamic
DISTFILES=$(BINARY) frontends decoders themes gmu.png README.txt COPYING gmuinput.pre.conf gmu.bmp
