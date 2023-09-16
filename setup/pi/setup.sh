delete mac from pi when unpaired from host

sudo raspi-config nonint do_expand_rootfs
sudo dpkg-reconfigure cloud-init
sudo rm -rf /etc/cloud/ && sudo rm -rf /var/lib/cloud/
sudo raspi-config nonint do_hostname flow-$EPOCHSECONDS
sudo apt update && sudo apt upgrade -y
sudo apt install pipx network-manager python3-pip python3-venv python3-dev net-tools i2c-tools raspi-config python3-setuptools bluez libbluetooth-dev bluetooth libbluetooth-dev bluez-test-scripts bluez-tools python3-bluez -y

sudo pip3 install git+https://github.com/pybluez/pybluez.git#egg=pybluez
sudo pip3 install RPi.GPIO

mkdir /etc/systemd/system/bluetooth.service.d
vi /etc/systemd/system/bluetooth.service.d/override.conf

with the following content:

[Service]
ExecStart=
ExecStart=/usr/lib/bluetooth/bluetoothd -C

bluetoothctl power off
echo "* 0000" > /tmp/bluetooth.cfg
bluetoothctl power on
bluetoothctl discoverable on
sudo hciconfig hci0 sspmode 0
sudo bt-agent -c NoInputNoOutput -p /tmp/bluetooth.cfg


 bluetoothctl power on
  285  bluetoothctl advertisable on
  286  bluetoothctl help
  287  bluetoothctl advertise on
  288  sudo hciconfig hci0 piscan
  289  sudo python3 s.py 

 sudo ip link set dev wlan0 up
  318  ip address
  319  nmcli d
  320  sudo apt  install network-manager
  321  nmcli d
  322  nmcli r wifi on
  323  sudo nmcli r wifi on
  324  nmcli d
  325  sudo nmcli d wifi connect firewall-a password 
  326  nmcli d
  327  ip a
