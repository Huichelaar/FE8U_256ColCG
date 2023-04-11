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
	ldr	r4, .L7
	movs	r1, r2
	movs	r0, r2
	bl	.L9
	movs	r2, #0
	movs	r0, #1
	movs	r1, r2
	bl	.L9
	movs	r2, #0
	movs	r0, #2
	movs	r1, r2
	bl	.L9
	movs	r2, #0
	movs	r0, #3
	movs	r1, r2
	bl	.L9
	movs	r1, #224
	ldr	r4, .L7+4
	movs	r0, #0
	lsls	r1, r1, #8
	bl	.L9
	movs	r1, #232
	movs	r0, #1
	lsls	r1, r1, #8
	bl	.L9
	movs	r1, #240
	movs	r0, #2
	lsls	r1, r1, #8
	bl	.L9
	movs	r1, #248
	movs	r0, #3
	lsls	r1, r1, #8
	bl	.L9
	movs	r1, #0
	ldr	r4, .L7+8
	movs	r0, r1
	bl	.L9
	movs	r1, #0
	movs	r0, #1
	bl	.L9
	movs	r1, #0
	movs	r0, #2
	bl	.L9
	movs	r0, #3
	movs	r1, #0
	bl	.L9
	movs	r2, #128
	ldr	r3, .L7+12
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
	movs	r4, #0
	adds	r0, r3, #2
	ldr	r2, .L7+16
	ldr	r1, .L7+20
	ldr	r3, .L7+24
	strh	r4, [r0]
	bl	.L10
	movs	r1, #192
	ldr	r2, .L7+28
	ldr	r3, .L7+32
	lsls	r1, r1, #19
	add	r0, sp, #4
	str	r4, [sp, #4]
	bl	.L10
	movs	r3, #12
	ldr	r5, .L7+36
	ldr	r2, [r5, #8]
	muls	r2, r3
	ldr	r4, .L7+40
	ldr	r1, .L7+44
	ldr	r0, [r2, r4]
	ldr	r3, .L7+48
	bl	.L10
	movs	r3, #128
	movs	r1, #224
	ldr	r2, .L7+52
	lsls	r3, r3, #1
	lsls	r1, r1, #2
.L2:
	strh	r3, [r2]
	adds	r3, r3, #1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	adds	r2, r2, #2
	cmp	r3, r1
	bne	.L2
	movs	r7, #12
	ldr	r3, [r5, #8]
	muls	r3, r7
	adds	r3, r4, r3
	ldr	r0, [r3, #8]
	ldr	r3, [r5, #4]
	ldr	r6, .L7+56
	cmp	r3, #224
	bne	.L3
	movs	r2, #64
	movs	r1, #0
	bl	.L11
	movs	r2, #192
	movs	r1, #128
	ldr	r3, [r5, #8]
	muls	r7, r3
	adds	r4, r4, r7
	ldr	r0, [r4, #8]
	lsls	r2, r2, #1
	adds	r0, r0, #64
.L6:
	bl	.L11
	@ sp needed
	movs	r0, #15
	ldr	r3, .L7+60
	bl	.L10
	ldr	r3, .L7+64
	bl	.L10
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L3:
	movs	r2, #128
	movs	r1, #0
	lsls	r2, r2, #2
	b	.L6
.L8:
	.align	2
.L7:
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
	.word	100679680
	.word	Decompress
	.word	gBg3MapBuffer
	.word	CopyToPaletteBuffer
	.word	EnableBgSyncByMask
	.word	EnablePaletteSync
	.size	CGC_ASMC, .-CGC_ASMC
	.ident	"GCC: (devkitARM release 55) 10.2.0"
	.code 16
	.align	1
.L10:
	bx	r3
.L9:
	bx	r4
.L11:
	bx	r6
