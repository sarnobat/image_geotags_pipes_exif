# image_geotags_pipes
Show address of a list of images

###
```
cat $PHOTOS/iPhone/gps.txt  | perl -pe 's{.*:: }{}g' | sort | uniq | tee $PHOTOS/iPhone/gps_distinct.txt
```
```
cat ~/db.git/auto/gps_distinct.txt |  xargs --delimiter '\n' --max-args=1 sh ~/bin/gps2description.sh | tee ~/db.git/auto/gps_distinct_place_names.txt
```
