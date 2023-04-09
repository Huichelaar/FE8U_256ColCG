@ Load chatbubble palette and gfx to OBJPAL and OBJVRAM.
@ Hooked at 0x8EB98.
.thumb

push  {r4, r14}


@ Vanilla, overwritten by hook.
mov   r1, #0x90
lsl   r1, #0x2
mov   r2, #0x20
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4

@ Load chatbubble palette.
ldr   r0, =0x89E84D4
mov   r1, #0x98
lsl   r1, #0x2
mov   r2, #0x20
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4

@ Load chatbubble gfx.
ldr   r0, =CGC_BubbleSpriteGfx
ldr   r1, =gGenericBuffer
ldr   r4, =Decompress
bl    GOTO_R4
ldr   r0, =gGenericBuffer
ldr   r1, =0x6013000
mov   r2, #0x9
mov   r3, #0x4
ldr   r4, =CopyTileGfxForObj
bl    GOTO_R4


@ Vanilla, overwritten by hook.
ldr   r0, =0x85A643C
pop   {r4}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
