##Get governor from aroma tmp
val=$(cat /tmp/aroma-data/gov.prop | cut -d"=" -f2)
case $val in
  1)
    gov="intellimm"
    ;;
  2)
    gov="intellidemand"
    ;;
  3)
    gov="interactive"
    ;;
  4)
    gov="intelliactive"
    ;;
  5)
    gov="elementalx"
    ;;
  6)
    gov="ondemand"
    ;;
  7)
    gov="conservative"
    ;;
  8)
    gov="userspace"
    ;;
  9)
    gov="powersave"
    ;;
  10)
    gov="performance"
    ;;
esac
##end Get governor from aroma tmp

#Add gov to the kernels cmdline.
cmdline=$(cat /tmp/boot.img-cmdline)
searchString="gov="
gov="gov="$gov
case $cmdline in
  "$searchString"* | *" $searchString"*)
       echo $(cat /tmp/boot.img-cmdline | sed -e 's/gov=[^ ]\+//')>/tmp/boot.img-cmdline
       echo $(cat /tmp/boot.img-cmdline)\ $gov>/tmp/boot.img-cmdline
       ;;  
  *)
       echo $(cat /tmp/boot.img-cmdline)\ $gov>/tmp/boot.img-cmdline
       ;;
esac
#end gov
