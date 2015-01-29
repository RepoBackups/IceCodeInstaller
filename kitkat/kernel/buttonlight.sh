#!/sbin/sh
#buttonlight.sh by AKToronto
#Features: 
#activate BLN over the kernels cmdline

#get BLN setting
val=$(cat /tmp/aroma-data/button.prop | cut -d"=" -f2)
case $val in
  1)
    #on
    blncfg="1"
    ;;
  2)
    #off
    blncfg="0"
    ;;
esac


#Add blncfg to the kernels cmdline.
cmdline=$(cat /tmp/boot.img-cmdline)
searchString="blncfg="
blncfg="blncfg="$blncfg
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/blncfg=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $blncfg>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $blncfg>/tmp/boot.img-cmdline
	;;
esac
#end blncfg

