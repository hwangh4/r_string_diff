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
  # convert into a single txt file:
  # rm -f single-file.txt
  # cat $jpg???.txt >>single-file.txt
  #
  # alternatively:
  for page in $jpg???.txt ; do
      Rscript run-my-program.R $page
      # add argument to r script
      # your R script has to handle command line arguments!
  done
done


## output format:
## csv?
## aa,aa,99%, ao, 1%
## ou,ou,90%,0u,5%,oii,4%, ...
## a json file instead?
## aa : {aa :99%, ao: 1%}
## ou : {ou:90%,0u:5%,oii:4%, ...}

