	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	1
	.global	CGC_ASMC
	.arch armv4t
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CGC_ASMC, %function
CGC_ASMC:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	movs	r2, #0
	ldr	r4, .L4
	movs	r1, r2
	movs	r0, r2
	bl	.L6
	movs	r2, #0
	movs	r0, #1
	movs	r1, r2
	bl	.L6
	movs	r2, #0
	movs	r0, #2
	movs	r1, r2
	bl	.L6
	movs	r2, #0
	movs	r0, #3
	movs	r1, r2
	bl	.L6
	movs	r1, #224
	ldr	r4, .L4+4
	movs	r0, #0
	lsls	r1, r1, #8
	bl	.L6
	movs	r1, #232
	movs	r0, #1
	lsls	r1, r1, #8
	bl	.L6
	movs	r1, #240
	movs	r0, #2
	lsls	r1, r1, #8
	bl	.L6
	movs	r1, #248
	movs	r0, #3
	lsls	r1, r1, #8
	bl	.L6
	movs	r1, #0
	ldr	r4, .L4+8
	movs	r0, r1
	bl	.L6
	movs	r1, #0
	movs	r0, #1
	bl	.L6
	movs	r1, #0
	movs	r0, #2
	bl	.L6
	movs	r0, #3
	movs	r1, #0
	bl	.L6
	movs	r2, #128
	ldr	r3, .L4+12
	ldrb	r1, [r3, #24]
	rsbs	r2, r2, #0
	orrs	r2, r1
	movs	r1, #32
	strb	r2, [r3, #24]
	adds	r3, r3, #60
	ldrb	r2, [r3, #1]
	bics	r2, r1
	strb	r2, [r3, #1]
	mov	r3, sp
	movs	r6, #0
	adds	r0, r3, #2
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	ldr	r3, .L4+24
	strh	r6, [r0]
	bl	.L7
	movs	r1, #192
	movs	r5, #12
	ldr	r2, .L4+28
	ldr	r3, .L4+32
	lsls	r1, r1, #19
	add	r0, sp, #4
	str	r6, [sp, #4]
	bl	.L7
	ldr	r7, .L4+36
	ldr	r3, [r7, #8]
	muls	r3, r5
	ldr	r4, .L4+40
	ldr	r1, .L4+44
	ldr	r0, [r3, r4]
	ldr	r3, .L4+48
	bl	.L7
	movs	r2, #128
	ldr	r3, [r7, #8]
	muls	r5, r3
	adds	r4, r4, r5
	movs	r1, r6
	ldr	r3, .L4+52
	lsls	r2, r2, #2
	ldr	r0, [r4, #8]
	bl	.L7
	movs	r3, #1
	ldr	r2, .L4+56
	ldr	r1, .L4+60
.L2:
	strh	r3, [r2]
	adds	r3, r3, #1
	adds	r2, r2, #2
	cmp	r3, r1
	bne	.L2
	movs	r0, #15
	@ sp needed
	ldr	r3, .L4+64
	bl	.L7
	ldr	r3, .L4+68
	bl	.L7
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L5:
	.align	2
.L4:
	.word	SetBgPosition
	.word	SetBgMapDataOffset
	.word	SetBgTileDataOffset
	.word	gLCDIOBuffer
	.word	16780288
	.word	gBg0MapBuffer
	.word	CpuSet
	.word	16777224
	.word	CpuFastSet
	.word	gEventSlot
	.word	bgTable
	.word	100663360
	.word	Decompress
	.word	CopyToPaletteBuffer
	.word	gBg3MapBuffer
	.word	641
	.word	EnableBgSyncByMask
	.word	EnablePaletteSync
	.size	CGC_ASMC, .-CGC_ASMC
	.ident	"GCC: (devkitARM release 55) 10.2.0"
	.code 16
	.align	1
.L7:
	bx	r3
.L6:
	bx	r4
