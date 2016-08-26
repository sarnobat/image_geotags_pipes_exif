mkfifo resulta resultb
find /Unsorted/new/photos/iPhone -iname "*JPG" | grep 17  | tee  >(sh httpify.sh | xargs -n 1 -d "\n" sh htmlify.sh > resulta) | paste -d ' ' resulta  | tee index.html
#find /Unsorted/new/photos/iPhone -iname "*JPG" | head -5 | tee  >(sh httpify.sh | sh htmlify.sh > resulta) >(xargs --delimiter "\n" -n 1 sh geotag.sh > resultb) | paste -d ' ' resulta resultb | tee index.html

#find /Unsorted/new/Photos/ -iname "*jpg" | head -10 | sh httpify.sh | sh htmlify.sh

#seq 4 | tee  >(perl -pe 's{^(.*)$}{(print image tag for $1)}g' > resulta) >(perl -pe 's{^(.*)$}{(print geotag for $1)}g' > resultb) | paste -d ' ' - resulta resultb
