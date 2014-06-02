#ifndef _GLOBAL_H_
#define _GLOBAL_H_

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int   u32;

#include "gp2x_psp.h"
#include <time.h>
#include <dirent.h>

//LUDO:
# define INTEL_RENDER_NORMAL   0
# define INTEL_LAST_RENDER     0

# define MAX_PATH           256
# define INTEL_MAX_SAVE_STATE 5

# ifndef CLK_TCK
# define CLK_TCK  CLOCKS_PER_SEC
# endif

#define CPU_CLOCK_IDLE 60
#define CPU_CLOCK_STD 200

  typedef struct Intel_t {

    char intel_save_used[INTEL_MAX_SAVE_STATE];
    char intel_save_name[MAX_PATH];
    char intel_home_dir[MAX_PATH];
    char intel_rom_dir[MAX_PATH];
    int  psp_screenshot_id;
    int  psp_cpu_clock;
    int  psp_joystick_cursor;
    int  psp_active_joystick;
    int  intel_snd_enable;
    int  intel_render_mode;
    int  psp_skip_max_frame;
    int  psp_skip_cur_frame;
    int  intel_slow_down_max;

  } Intel_t;

  extern Intel_t INTEL;

  extern int psp_screenshot_mode;

  extern void intel_global_init(void);

#endif
