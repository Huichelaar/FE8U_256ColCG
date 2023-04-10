# Given an indexed png-image with a 256-colour palette, dump to GBA-insertable format.
import argparse
from PIL import Image
import lzss

parser = argparse.ArgumentParser()
parser.add_argument("file",help="PNG file to convert.")
parser.add_argument("outputGfx",help="Output graphics dump filename.")
parser.add_argument("outputPal",help="Output palette dump filename.")
args = parser.parse_args()

# Check for issues with input file.
im = Image.open(args.file)
if im.mode != "P":
  print("Error, input image, " + args.file + " is not in indexed colour mode!")
  exit()
if im.width != 256:
  print("Error, input image, " + args.file + " has width: " + im.width + ", needs width: 256!")
  exit()
if im.height != 160:
  print("Error, input image, " + args.file + " has height: " + im.height + ", needs height: 160!")
  exit()

# Transform into 8bpp binary and compress.
arr = [0 for i in range(im.width*im.height)]
i = 0
for ytile in range(im.height>>3):
  vOffs = ytile*8
  for xtile in range(im.width>>3):
    hOffs = xtile*8
    for y in range(8):
      for x in range(8):
        arr[i] = im.getpixel((x+hOffs, y+vOffs))
        i += 1
arr2 = lzss.compress(arr)

# Write gfx to file.
f = open(args.outputGfx, "wb")
f.write(arr2)
f.close()

# Extract palette and write to file.
pal = im.getpalette()
pal5bitcol = list()
f = open(args.outputPal, "wb")
for i in range(0, len(pal), 3):
  f.write((pal[i]>>3 | ((pal[i+1]>>3)<<5) | ((pal[i+2]>>3)<<10)).to_bytes(2, "little"))
f.close()