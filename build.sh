TTF="ttf/Orelega-Bold.ttf"

# Delete old TTF
rm $TTF

# Fail Fast
set -e

# Generate Font
fontforge -c 'open(argv[1]).generate(argv[2])' Orelega-Bold.sfdir $TTF

# Autohint
ttfautohint -t $TTF $TTF.hinted
mv $TTF.hinted $TTF

# After-Burner
gftools fix-unwanted-tables $TTF
gftools fix-dsig --autofix $TTF
