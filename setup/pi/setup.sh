sudo raspi-config nonint do_expand_rootfs
sudo dpkg-reconfigure cloud-init
sudo rm -rf /etc/cloud/ && sudo rm -rf /var/lib/cloud/
sudo raspi-config nonint do_hostname flow-$EPOCHSECONDS
sudo apt update && sudo apt upgrade -y
sudo apt install python3-pip python3-venv python3-dev net-tools i2c-tools raspi-config python3-setuptools bluez libbluetooth-dev bluetooth libbluetooth-dev bluez-test-scripts bluez-tools python3-bluez -y

echo "* 0000" > /tmp/bluetooth.cfg

bluetoothctl power on
bluetoothctl discoverable on
sudo hciconfig hci0 sspmode 0
bt-agent -c NoInputNoOutput -p /root/bluetooth.cfg
