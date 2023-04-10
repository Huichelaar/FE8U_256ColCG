#ifndef MAIN_H
#define MAIN_H
#include "gbafe.h"

void CGC_ASMC();

struct BGData {
  const void* gfx;
  const void* tsa;
  const u16* pal;
};
const extern struct BGData bgTable[];

#endif // MAIN_H