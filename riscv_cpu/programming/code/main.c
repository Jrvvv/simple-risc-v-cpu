#include "platform.h"

void init_color(uint8_t intns, uint8_t text, uint8_t back) {
  int i;
  i = 0;

  while (i < MAP_HEIGHT * MAP_WIDTH) {
    color_map[i] = GET_COLOR(intns, text, back);
    i++;
  }
}

void init_text_ch(char ch) {
  int i;
  i = 0;

  while (i < MAP_HEIGHT * MAP_WIDTH) {
    char_map[i] = ch;
    i++;
  }
}

void init_text(uint8_t str_arr[]) {
  int i;
  i = 0;

  while (i < MAP_HEIGHT * MAP_WIDTH) {
    char_map[i] = str_arr[i];
    i++;
  }
}

int to_change_screen;
int finish;

int main(int argc, char** argv) {

  to_change_screen = 0;
  finish = 0;

  ps2_ptr->rst = 1;

  init_color(FADE_MODE, CIN_CLR, WHT_CLR);
  init_text (g_hello_str);

  while(1) {                               // В бесконечном цикле
    if (to_change_screen && !finish) {
      init_color(FADE_MODE, RED_CLR, WHT_CLR);
      init_text(g_goodbye_str);
      finish = 1;
    }
  }

  return 0;
}

void int_handler() {
  if (ps2_ptr->unread_data && !to_change_screen) {
    to_change_screen = 1;
  }
}

