find /Unsorted/new/Photos/ -iname "*jpg" | head -10 | perl -pe 's{^(.*)$}{http://netgear.rohidekar.com:44452$1}g'
