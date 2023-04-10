#include <stdio.h>
#include "main.h"

// Set 256-col BG.
void CGC_ASMC() {
  // Init LCDIO stuff.
  SetBgPosition(0, 0, 0);
  SetBgPosition(1, 0, 0);
  SetBgPosition(2, 0, 0);
  SetBgPosition(3, 0, 0);
  SetBgMapDataOffset(0, 0xE000);
  SetBgMapDataOffset(1, 0xE800);
  SetBgMapDataOffset(2, 0xF000);
  SetBgMapDataOffset(3, 0xF800);
  SetBgTileDataOffset(0, 0);
  SetBgTileDataOffset(1, 0);
  SetBgTileDataOffset(2, 0);
  SetBgTileDataOffset(3, 0);
  gLCDIOBuffer.bgControl[3].colorMode = 1;                // 256-col mode.
  gLCDIOBuffer.blendControl.target2_backdrop = false;     // Prevents weird blending into trans colour effect.
  
  // Clear screen entries.
  CpuFill16(0x0, gBg0MapBuffer, 0x1800);
  CpuFastFill(0, (void*)0x6000000, 0x20);       // Empty tile.
  
  // Init gfx.
  Decompress(bgTable[gEventSlot[2]].gfx, (void*)0x6000040);
  CopyToPaletteBuffer(bgTable[gEventSlot[2]].pal, 0, 0x200);
  for (int i = 0; i < 640; i++)
    gBg3MapBuffer[i] = i+1;
  EnableBgSyncByMask(0xF);
  EnablePaletteSync();
}