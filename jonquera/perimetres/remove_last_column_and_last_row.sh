#!/bin/bash

#perimeter=perimeter_2_grass_raster.asc
#burnedValue="12"
perimeter=${1}
burnedValue=${2}

head -n -1 ${perimeter} > ${perimeter}_temp
mv -f ${perimeter}_temp ${perimeter}
wc -l ${perimeter} 
#1131 ${perimeter}

cat ${perimeter} | awk '{$NF="";sub(/[ \t]+$/,"")}1' > ${perimeter}_temp
mv -f ${perimeter}_temp ${perimeter}

sed -i 's/0/-1/g' ${perimeter}
sed -i -e 's/-1/-1\n/g' -e "s/${burnedValue}/${burnedValue}\n/g" ${perimeter}
sed -i 's/ -1/-1/g' ${perimeter}
sed -i '/^[[:space:]]*$/d'  ${perimeter}

sed -i -e 's/north:/north: 4709070/g' -e 's/south:/south: 4675290/g' -e 's/east:/east: 528810/g' -e 's/west:/west: 480420/g' -e 's/rows:/rows: 1125/g' -e 's/cols:/cols: 1612/g' ${perimeter}  

sort -u ${perimeter}

wc -l ${perimeter} 

exit 0;
