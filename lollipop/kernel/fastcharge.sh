#!/sbin/sh
#fastcharge.sh by AKToronto
#Features: 
#Activates Force Fastcharge over the kernels cmdline

#get Fastcharge setting
val=$(cat /tmp/aroma-data/fast.prop | cut -d"=" -f2)
case $val in
  1)
    #on
    fstcfg="1"
    ;;
  2)
    #off
    fstcfg="0"
    ;;
esac


#Add fstcfg to the kernels cmdline.
cmdline=$(cat /tmp/boot.img-cmdline)
searchString="fstcfg="
fstcfg="fstcfg="$fstcfg
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/fstcfg=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $fstcfg>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $fstcfg>/tmp/boot.img-cmdline
	;;
esac
#end fstcfg

