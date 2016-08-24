find /Unsorted/new/Photos/ -iname "*jpg" | head -10 | sh httpify.sh | sh htmlify.sh

#mkfifo resulta resultb
#seq 4 | tee  >(perl -pe 's{^(.*)$}{(print image tag for $1)}g' > resulta) >(perl -pe 's{^(.*)$}{(print geotag for $1)}g' > resultb) | paste -d ' ' - resulta resultb
