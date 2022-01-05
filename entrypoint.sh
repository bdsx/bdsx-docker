
cd /root/bdsx
if [ ! -d ./bdsx ]
then
    git pull upstream master
fi
rm /tmp/.X0-lock 2> /dev/null
Xvfb :0 &
export DISPLAY=:0
BDSX_YES=true npm i
BDSX_YES=true BDSX_PERMANENT=true ./bdsx.sh
