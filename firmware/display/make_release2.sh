#!/bin/bash
echo " "
echo "Start building the release files (using Pyton 2 environment)"
echo " "
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
pyenv shell 2.7.18
python --version
pip --version
echo "python init done"
mkdir release
make clean
sleep 1
make default MOTOR_TSDZ2=1 DISPLAY_OLED_1.3_SPI=1
cp _build/firmware_ota* release
exit
make clean
sleep 1
make default MOTOR_TSDZ2=1 DISPLAY_OLED_1.3_I2C=1
cp _build/firmware_ota* release
make clean
sleep 1
make default MOTOR_TSDZ2=1 DISPLAY_OLED_0.96_SPI=1
cp _build/firmware_ota* release
make clean
sleep 1
make default MOTOR_TSDZ2=1 DISPLAY_OLED_0.96_I2C=1
cp _build/firmware_ota* release
make clean
sleep 1
make default MOTOR_BAFANG=1 DISPLAY_OLED_1.3_SPI=1
cp _build/firmware_ota* release
echo " "
echo "Done! - find files on 'release' folder"
echo " "

