#xargs --delimiter "\n" -n 1 sh geotag.sh
ARG="$@"
OUT=`echo $ARG | perl -pe 's{^(.*)$}{<img src="$1" height=150><br>}g')`
OUT2=`echo $ARG | perl -pe 's{.*44452}{}g' | xargs -d "\n"  -n 1 sh geotag.sh`

#OUT2=i`sh geotag.sh $ARG`
echo $OUT
echo $OUT2
echo "<br><br>"
