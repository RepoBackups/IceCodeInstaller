#!/sbin/sh
#cmdline.sh by show-p1984
#Features: 
#maxkhz/minkhz/gov/maxscroff/gpuoc added to the kernels cmdline
#read values from aroma temp files
#clean cmdline of foreigns in case of something wicked is going on in there
#(supports my kernel edits, so that the kernel boots with that values)

##Get maxkhz from aroma tmp
val=$(cat /tmp/aroma-data/maxkhz.prop | cut -d"=" -f2)
case $val in
  1)
    maxkhz="1512000"
    ;;
  2)
    maxkhz="1674000"
    ;;
  3)
    maxkhz="1728000"
    ;;
esac
##end Get maxkhz from aroma tmp

##Get minkhz from aroma tmp
#val=$(cat /tmp/aroma-data/minkhz.prop | cut -d"=" -f2)
#case $val in
#  1)
#    minkhz=384000
#    ;;
#esac
##end Get minkhz from aroma tmp

##Get scroff from aroma tmp
#val=$(cat /tmp/aroma-data/scroff.prop | cut -d"=" -f2)
#case $val in
#  1)
#    maxscroff=384000
#    ;;
#  2)
#    maxscroff=486000
#    ;;
#  3)
#    maxscroff=594000
#    ;;
#esac
##end Get scroff from aroma tmp

##Get 2d gpuoc from aroma tmp
val=$(cat /tmp/aroma-data/twodgpu.prop | cut -d"=" -f2)
case $val in
  1)
    twodgpu="200000000"
    ;;
  2)
    twodgpu="266667000"
    ;;
  3)
    twodgpu="300000000"
    ;;
  4)
    twodgpu="320000000"
    ;;
esac
##end Get gpuoc from aroma tmp

##Get 3d gpuoc from aroma tmp
val=$(cat /tmp/aroma-data/threedgpu.prop | cut -d"=" -f2)
case $val in
  1)
    threedgpu="400000000"
    ;;
  2)
    threedgpu="436364000"
    ;;
  3)
    threedgpu="480000000"
    ;;
  4)
    threedgpu="512000000"
    ;;
esac
##end Get gpuoc from aroma tmp

##Get governor from aroma tmp
#val=$(cat /tmp/aroma-data/gov.prop | cut -d"=" -f2)
#case $val in
#  1)
#    gov="intellidemand"
#    ;;
#  2)
#    gov="interactive"
#    ;;
#  3)
#    gov="intelliactive"
#    ;;
#  4)
#    gov="ondemand"
#    ;;
#  5)
#    gov="conservative"
#    ;;
#  6)
#    gov="userspace"
#    ;;
#  7)
#    gov="powersave"
#    ;;
#  8)
#    gov="performance"
#    ;;
#esac
##end Get governor from aroma tmp

#clean cmdline from foreigns. failsafe
#needed since some cmdlines are full of rubbish :)
#sed -i 's/androidboot\.bootloader=3\.34[^$]*$/androidboot.bootloader=3.34/g' /tmp/boot.img-cmdline
#sed -i 's/androidboot\.bootloader=3\.41[^$]*$/androidboot.bootloader=3.41/g' /tmp/boot.img-cmdline

#Add maxkhz to the kernels cmdline.
cmdline=$(cat /tmp/boot.img-cmdline)
searchString="maxkhz="
maxkhz="maxkhz="$maxkhz
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/maxkhz=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $maxkhz>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $maxkhz>/tmp/boot.img-cmdline
	;;
esac
#end maxkhz

#Add minkhz to the kernels cmdline.
#cmdline=$(cat /tmp/boot.img-cmdline)
#searchString="minkhz="
#minkhz="minkhz="$minkhz
#case $cmdline in
#  "$searchString"* | *" $searchString"*)
#   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/minkhz=[^ ]\+//')>/tmp/boot.img-cmdline
#	echo $(cat /tmp/boot.img-cmdline)\ $minkhz>/tmp/boot.img-cmdline
#	;;  
#  *)
#	echo $(cat /tmp/boot.img-cmdline)\ $minkhz>/tmp/boot.img-cmdline
#	;;
#esac
#end minkhz

#Add gov to the kernels cmdline.
#cmdline=$(cat /tmp/boot.img-cmdline)
#searchString="gov="
#gov="gov="$gov
#case $cmdline in
#  "$searchString"* | *" $searchString"*)
#   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/gov=[^ ]\+//')>/tmp/boot.img-cmdline
#	echo $(cat /tmp/boot.img-cmdline)\ $gov>/tmp/boot.img-cmdline
#	;;  
#  *)
#	echo $(cat /tmp/boot.img-cmdline)\ $gov>/tmp/boot.img-cmdline
#	;;
#esac
#end gov

#Add maxscroff to the kernels cmdline.
#cmdline=$(cat /tmp/boot.img-cmdline)
#searchString="maxscroff="
#maxscroff="maxscroff="$maxscroff
#case $cmdline in
#  "$searchString"* | *" $searchString"*)
#   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/maxscroff=[^ ]\+//')>/tmp/boot.img-cmdline
#	echo $(cat /tmp/boot.img-cmdline)\ $maxscroff>/tmp/boot.img-cmdline
#	;;  
#  *)
#	echo $(cat /tmp/boot.img-cmdline)\ $maxscroff>/tmp/boot.img-cmdline
#	;;
#esac
#end maxscroff

#Add 2dgpuoc to the kernels cmdline.
cmdline=$(cat /tmp/boot.img-cmdline)
searchString="twodgpu="
twodgpu="twodgpu="$twodgpu
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/twodgpu=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $twodgpu>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $twodgpu>/tmp/boot.img-cmdline
	;;
esac
#end 2dgpuoc

#Add 3dgpuoc to the kernels cmdline.
cmdline=$(cat /tmp/boot.img-cmdline)
searchString="threedgpu="
threedgpu="threedgpu="$threedgpu
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/threedgpu=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $threedgpu>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $threedgpu>/tmp/boot.img-cmdline
	;;
esac
#end 3dgpuoc


