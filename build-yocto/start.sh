#!/bin/bash

set -e
echo '>>>>>>>>>>>>> Build Start >>>>>>>>>>>>>'
branch=$1
echo "选择分支" ${branch:=hardknott_with_ros2}
sudo git clone https://github.com/zffgithub/tegra-demo-distro.git -b $branch
sudo chown build:build -R tegra-demo-distro
cd tegra-demo-distro
sudo chmod -R 777 .git
sudo git submodule update --init
sudo rm -rf build/
# not build in root
# sudo chmod -R 777 ../tegra-demo-distro/
. ./setup-env --machine jetson-xavier-nx-devkit --distro tegrademo-mender
bitbake demo-image-full
echo '>>>>>>>>>>>>> Build Finish >>>>>>>>>>>>>'
