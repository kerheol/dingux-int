#
# JZINTV port on PSP
#
# Copyright (C) 2009 Ludovic Jacomme (ludovic.jacomme@gmail.com)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
TARGET			= dingux-int

ZERODEV_PATH	= /opt/gcw0-toolchain/usr/mipsel-gcw0-linux-uclibc/sysroot/usr
BINARIES_PATH	= /opt/gcw0-toolchain/usr/bin
SDL_CONFIG		= $(ZERODEV_PATH)/bin/sdl-config

OBJS = gp2x_psp.o \
error.o \
global.o \
psp_sound.o \
psp_main.o \
psp_fmgr.o \
psp_menu.o \
psp_menu_kbd.o \
psp_danzeff.o \
psp_kbd.o \
psp_sdl.o \
psp_menu_set.o \
psp_menu_help.o \
psp_font.o \
\
jzintv.o cfg/cfg.o cfg/usage.o misc/crc32.o misc/crc16.o misc/avl.o misc/ll.o \
plat/plat_lib.o plat/gnu_getopt.o event/event.o \
event/event_tbl.o gfx/gfx.o snd/snd.o mvi/mvi.o \
periph/periph.o cp1600/cp1600.o cp1600/op_decode.o \
cp1600/op_exec.o cp1600/tbl/fn_cond_br.o cp1600/tbl/fn_dir_2op.o \
cp1600/tbl/fn_imm_2op.o cp1600/tbl/fn_impl_1op_a.o cp1600/tbl/fn_impl_1op_b.o \
cp1600/tbl/fn_ind_2op.o cp1600/tbl/fn_reg_1op.o cp1600/tbl/fn_reg_2op.o \
cp1600/tbl/fn_rot_1op.o cp1600/tbl/formats.o cp1600/emu_link.o mem/mem.o \
icart/icart.o icart/icartrom.o icart/icartbin.o icart/icartfile.o stic/stic.o \
pads/pads.o pads/pads_cgc.o pads/pads_cgc_linux.o pads/pads_cgc_win32.o \
pads/pads_intv2pc.o ay8910/ay8910.o ivoice/ivoice.o speed/speed.o file/file.o \
bincfg/bincfg.o bincfg/bincfg_grmr.tab.o bincfg/bincfg_lex.o  bincfg/legacy.o \
gif/gif_enc.o gif/lzw_enc.o demo/demo.o  joy/joy.o serializer/serializer.o \

CC		= $(BINARIES_PATH)/mipsel-linux-gcc
STRIP	= $(BINARIES_PATH)/mipsel-linux-strip

DEFAULT_CFLAGS = $(shell $(SDL_CONFIG) --cflags)

MORE_CFLAGS = -I. -I$(ZERODEV_PATH)/usr/include -DLSB_FIRST \
-I. -I$(ZERODEV_PATH)/usr/include \
 -DMPU_JZ4740 -mips32 -O3 -fomit-frame-pointer -fsigned-char -ffast-math \
 -DGCW0_MODE  \
-DNO_STDIO_REDIRECT

# -ffast-math -fomit-frame-pointer -fno-strength-reduce -fexpensive-optimizations \

CFLAGS = $(DEFAULT_CFLAGS) $(MORE_CFLAGS)
LDFLAGS = -s

LIBS += -L$(ZERODEV_PATH)/lib \
-lSDL \
-lSDL_image \
-lSDL_ttf \
-lpng -lz -lc -lm -lpthread -ldl

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

all: $(OBJS)
	$(CC) $(LDFLAGS) $(CFLAGS) $(OBJS) $(LIBS) -o $(TARGET) && $(STRIP) $(TARGET)

install: $(TARGET)
	cp $< /media/dingux/local/emulators/dingux-int/

clean:
	rm -f $(OBJS) $(TARGET)

ctags:
	ctags *[ch]
