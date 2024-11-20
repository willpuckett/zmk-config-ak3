#!/bin/bash

PROJECT=ak3
LAYOUTS=('qwerty' 'engrammer' 'engrammer_shifted')
ZMK_KEYMAP="config/boards/shields/${PROJECT}/${PROJECT}.keymap"
DTS_LAYOUT=(--dts-layout "config/boards/shields/${PROJECT}/${PROJECT}-layouts.dtsi")

[[ -d .images ]] || mkdir .images

# Iterate over array keys
# https://devhints.io/bash#arrays
for i in "${!LAYOUTS[@]}"; do
    echo "Rendering Layout ${LAYOUTS[$i]}"
    BASE=".images/ak3_${LAYOUTS[$i]}"
    YML="$BASE.yml"
    # note you have to have the quotes for KMD_LAYOUT expansion
    KEYMAP_zmk_preamble="#define LAYOUT $i" keymap parse -z "$ZMK_KEYMAP" > "$YML" &&
        keymap draw "${DTS_LAYOUT[@]}" "$YML" > "$BASE.svg"
    [[ $? -ne 0 ]] && exit 1
    rm "$YML"
done
