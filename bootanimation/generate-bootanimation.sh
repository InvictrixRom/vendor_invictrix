#!/bin/bash
env
WIDTH="$1"
HEIGHT="$2"
HALF_RES="$3"
BOOTANIM_OUT="$OUT/obj/BOOTANIMATION"

if [ "$HEIGHT" -lt "$WIDTH" ]; then
    IMAGEWIDTH="$HEIGHT"
else
    IMAGEWIDTH="$WIDTH"
fi

IMAGESCALEWIDTH="$IMAGEWIDTH"

if [ "$HALF_RES" = "true" ]; then
    IMAGEWIDTH=$(expr $IMAGEWIDTH / 2)
fi

RESOLUTION=""$IMAGEWIDTH"x"$IMAGEWIDTH""

for part_cnt in 0 1 2
do
    mkdir -p $BOOTANIM_OUT/bootanimation/part$part_cnt
done
tar xfp "vendor/invictrix/bootanimation/bootanimation.tar" -C "$OUT/bootanimation/"
mogrify -resize $RESOLUTION -colors 250 "$OUT/bootanimation/"*"/"*".png"

# Create desc.txt
echo "$IMAGESCALEWIDTH $IMAGESCALEWIDTH" 30 > "$OUT/bootanimation/desc.txt"
cat "vendor/invictrix/bootanimation/desc.txt" >> "$OUT/bootanimation/desc.txt"

# Create bootanimation.zip
zip -qr0 "$BOOTANIM_OUT/bootanimation.zip" "$BOOTANIM_OUT/bootanimation"
