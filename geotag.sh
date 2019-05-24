# The api key is AIzaSyA************Gcx5Cw
exiftool -q -n -p '$GPSLatitude,$GPSLongitude' "$@" | xargs  -I% curl -s 'https://maps.googleapis.com/maps/api/geocode/json?latlng='%'&sensor=true&key='$API_KEY| jq --unbuffered '.results[0].formatted_address'
