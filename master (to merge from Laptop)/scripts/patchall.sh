#! /bin/zsh

mkdir ../myfonts/AllFonts/Patched

for f in ../myfonts/AllFonts/*;
do
echo Patching $f...
    ./font-patcher -slwcq --progressbars --careful -ext otf -out "../myfonts/AllFonts/Patched/$(basename $f)" $f
done
