# FE8U_256ColCG
Vanilla FE8U allows backgrounds/CGs to use one of a few 16-colour palettes for each 8x8 tile. This patch provides functionality for supporting 256-colour mode BGs in FE8U. This allows any pixel in the background to use one of 256 colours instead.

![Gif broken](https://i.imgur.com/T7o3aHD.gif)

## Implementation/Features
For 256-colour CGs, all background colours are reserved for the CG. This means regular chatbubbles won't work, as these also need background palettes. Loading portraits also breaks the CG. Instead, the CGTextBox (started by using event code [CGTEXTSTART](https://github.com/StanHash/EAStandardLibrary/blob/experimental/Language%20Raws/FE8/Scene-Text.txt#L83)) is now built solely out of sprites, allowing this chatbox to still be used when a 256-colour CG is displayed.

I'll be using "CG", "BG" and "background" interchangeably from here on. 256-colour BGs are added to the usual conversation background table. Their TSA pointer is set to NULL. I had to [repoint the background table](gfx/BG/BG.event), so if you plan on adding the patch to your buildfile project or [Custom Build](https://dw.ngmansion.xyz/doku.php?id=en:en:guide:febuildergba:skillsystems_custombuild), make sure it's not being repointed multiple times.

Adding your own 256-colour BGs means having to convert .png images to binary .dmp files. I made a program, [Sommie.exe](gfx/BG/Sommie.exe), to make this process simple. Here's how to add your own BGs:
- Make sure your image is in .png format and 256 pixels wide & 160 pixels tall. Keep in mind that the displayed image will be 240x160, meaning the last 16 columns of pixels won't display.
- Make sure your image is saved in indexed colour mode. If you're using [Usenti](https://www.coranac.com/projects/usenti/), just save the image as 8bpp.
- Run [Sommie.exe](gfx/BG/Sommie.exe) (if you're using Windows) or [Sommie.py](gfx/BG/Sommie.py) in python3. The command would be `Sommie.exe <pngfilename> <dmpfilename> <palfilename>` for the executable, or `python3 Sommie.py <pngfilename> <dmpfilename> <palfilename>` for the python script. Easiest would be to open the [batch-file](gfx/BG/SommieAll.bat), which simply runs [Sommie.exe](gfx/BG/Sommie.exe) for all .png files in the directory.
- `#include` the .dmp and the Pal.dmp files at the bottom of [BG.event](gfx/BG/BG.event) and add an entry to the background table.

There's an example image of [a certain guardian spirit](gfx/BG/Sommie.png) which has been inserted already for reference.

There's a new macro, [`SetBackground256(background)`](events/background.event), which can be used to start a 256-colour background. The macro is used in [example events](events/2.event) replacing FE8 Chapter 2's events. [Textprocess](text/text-process-classic.exe) has also been used for some new text entries. Feel free to remove the example events and Textprocess once you're familiar with everything/ready to add the patch to your project.

## Credits

circleseverywhere for [lzss.py](https://www.dropbox.com/sh/xe3bk2tn87zboif/AACTeniihbt-NQWrTpn6F5OSa?dl=0&preview=lzss.py)