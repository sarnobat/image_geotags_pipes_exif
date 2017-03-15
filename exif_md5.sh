FILEPATH=$1
md5sum  "$FILEPATH" | cut -f 1 -d " " | perl -pe 's{\n}{  }g'
exiftool -q -n -p '$GPSLatitude,$GPSLongitude'  "$FILEPATH"
