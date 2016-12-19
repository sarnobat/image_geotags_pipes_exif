## Get data stored in exif
FILE="$@"
YEAR=`exiftool -d "%Y" -DateTimeOriginal -short -short -short "$@"`
DATESTAMP=`exiftool -d "%Y-%m-%d" -DateTimeOriginal -short -short -short "$@"`
LOCATION=`exiftool -q -n -p '$GPSLatitude,$GPSLongitude' "$@" | xargs  -I% curl -s 'https://maps.googleapis.com/maps/api/geocode/json?latlng='%'&sensor=true&key=AIzaSyA6mE4febQ1RlD_rhtPaqVX3aLlIGcx5Cw'| jq --unbuffered -r '.results[0].formatted_address'`

## Get the Json geodata
exiftool -q -n -p '$GPSLatitude,$GPSLongitude' "$@" | xargs  -I% curl -s 'https://maps.googleapis.com/maps/api/geocode/json?latlng='%'&sensor=true&key=AIzaSyA6mE4febQ1RlD_rhtPaqVX3aLlIGcx5Cw'| jq --unbuffered '.results[0].address_components ' > google_geodata.json

## Extract the relevant fields from the json geodata
CITY=`cat google_geodata.json | jq --unbuffered -r '.[] | select (.types[] | contains("locality")) | .long_name'`
COUNTRY=`cat google_geodata.json | jq --unbuffered -r '.[] | select (.types[] | contains("country")) | .long_name'`

#if [ -n "${VAR}" ]; then
  #  echo "VAR is unset or set to the empty string"

  ## Output
  echo "{ \"path\" : \"$FILE\", \"year\" : \"$YEAR\", \"datestamp\" : \"$DATESTAMP\", \"full_address\" : \"$LOCATION\", \"city\" : \"$CITY\", \"country\" : \"$COUNTRY\" }" | perl -pe 's{[^\}]\n}{, }g'
#echo "\n"
#echo "$YEAR/${COUNTRY}_${CITY}"
#fi

rm google_geodata.json
