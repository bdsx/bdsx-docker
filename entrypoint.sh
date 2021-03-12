
cd /root/bdsx
if [ ! -d ./bdsx ]
then
    git pull upstream master
fi
BDSX_YES=true ./bdsx.sh
