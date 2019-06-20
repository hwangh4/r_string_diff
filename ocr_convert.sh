#!/bin/bash
# convert -density 200 Hládek2017_Article_LearningStringDistanceWithSmoo.pdf test1.png
# for i in *.pdf ; do
#   name=${i%.*}
#   png=$name.png
#   convert -density 200 "$i" "$png" ;
#   tesseract "$png" "test_$name" ;
# done

#!/bin/bash
for filename in ./*.txt ; do
  jpg=${filename%.txt}
  /Applications/LibreOffice.app/Contents/MacOS/soffice --convert-to jpg "$filename"
  tesseract $jpg.jpg "$jpg converted"
done
