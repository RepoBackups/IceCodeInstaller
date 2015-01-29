#!/sbin/sh
#undervolt.sh by AKToronto
#Features: 
#activate or disable QCOM min voltage table over the kernels cmdline

#get Uvolt setting
val=$(cat /tmp/aroma-data/uvolt.prop | cut -d"=" -f2)
case $val in
  1)
    #on
    uvt="1"
    ;;
  2)
    #off
    uvt="0"
    ;;
esac


#Add Uvolt to the kernels cmdline.
cmdline=$(cat /tmp/boot.img-cmdline)
searchString="uvt="
uvt="uvt="$uvt
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/uvt=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $uvt>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $uvt>/tmp/boot.img-cmdline
	;;
esac
#end Uvolt

