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

int main(int argc, char** argv) {
  // uint8_t color_arr[MAP_HEIGHT * MAP_WIDTH];
  int finish;

  finish = 0;

  ps2_ptr->rst = 1;

  init_color(FADE_MODE, CIN_CLR, WHT_CLR);
  // TODO: check this case if doesn't work
  // or even
  // init_color(color_arr, FADE_MODE, CIN_CLR, WHT_CLR);
  // memcpy(color_map, color_arr,   (size_t)(MAP_HEIGHT * MAP_WIDTH));

  init_text(g_hello_str);
  // TODO: check this case if doesn't work
  // or maybe
  // memcpy(char_map,  g_hello_str, (size_t)(MAP_HEIGHT * MAP_WIDTH));

  while(1) {                               // В бесконечном цикле
    // init_text_ch('a');
    if (ps2_ptr->unread_data && !finish) {
      init_color(FADE_MODE, RED_CLR, WHT_CLR);
      init_text(g_goodbye_str);
      // init_text_ch('b');
      finish = 1;
    }
  }

  return 0;
}

void int_handler() {

  // if(DEADLY_SERIOUS_EVENT == collider_ptr->status)
  // {
  //   collider_ptr->emergency_switch = 1;
  // }
}

